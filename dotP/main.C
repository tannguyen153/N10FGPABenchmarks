#include "common.h"
#include "common_args.h"
#include <cstdlib>
#include <omp.h>

int n_platform;
int n_device;
extern cl_device_id device_id;
cl_context context;
string kernelName;

void createBuffer(const cl_context* p_context, cl_mem* ptr, const size_t num_bytes, const cl_mem_flags flags, const char* buff_name)
{
    cl_int err;
    char err_msg[128];
    *ptr = clCreateBuffer(*p_context, flags,num_bytes, NULL, &err);
    snprintf(err_msg,88,"Failed to allocate device memory for %s!",buff_name);
}

void dotP_cl(int m, value_type *A, value_type *x, value_type sum_ref)
{
    size_t items_read;
    cl_int err;
    double gb = (double)((2* m * sizeof(value_type)));
    double gflop = (double)(2 * m);

    cl_command_queue write_queue;
    cl_command_queue read_queue;
    cl_command_queue commands;
    cl_program program;
    cl_kernel kernel;
    cl_mem ap, xp, sum;
    cl_event kernel_exec,ap_write,xp_write,sum_read, sum_write;

    ocd_initCL();

    FILE* kernel_fp = fopen(kernelName.c_str(),"r");
    if(kernel_fp == NULL){
	fprintf(stderr,"Cannot open kernel file: dotP_kernel.aocx");
	exit(-1);
    }
    fseek(kernel_fp, 0, SEEK_END);
    size_t kernelLength = (size_t) ftell(kernel_fp);
    char* kernelSource = (char*)malloc(sizeof(char)*kernelLength);
    rewind(kernel_fp);
    items_read = fread((void *) kernelSource, kernelLength, 1, kernel_fp);
    if(items_read != 1){
	fprintf(stderr,"Error reading from kernelFile");
	exit(-1);
    }
    fclose(kernel_fp);
    program = clCreateProgramWithBinary(context,1,&device_id,&kernelLength,(const unsigned char**)&kernelSource,NULL,&err);

    CHKERR(err, "Failed to create the program from source!");
    err = clBuildProgram(program, 0, NULL, "", NULL, NULL);
    CHKERR(err, "Failed to build the program!");
    free(kernelSource);

    const char * kernel_name= "dotP";
    kernel = clCreateKernel(program, kernel_name, &err);
    CHKERR(err, "Failed to create a compute kernel!");

    createBuffer(&context,&xp,sizeof(value_type)*m, CL_MEM_READ_ONLY | CL_CHANNEL_1_INTELFPGA,"x");
    createBuffer(&context,&ap,sizeof(value_type)*m, CL_MEM_READ_ONLY | CL_CHANNEL_2_INTELFPGA,"A");
    createBuffer(&context,&sum,sizeof(value_type)*1, CL_MEM_READ_ONLY | CL_CHANNEL_2_INTELFPGA,"sum_cl");
    commands = clCreateCommandQueue(context, device_id, 0, &err);//re-assigned every time (ocd_initCL has already done this)
    CHKERR(err, "Failed to create a command queue!");

    write_queue = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);
    CHKERR(err, "Failed to create a command queue!");
    read_queue = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);
    CHKERR(err, "Failed to create a command queue!");
    err = clEnqueueWriteBuffer(write_queue, ap, CL_FALSE, 0, sizeof(value_type)*m, A, 0, NULL, &ap_write);
    CHKERR(err, "Failed to write to source array!");
    err = clEnqueueWriteBuffer(write_queue, xp, CL_FALSE, 0, sizeof(value_type)*m, x, 0, NULL, &xp_write);
    CHKERR(err, "Failed to write to source array!");
    value_type sumInit=0.0;
    err = clEnqueueWriteBuffer(write_queue, sum, CL_FALSE, 0, sizeof(value_type), &sumInit, 0, NULL, &sum_write);
    CHKERR(err, "Failed to write to source array!");

    clFinish(write_queue);

    for(int i=0; i<NUM_RUN; i++) //repeat Host-Device transfer, kernel execution, and device-host transfer num_execs times
    {                                               //to gather multiple samples of data
	//number of threads has to be divisible by WG_SIZE
	mytimer cl_timer;
	cl_timer.start();
    	err = clSetKernelArg(kernel, 0, sizeof(int), &m);
	err |= clSetKernelArg(kernel, 1, sizeof(cl_mem), &ap);
	err |= clSetKernelArg(kernel, 2, sizeof(cl_mem), &xp);
	err |= clSetKernelArg(kernel, 3, sizeof(cl_mem), &sum);
  	CHKERR(err, "Failed to set kernel arguments!");

	/* Enqueue Kernels */
	err = clEnqueueTask(commands, kernel, 0, NULL, &kernel_exec);


   	clFinish(commands);
	double clTime = cl_timer.stop();

	value_type sum_cl=0.0;
	/* Read back the results from the device to verify the output */
	err = clEnqueueReadBuffer(read_queue, sum, CL_FALSE, 0, sizeof(value_type), &sum_cl, 1, &kernel_exec, &sum_read);
	clFinish(read_queue);

	cout << "CL execution time = " << clTime
	    << " ms. Bandwidth = " << gb/(1.0e+6 * clTime)
	    << " GB/s. GFlops = " << gflop/(1.0e+6 * clTime)  << " GFlops." << endl << endl;

	cout << endl << "Checking FPGA DotProduct Correctness ... ";

	bool error= fabs((sum_cl-sum_ref)/sum_cl)>0.001;
	if (error)
	    cout << "NO PASS. CPU SUM = " << sum_ref << " VS CL SUM " << sum_cl;
	else
	    cout << "PASS! TOTAL SUM "<<sum_cl;
	cout << endl;
    }
    /* Shutdown and cleanup */
    err = clReleaseMemObject(ap);
    err = clReleaseMemObject(xp);
    clReleaseContext(context);
}

int dotP(int aSize)
{
    int err = 0;
    cout << "RUN DotProduct " << NUM_RUN << " times" << endl;

    int ret_code;
    int m= aSize;

    value_type *A = (value_type *)malloc(m * sizeof(value_type));
    value_type *x = (value_type *)malloc(m * sizeof(value_type));

    double gb = (double)(2 * m * sizeof(value_type));
    double gflop = (double)(2 * m);

    srand(time(NULL));
    for (int i = 0; i < m; i++)
    {
	A[i] = 1.0;//static_cast <value_type> (rand()) / static_cast <value_type> (RAND_MAX);
	x[i] = 1.0;//static_cast <value_type> (rand()) / static_cast <value_type> (RAND_MAX);
    }

    // compute cpu results
    mytimer ref_timer;
    ref_timer.start();

    #pragma omp parallel
    {
	if(omp_get_thread_num()==0)cout<<"Execution with "<<omp_get_num_threads()<<" Threads"<<endl;
    }

    int ref_iter = 1;
    value_type sum;
    for (int iter = 0; iter < ref_iter; iter++)
    {
	sum=0.0;
	#pragma omp parallel for reduction(+:sum)
	for (int i = 0; i < m; i++)
	{
	    sum += A[i] * x[i];
	}
    }

    double ref_time = ref_timer.stop() / (double)ref_iter;
    cout << "cpu OpenMP time = " << ref_time
	<< " ms. Bandwidth = " << gb/(1.0e+6 * ref_time)
	<< " GB/s. GFlops = " << gflop/(1.0e+6 * ref_time)  << " GFlops." << endl << endl;

    dotP_cl(m, A, x, sum);

    free(A);
    free(x);
    return err;
}

int main(int argc, char ** argv)
{
    int arraySize=0;
    if(argc ==3)
    {
	kernelName= argv[1];
	arraySize = atoi(argv[2]);
	printf("Running with array size %ld\n", arraySize);
    }else if(argc ==2){
	kernelName= argv[1];
	int defaultSize= 819200; // 4PEs * BLOCKSIZE of 2048 * 100
	arraySize=defaultSize;
	printf("Running with default size %ld\n", defaultSize);
    }if (argc==1){
	kernelName= "dotP_kernel_swi4PEs_BS2048_UF128.aocx";
	int defaultSize= 819200; // 4PEs * BLOCKSIZE of 2048 * 100
	arraySize=defaultSize;
	printf("Running with default size %ld and default kernel dotP_kernel_swi4PEs_BS2048_UF128.aocx\n", defaultSize);
    }else{
	 printf("Usage: ./dotP kernelName arraySize\n");
	 exit(0);
    }
    printf("Please make sure that array size is divisible by PE*BLOCKSIZE making up the kernel\n");
    int err = dotP(arraySize);
    return err;
}
