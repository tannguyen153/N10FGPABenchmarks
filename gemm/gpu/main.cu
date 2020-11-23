#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <math.h>
#include <cuda.h>
#include <vector>
using namespace std;
volatile int flag;
#include <omp.h>
#ifdef USE_NVML
  #include <nvml.h>
#endif
#include <unistd.h>
#define BLOCK_SIZE 128
#ifdef REPS
#define REPEATS REPS
#else 
#define REPEATS 10
#endif

#ifdef USE_NVML
static inline double GetPowerGPU(int DeviceID)
{       
    nvmlDevice_t device;
    nvmlReturn_t error;
    unsigned int power;
    size_t count = 0, powerSum = 0;

    // Initialize NVML library
    error = nvmlInit();  
    if (error != NVML_SUCCESS)
    {       
	printf("Failed to initialize NVML API with error code \"%s\".\n", nvmlErrorString(error));
#pragma omp barrier
	return -1;
    }

    // Get device handle
    error = nvmlDeviceGetHandleByIndex(DeviceID , &device);
    if (error != NVML_SUCCESS)
    {       
	printf("Failed to get device handle with error code \"%s\".\n", nvmlErrorString(error));
#pragma omp barrier
	return -1;
    }

#pragma omp barrier
    while(flag == 0)
    {       
	// Returns device power usage in mWatt
	error = nvmlDeviceGetPowerUsage(device, &power);
	if(error != NVML_SUCCESS)
	{
	    printf("Failed to get device power usage with error code \"%s\".\n", nvmlErrorString(error));
	    return -1;
	}
	powerSum = powerSum + power;
	count++;
	usleep(10);
    }
#pragma omp barrier

    error = nvmlShutdown();
    if (error != NVML_SUCCESS)
    {
	printf("Failed to shutdown NVML API with error code \"%s\".\n", nvmlErrorString(error));
	return -1;
    }

    return (double)(powerSum)/(double)(count * 1000.0); // Wattage is in mWatt, hence the division by 1000
}
#endif

#include <sys/time.h>
#include <stdio.h>
const double kMicro = 1.0e-6;
extern double getTime()
{
    struct timeval TV;

    const int RC = gettimeofday(&TV, NULL);
    if(RC == -1)
    {
	printf("ERROR: Bad call to gettimeofday\n");
	return(-1);
    }

    return( ((double)TV.tv_sec) + kMicro * ((double)TV.tv_usec) );

}  // end getTime()

/////
//KERNEL
/////
#define WPT_Y 8             // The work-per-thread
#define WPT_X 8            // The work-per-thread
#define RTS_Y (BLOCK_SIZE/WPT_Y)        // The reduced tile-size
#define RTS_X (BLOCK_SIZE/WPT_X)        // The reduced tile-size
#define TK    32
#define nLoads ((BLOCK_SIZE*TK)/(RTS_X*RTS_Y))

__global__ void  matrixMult( float  *C, float  *A, float *B, int A_width, int B_width)
{
    int K= A_width;
    // Local storage for a block of input matrices A and B
    __shared__ float  A_local[TK][BLOCK_SIZE];
    __shared__ float  B_local[TK][BLOCK_SIZE];
    // Block index
    int block_x = blockIdx.x;
    int block_y = blockIdx.y;

    // Local ID index (offset within a block)
    int local_x = threadIdx.x;
    int local_y = threadIdx.y;
    float  acc[WPT_Y][WPT_X];
    //float  Breg[WPT_X];
    for (int wm=0; wm<WPT_Y; wm++) {
	for (int wn=0; wn<WPT_X; wn++) {
	    acc[wm][wn] = 0.0f;
	}
    }

    int numKtiles= K/TK;

    for(int t= 0; t<numKtiles; t++){ 
	for(int l=0; l<nLoads; l++){
	    int tid =local_y*RTS_Y + local_x;
	    int id = l*RTS_Y*RTS_X + tid;
	    int row = id%BLOCK_SIZE;
	    int col = id/BLOCK_SIZE;
	    int tiledIndex = TK*t + col;
	    A_local[col][row] = A[tiledIndex + A_width * (BLOCK_SIZE * block_y + row)];
	    B_local[col][row] = B[tiledIndex * B_width + (BLOCK_SIZE * block_x + row)];
	}
	__syncthreads();
	for (int k = 0; k < TK; k++)
	{
	    for (int wm=0; wm<WPT_Y; wm++) {
		float Areg = A_local[k][local_y + wm*RTS_Y];
		{
#if WPT_X==4
		    acc[wm][0] += Areg * B_local[h][k][local_x + 0*RTS_X];
		    acc[wm][1] += Areg * B_local[h][k][local_x + 1*RTS_X];
		    acc[wm][2] += Areg * B_local[h][k][local_x + 2*RTS_X];
		    acc[wm][3] += Areg * B_local[h][k][local_x + 3*RTS_X];
#elif WPT_X==8
		    acc[wm][0] += Areg * B_local[k][local_x + 0*RTS_X];
		    acc[wm][1] += Areg * B_local[k][local_x + 1*RTS_X];
		    acc[wm][2] += Areg * B_local[k][local_x + 2*RTS_X];
		    acc[wm][3] += Areg * B_local[k][local_x + 3*RTS_X];
		    acc[wm][4] += Areg * B_local[k][local_x + 4*RTS_X];
		    acc[wm][5] += Areg * B_local[k][local_x + 5*RTS_X];
		    acc[wm][6] += Areg * B_local[k][local_x + 6*RTS_X];
		    acc[wm][7] += Areg * B_local[k][local_x + 7*RTS_X];
#endif
		}
	    }
	}
	__syncthreads();
    }

    // Store result in matrix C
    int blockOffset= block_y *BLOCK_SIZE* A_width + block_x*BLOCK_SIZE;
    for (int wm=0; wm<WPT_Y; wm++) {
	int baseOffset= blockOffset+ (local_y+wm*RTS_Y)*A_width + local_x;
	for (int wn=0; wn<WPT_X; wn++) 
	{
	    C[baseOffset +  wn*RTS_X] = acc[wm][wn];
	}
    }
}


float* input_a_buf;
float* input_b_buf;
float* output_buf;

// Problem data.
int A_height = 32 * BLOCK_SIZE;
int A_width  = 16 * BLOCK_SIZE;
const int &B_height = A_width;
int B_width  = 16 * BLOCK_SIZE;
const int &C_height = A_height;
const int &C_width  = B_width;

float* input_a; 
float* input_b;
float* output; 
float* ref_output;

// Function prototypes
float rand_float();
bool init_cuda();
void init_problem();
void run(bool warmup, int repeats);
void compute_reference();
void verify();
void cleanup();

// Entry point.
int main(int argc, char **argv) {
    A_height = atoi(argv[1]);
    A_width  = atoi(argv[2]);
    B_width  = atoi(argv[3]);

    printf("Matrix sizes:\n  A: %d x %d\n  B: %d x %d\n  C: %d x %d\n",
	    A_height, A_width, B_height, B_width, C_height, C_width);

    // Spot check matrix sizes. They all must be a multiple of BLOCK_SIZE,
    // although it is relatively straightforward to handle non-multiples
    // by adding padding. For simplicity, this example does not pad.
    if((A_height % BLOCK_SIZE) != 0 || (A_width % BLOCK_SIZE) != 0 ||
	    (B_height % BLOCK_SIZE) != 0 || (B_width % BLOCK_SIZE) != 0 ||
	    (C_height % BLOCK_SIZE) != 0 || (C_width % BLOCK_SIZE) != 0) {
	printf("Matrix sizes must be a multiple of %d.\n", BLOCK_SIZE);
	return -1;
    }

    // Initialize OpenCL.
    cudaSetDevice(0);
    if(!init_cuda()) {
	return -1;
    }
    // Initialize the problem data.
    init_problem();

    run(false, 1); //warm up
    // Run the kernel.
    run(true, REPEATS);

    // Free the resources allocated
    cleanup();
    // check for error
    cudaError_t error = cudaGetLastError();
    if(error != cudaSuccess)
    {
	printf("CUDA error: %s\n", cudaGetErrorString(error));
	exit(-1);
    }

    return 0;
}

/////// HELPER FUNCTIONS ///////

// Randomly generate a floating-point number between -10 and 10.
float rand_float() {
    return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
}

// Initializes device objects.
bool init_cuda() {
    printf("Initializing CUDA\n");
    cudaMalloc(&input_a_buf, A_height * A_width * sizeof(float));
    cudaMalloc(&input_b_buf, B_height * B_width * sizeof(float));
    cudaMalloc(&output_buf, C_height * C_width * sizeof(float));
    return true;
}

// Initialize the data for the problem. 
void init_problem() {
    input_a= new float[A_height * A_width];
    input_b= new float[B_height * B_width];
    output= new float[C_height * C_width];
    printf("Generating input matrices\n");
    for(int j = 0; j < A_height * A_width; ++j) {
	input_a[j] = rand_float();
    }
    for(int i = 0; i < B_height * B_width; ++i) {
	input_b[i] = rand_float();
    }
}

void run(bool warmup, int repeats) {
    int A_size= A_height * A_width * sizeof(float);
    int B_size= B_height * B_width * sizeof(float);
    cudaMemcpy(input_a_buf, input_a, A_size, cudaMemcpyHostToDevice);
    cudaMemcpy(input_b_buf, input_b, B_size, cudaMemcpyHostToDevice);

    dim3 blockDim(RTS_X, RTS_Y, 1);
    dim3 gridDim((C_width/BLOCK_SIZE), (C_height/BLOCK_SIZE), 1);
    if(!warmup) printf("Dim block %d %d %d and grid %d %d", blockDim.x, blockDim.y, blockDim.z, gridDim.x, gridDim.y);
    flag=0;
    const double start_time = getTime();

#if USE_NVML  
    double power;
#pragma omp parallel num_threads(2) shared(flag)        
    {       
	if (omp_get_thread_num() == 1)
	{       
	    power = GetPowerGPU(0);
	}
	else
	{
#pragma omp barrier
for(int r=0; r<REPEATS; r++) 
{
    cudaDeviceSynchronize();
    matrixMult<<< gridDim, blockDim >>>(output_buf, input_a_buf, input_b_buf, B_width, A_width);
    cudaDeviceSynchronize();
}
    	    flag=1;
#pragma omp barrier
	}
    }
    double end_time = getTime();
    const double total_time = (end_time - start_time)/REPEATS;
if(!warmup)
{
    printf("Average power consumption is %0.3lf watts\n", power);
}
#else

for(int r=0; r<REPEATS; r++) 
{
    cudaDeviceSynchronize();
    matrixMult<<< gridDim, blockDim >>>(output_buf, input_a_buf, input_b_buf, B_width, A_width);
    cudaDeviceSynchronize();
}
    double end_time = getTime();
    const double total_time = (end_time - start_time)/REPEATS;
#endif

if(!warmup)
{
    // Wall-clock time taken.
    printf("\nTime: %0.3f ms\n", total_time * 1e3);

    // Compute the throughput (GFLOPS).
    const size_t flops = (float)(2.0f * C_width * C_height * A_width / total_time);
    printf("\nThroughput: %0.2f GFLOPS\n\n", flops * 1e-9);
}

    // Read the result.
    cudaMemcpy(output, output_buf, C_height * C_width * sizeof(float), cudaMemcpyDeviceToHost);

    // Verify results.
#ifdef VERIFY
    compute_reference();
    verify();
#endif
}

void compute_reference() {
    // Compute the reference output.
    ref_output= new float[C_height * C_width];

    for(int y = 0; y < C_height; ++y) {
	for(int x = 0; x < C_width; ++x) {
	    // Compute result for C(y, x)
	    float sum = 0.0f;
	    for(int k = 0; k < A_width; ++k) {
		sum += input_a[y * A_width + k] * input_b[k * B_width + x];
	    }
	    ref_output[y * C_width + x] = sum;
	}
    }
    printf("Computing reference output\n");
}

void verify() {
    printf("Verifying\n");
    bool pass = true;
    for(int y = 0; y < C_height; ++y) {
	for(int x = 0; x < C_width; ++x) {
	    const float o = output[y * C_width + x];
	    const float r = ref_output[y * C_width + x];
	    const float d = o - r;
	    if(d*d > 1e-3){ pass=false;
		//printf("Failed at x y %d %d and values are %f %f\n", x, y, o, r);
	    }
	}
    }
    free(ref_output);
    printf("Verification: %s\n", pass ? "PASS" : "FAIL");
}

// Free the resources allocated during initialization
void cleanup() {
    if(input_a_buf) {
	cudaFree(input_a_buf);
    }
    if(input_b_buf) {
	cudaFree(input_b_buf);
    }
    if(output_buf) {
	cudaFree(output_buf);
    }
    free(input_a);
    free(output);
    free(input_b);
}
