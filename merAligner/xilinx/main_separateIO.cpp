#include "kernel.hpp"
#include <cmath>
#include <fstream>
#include <iostream>
#include <omp.h>
#include <sstream>
#include <string>
#include <vector>
#include <numeric>

#ifdef USE_CUDA
#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/scan.h>
#elif defined(USE_OCL)

#include <CL/cl.h>
    #define CHKERR(err, str) \
    if (err != CL_SUCCESS) \
    { \
        fprintf(stdout, "CL Error %d: %s\n", err, str); \
        exit(1); \
    }
#define WORKERS 72
#include "common_args.h"
struct mytimer {
    timeval t1, t2;
    struct timezone tzone;

    void start() {
        gettimeofday(&t1, &tzone);
    }

    double stop() {
        gettimeofday(&t2, &tzone);
        double elapsedTime = 0;
        elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000.0;      // sec to ms
        elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000.0;   // us to ms
        return elapsedTime;
    }
};
volatile int flag=0;


int n_platform;
int n_device;
extern cl_device_id device_id;
cl_context context;
cl_command_queue commands[WORKERS], command_loadAB0,command_loadAB1,command_loadAB2,command_loadAB3, commands_rev[WORKERS], command_results;
int num_wg_sizes=1;
#endif

using namespace std;
#include <unistd.h>

int
main(int argc, char* argv[])
{
#ifdef USE_CUDA
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    cudaDeviceProp prop[deviceCount];
    for(int i = 0; i < deviceCount; i++)
        cudaGetDeviceProperties(&prop[i], 0);

    for(int i = 0; i < deviceCount; i++)
    {
        cout << "total Global Memory available on Device: " << i
             << " is:" << prop[i].totalGlobalMem << endl;
    }
#elif defined(USE_OCL)
    int deviceCount=1;
    size_t totalMem=1048576;
#endif

    vector<string> G_sequencesA,
        G_sequencesB;  // sequence A is the longer one/reference string

    string   myInLine;
    ifstream ref_file(argv[1]);   //"./test_data/ref_file_1.txt"
    ifstream quer_file(argv[2]);  //"./test_data/que_file_1.txt"
    unsigned largestA = 0, largestB = 0;

    int totSizeA = 0, totSizeB = 0;
    if(ref_file.is_open())
    {
        while(getline(ref_file, myInLine))
        {
            string seq = myInLine.substr(myInLine.find(":") + 1, myInLine.size() - 1);
            G_sequencesA.push_back(seq);
            totSizeA += seq.size();
            if(seq.size() > largestA)
            {
                largestA = seq.size();
            }
        }
    }
    
    if(quer_file.is_open())
    {
        while(getline(quer_file, myInLine))
        {
            string seq = myInLine.substr(myInLine.find(":") + 1, myInLine.size() - 1);
            G_sequencesB.push_back(seq);
            totSizeB += seq.size();
            if(seq.size() > largestB)
            {
                largestB = seq.size();
            }
        }
    }
    unsigned NBLOCKS = G_sequencesA.size();

    cout << "total alignments input:" << NBLOCKS << endl;
    unsigned maxMatrixSize = (largestA + 1) * (largestB + 1);
    cout << "length of Longest Ref String:" << largestA
         << "\nlength of longest Query String:" << largestB << endl;
    // number of alignments per device

    unsigned alignmentsPerDevice = NBLOCKS / deviceCount;
    unsigned leftOver_device     = NBLOCKS % deviceCount;
    unsigned maxAligns           = alignmentsPerDevice + leftOver_device;

    long long totMemEst = largestA * (long) maxAligns + largestB * (long) maxAligns +
                          maxMatrixSize * (long) maxAligns * sizeof(short) * 2 +
                          (long) maxAligns * sizeof(short) * 4;
    // mem est per device
    cout << "Max Alignments Per Device:" << maxAligns << "est Mem" << totMemEst<<endl;
    // determining number of iterations required on a single GPUassert
    long long estMem = totMemEst;
#ifdef USE_CUDA
    int       its    = ceil(estMem / (prop[0].totalGlobalMem * 0.95));
#elif defined(USE_OCL)
    int       its    = 1000000/1000000;//ceil(estMem / totalMem);
#endif

    short* g_alAbeg = new short[NBLOCKS];
    short* g_alBbeg = new short[NBLOCKS];
    short* g_alAend = new short[NBLOCKS];
    short* g_alBend = new short[NBLOCKS];  // memory on CPU for copying the results

    short* test_Abeg = g_alAbeg;
    short* test_Bbeg = g_alBbeg;
    short* test_Aend = g_alAend;
    short* test_Bend = g_alBend;
    auto   start     = NOW;
#pragma omp parallel 
//num_threads(2)
    {
        int totThreads = omp_get_num_threads();
        //  cout <<"total threads:"<< totThreads<<endl;
        int my_cpu_id = omp_get_thread_num();

#if 0
if(my_cpu_id==1){
#pragma omp barrier
while(flag==0){
usleep(1000);
system("fpgainfo power >> power_res");
}
#pragma omp barrier

}{
#endif

#ifdef USE_CUDA
        cudaSetDevice(my_cpu_id);
        int myGPUid;
        cudaGetDevice(&myGPUid);
#elif defined(USE_OCL)
        // Create a compute context
        cl_int err;

	cl_command_queue write_queue;
        cl_command_queue read_queue;
        cl_program program;
        cl_kernel kernel_loadAB0, kernel_loadAB1,kernel_loadAB2,kernel_loadAB3, kernels[WORKERS], kernels_rev[WORKERS], kernel_results;
	ocd_initCL();

        FILE* kernel_fp = fopen("./aligner_3Loaders_72w_PB1M_Direct.aocx","r");
        if(kernel_fp == NULL){
            fprintf(stderr,"Cannot open kernel file: kernel.cl");
            exit(-1);
        }
        fseek(kernel_fp, 0, SEEK_END);
        size_t kernelLength = (size_t) ftell(kernel_fp);
        char* kernelSource = (char*)malloc(sizeof(char)*kernelLength);
        rewind(kernel_fp);
        size_t items_read = fread((void *) kernelSource, kernelLength, 1, kernel_fp);
        if(items_read != 1){
            fprintf(stderr,"Error reading from kernelFile");
            exit(-1);
        }
        fclose(kernel_fp);

        program = clCreateProgramWithBinary(context, 1, &device_id, &kernelLength, (const unsigned char**)&kernelSource,NULL,&err);
        CHKERR(err, "Failed to create the program!");

        err = clBuildProgram(program, 1, &device_id, NULL, NULL, NULL);

        CHKERR(err, "Failed to build the program!");
        free(kernelSource);

for(int w=0; w<WORKERS; w++)
{
	char name[50];
	sprintf(name, "sw%d", w);
        kernels[w] = clCreateKernel(program, name, &err);
	sprintf(name,"sw_rev%d", w);
        kernels_rev[w] = clCreateKernel(program, name, &err);
}
        kernel_loadAB0 = clCreateKernel(program, "loadAB0", &err);
        kernel_loadAB1 = clCreateKernel(program, "loadAB1", &err);
        kernel_loadAB2 = clCreateKernel(program, "loadAB2", &err);
#if 0
        kernel_loadAB3 = clCreateKernel(program, "loadAB3", &err);
#endif
        kernel_results = clCreateKernel(program, "storeResults", &err);
        CHKERR(err, "Failed to create a compute kernel!");
    write_queue = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);
    CHKERR(err, "Failed to create a command queue!");
for(int w=0; w<WORKERS; w++)
{
    commands[w] = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
    commands_rev[w] = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
}
    command_loadAB0 = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
    command_loadAB1 = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
    command_loadAB2 = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
#if 0
    command_loadAB3 = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
#endif
    command_results = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
    CHKERR(err, "Failed to create a command queue!");
    read_queue = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);
    CHKERR(err, "Failed to create a command queue!");
	
#endif
        int BLOCKS_l = alignmentsPerDevice;
        if(my_cpu_id == deviceCount - 1)
            BLOCKS_l += leftOver_device;

        unsigned leftOvers    = BLOCKS_l % its;
        unsigned stringsPerIt = BLOCKS_l / its;

        short* alAbeg = g_alAbeg + my_cpu_id * alignmentsPerDevice;
        short* alBbeg = g_alBbeg + my_cpu_id * alignmentsPerDevice;
        short* alAend = g_alAend + my_cpu_id * alignmentsPerDevice;
        short* alBend =
            g_alBend +
            my_cpu_id * alignmentsPerDevice;  // memory on CPU for copying the results

	printf("number of pairs processed at a time %d\n", stringsPerIt);


#ifdef USE_CUDA
        short *alAbeg_d, *alBbeg_d, *alAend_d, *alBend_d;
        short *  I_i, *I_j;  // device pointers for traceback matrices
                             // double *matrix, *Ematrix, *Fmatrix;
        thrust::host_vector<int>        offsetA(stringsPerIt + leftOvers);
        thrust::host_vector<int>        offsetB(stringsPerIt + leftOvers);
        thrust::device_vector<unsigned> vec_offsetA_d(stringsPerIt + leftOvers);
        thrust::device_vector<unsigned> vec_offsetB_d(stringsPerIt + leftOvers);

        unsigned* offsetA_d = thrust::raw_pointer_cast(&vec_offsetA_d[0]);
        unsigned* offsetB_d = thrust::raw_pointer_cast(&vec_offsetB_d[0]);

        cudaErrchk(
            cudaMalloc(&I_i, maxMatrixSize * (stringsPerIt + leftOvers) * sizeof(short)));
        cudaErrchk(
            cudaMalloc(&I_j, maxMatrixSize * (stringsPerIt + leftOvers) * sizeof(short)));

        // copy back
        cudaErrchk(cudaMalloc(&alAbeg_d, (stringsPerIt + leftOvers) * sizeof(short)));
        cudaErrchk(cudaMalloc(&alBbeg_d, (stringsPerIt + leftOvers) * sizeof(short)));
        cudaErrchk(cudaMalloc(&alAend_d, (stringsPerIt + leftOvers) * sizeof(short)));
        cudaErrchk(cudaMalloc(&alBend_d, (stringsPerIt + leftOvers) * sizeof(short)));
#elif defined(USE_OCL)
        cl_mem  I_i, I_j;  // device pointers for traceback matrices
	cl_mem offsetA_d, offsetB_d;
                             // double *matrix, *Ematrix, *Fmatrix;
	int*        offsetA= new int[stringsPerIt + leftOvers];
        int*        offsetB= new int[stringsPerIt + leftOvers];

	char err_msg[128];
	I_i= clCreateBuffer(context, CL_MEM_READ_WRITE, maxMatrixSize * (stringsPerIt + leftOvers) * sizeof(int),  NULL, &err);
	I_j= clCreateBuffer(context, CL_MEM_READ_WRITE, maxMatrixSize * (stringsPerIt + leftOvers) * sizeof(int),  NULL, &err);
	offsetA_d= clCreateBuffer(context, CL_MEM_READ_WRITE, (stringsPerIt + leftOvers) *sizeof(int), NULL , &err);
	offsetB_d= clCreateBuffer(context, CL_MEM_READ_WRITE, (stringsPerIt + leftOvers) *sizeof(int), NULL , &err);
        cl_mem alAbeg_d,alBbeg_d,alAend_d,alBend_d;
        alAbeg_d= clCreateBuffer(context, CL_MEM_READ_WRITE, (stringsPerIt + leftOvers) * sizeof(short),  NULL, &err);
        alBbeg_d= clCreateBuffer(context, CL_MEM_READ_WRITE, (stringsPerIt + leftOvers) * sizeof(short),  NULL, &err);
        alAend_d= clCreateBuffer(context, CL_MEM_READ_WRITE, (stringsPerIt + leftOvers) * sizeof(short),  NULL, &err);
        alBend_d= clCreateBuffer(context, CL_MEM_READ_WRITE, (stringsPerIt + leftOvers) * sizeof(short),  NULL, &err);
#endif

        cout << "Iterations per GPU:"<<its<<endl;
        auto start2 = NOW;
        double kernelTime=0;
        for(int perGPUIts = 0; perGPUIts < its; perGPUIts++)
        {
	    printf("Executing transacion %d\n", perGPUIts);
            int                            blocksLaunched = 0;
            vector<string>::const_iterator beginAVec;
            vector<string>::const_iterator endAVec;
            vector<string>::const_iterator beginBVec;
            vector<string>::const_iterator endBVec;
            if(perGPUIts == its - 1)
            {
                beginAVec = G_sequencesA.begin() + ((alignmentsPerDevice * my_cpu_id) +
                                                    perGPUIts * stringsPerIt);
                endAVec =
                    G_sequencesA.begin() +
                    ((alignmentsPerDevice * my_cpu_id) + (perGPUIts + 1) * stringsPerIt) +
                    leftOvers;  // so that each openmp thread has a copy of strings it
                                // needs to align
                beginBVec = G_sequencesB.begin() + ((alignmentsPerDevice * my_cpu_id) +
                                                    perGPUIts * stringsPerIt);
                endBVec =
                    G_sequencesB.begin() +
                    ((alignmentsPerDevice * my_cpu_id) + (perGPUIts + 1) * stringsPerIt) +
                    leftOvers;  // so that each openmp thread has a copy of strings it
                                // needs to align

                blocksLaunched = stringsPerIt + leftOvers;
            }
            else
            {
                beginAVec = G_sequencesA.begin() + ((alignmentsPerDevice * my_cpu_id) +
                                                    perGPUIts * stringsPerIt);
                endAVec =
                    G_sequencesA.begin() + (alignmentsPerDevice * my_cpu_id) +
                    (perGPUIts + 1) * stringsPerIt;  // so that each openmp thread has a
                                                     // copy of strings it needs to align
                beginBVec = G_sequencesB.begin() + ((alignmentsPerDevice * my_cpu_id) +
                                                    perGPUIts * stringsPerIt);
                endBVec =
                    G_sequencesB.begin() + (alignmentsPerDevice * my_cpu_id) +
                    (perGPUIts + 1) * stringsPerIt;  // so that each openmp thread has a
                                                     // copy of strings it needs to align
                blocksLaunched = stringsPerIt;
            }
//	    printf("number of block launched %d\n", blocksLaunched);

            vector<string> sequencesA(beginAVec, endAVec);
            vector<string> sequencesB(beginBVec, endBVec);

#if USE_CUDA
            for(int i = 0; i < sequencesA.size(); i++)
            {
                offsetA[i] = sequencesA[i].size();
            }
            for(int i = 0; i < sequencesB.size(); i++)
            {
                offsetB[i] = sequencesB[i].size();
            }
#elif defined(USE_OCL)
            offsetA[0] = sequencesA[0].size();
            for(int i = 1; i < sequencesA.size(); i++)
            {
                offsetA[i] = offsetA[i-1] + sequencesA[i].size();
//		    printf("Offset A i %d is %d\n", i, offsetA[i]);
            }
            offsetB[0] = sequencesB[0].size();
            for(int i = 1; i < sequencesB.size(); i++)
            {
                offsetB[i] = offsetB[i-1] + sequencesB[i].size();
//		    printf("Offset B i %d is %d\n", i, offsetB[i]);
            }
#endif

            // auto start    = NOW;

            for(int i = 0; i < 1; i++)
            {
#if USE_CUDA
                vec_offsetA_d = offsetA;
                vec_offsetB_d = offsetB;
                //  cout << "*******here here1" << endl;
                thrust::inclusive_scan(vec_offsetA_d.begin(), vec_offsetA_d.end(),
                                       vec_offsetA_d.begin());
                thrust::inclusive_scan(vec_offsetB_d.begin(), vec_offsetB_d.end(),
                                       vec_offsetB_d.begin());
                unsigned totalLengthA = vec_offsetA_d[sequencesA.size() - 1];
                unsigned totalLengthB = vec_offsetB_d[sequencesB.size() - 1];
#elif defined(USE_OCL)
                unsigned totalLengthA = offsetA[sequencesA.size() - 1];
                unsigned totalLengthB = offsetB[sequencesB.size() - 1];
#endif

                unsigned offsetSumA = 0;
                unsigned offsetSumB = 0;

                char* strA = new char[totalLengthA];
                char* strB = new char[totalLengthB];
                for(int i = 0; i < sequencesA.size(); i++)
                {
                    char* seqptrA =
                        strA + offsetSumA;  // vec_offsetA_d[i] - sequencesA[i].size();
                    memcpy(seqptrA, sequencesA[i].c_str(), sequencesA[i].size());

                    char* seqptrB =
                        strB + offsetSumB;  // vec_offsetB_d[i] - sequencesB[i].size();
                    memcpy(seqptrB, sequencesB[i].c_str(), sequencesB[i].size());
//		if(i<1000)printf("Seq %d of %d, %d Total length A and B %d %d\n", i, sequencesA.size(), sequencesB.size(), sequencesA[i].size(), sequencesB[i].size());
                    offsetSumA += sequencesA[i].size();
                    offsetSumB += sequencesB[i].size();
                }
#if 1


#if USE_CUDA
                char *strA_d, *strB_d;
                cudaErrchk(cudaMalloc(&strA_d, totalLengthA * sizeof(char)));
                cudaErrchk(cudaMalloc(&strB_d, totalLengthB * sizeof(char)));

                cudaErrchk(cudaMemcpy(strA_d, strA, totalLengthA * sizeof(char),
                                      cudaMemcpyHostToDevice));
                cudaErrchk(cudaMemcpy(strB_d, strB, totalLengthB * sizeof(char),
                                      cudaMemcpyHostToDevice));

                unsigned totShmem = 3 * 3 * (largestB + 1) * sizeof(short) +
                                    3 * largestB + (largestB & 1) + largestA;
                //  cout << "shmem:" << totShmem << endl;
                unsigned alignmentPad = 4 + (4 - totShmem % 4);

                align_sequences_gpu<<<blocksLaunched, largestB,
                                      totShmem + alignmentPad +
                                          sizeof(int) * (largestA + largestB + 2)>>>(
                    strA_d, strB_d, offsetA_d, offsetB_d, maxMatrixSize, I_i, I_j,
                    alAbeg_d, alAend_d, alBbeg_d, alBend_d);

                cudaErrchk(cudaMemcpy(alAbeg, alAbeg_d, blocksLaunched * sizeof(short),
                                      cudaMemcpyDeviceToHost));
                //  cout <<"this 1 copied back"<<endl;
                cudaErrchk(cudaMemcpy(alBbeg, alBbeg_d, blocksLaunched * sizeof(short),
                                      cudaMemcpyDeviceToHost));
                //    cout <<"this 2 copied back"<<endl;
                cudaErrchk(cudaMemcpy(alAend, alAend_d, blocksLaunched * sizeof(short),
                                      cudaMemcpyDeviceToHost));
                cudaErrchk(
                    cudaMemcpy(alBend, alBend_d, blocksLaunched * sizeof(short),
                               cudaMemcpyDeviceToHost));  // this does not cause the error
                                                          // the other three lines do.

                //}
                alAbeg += stringsPerIt;  // perGPUIts;//*stringsPerIt;
                alBbeg += stringsPerIt;  //;//*stringsPerIt;
                alAend += stringsPerIt;  //;//*stringsPerIt;
                alBend += stringsPerIt;  //;//*stringsPerIt;
                cudaErrchk(cudaFree(strA_d));
                cudaErrchk(cudaFree(strB_d));
#elif defined(USE_OCL)
printf("BLOCK LAUNCH %d\n",blocksLaunched);
                cl_mem strA_d, strB_d;
		cl_event read,write,kernel_exec;
                char err_msg[128];
                strA_d= clCreateBuffer(context, CL_MEM_READ_WRITE, totalLengthA * sizeof(char),  NULL, &err);
                strB_d= clCreateBuffer(context, CL_MEM_READ_WRITE, totalLengthB * sizeof(char),  NULL, &err);
printf("Total size %d\n", totalLengthA+totalLengthB+ sequencesA.size()*8);
	        err = clEnqueueWriteBuffer(write_queue, strA_d, CL_FALSE, 0, totalLengthA * sizeof(char), strA, 0, NULL, &write);
	        err = clEnqueueWriteBuffer(write_queue, strB_d, CL_FALSE, 0, totalLengthB * sizeof(char), strB, 0, NULL, &write);
	        err = clEnqueueWriteBuffer(write_queue, offsetA_d, CL_FALSE, 0, sequencesA.size() * sizeof(int), offsetA, 0, NULL, &write);
	        err = clEnqueueWriteBuffer(write_queue, offsetB_d, CL_FALSE, 0, sequencesB.size() * sizeof(int), offsetB, 0, NULL, &write);
        	clFinish(write_queue);

	        err |= clSetKernelArg(kernel_loadAB0, 0, sizeof(cl_mem), &strA_d);
	        err |= clSetKernelArg(kernel_loadAB0, 1, sizeof(cl_mem), &strB_d);
	        err |= clSetKernelArg(kernel_loadAB0, 2, sizeof(cl_mem), &offsetA_d);
	        err |= clSetKernelArg(kernel_loadAB0, 3, sizeof(cl_mem), &offsetB_d);
	        err |= clSetKernelArg(kernel_loadAB1, 0, sizeof(cl_mem), &strA_d);
	        err |= clSetKernelArg(kernel_loadAB1, 1, sizeof(cl_mem), &strB_d);
	        err |= clSetKernelArg(kernel_loadAB1, 2, sizeof(cl_mem), &offsetA_d);
	        err |= clSetKernelArg(kernel_loadAB1, 3, sizeof(cl_mem), &offsetB_d);
	        err |= clSetKernelArg(kernel_loadAB2, 0, sizeof(cl_mem), &strA_d);
	        err |= clSetKernelArg(kernel_loadAB2, 1, sizeof(cl_mem), &strB_d);
	        err |= clSetKernelArg(kernel_loadAB2, 2, sizeof(cl_mem), &offsetA_d);
	        err |= clSetKernelArg(kernel_loadAB2, 3, sizeof(cl_mem), &offsetB_d);
#if 0
	        err |= clSetKernelArg(kernel_loadAB3, 0, sizeof(cl_mem), &strA_d);
	        err |= clSetKernelArg(kernel_loadAB3, 1, sizeof(cl_mem), &strB_d);
	        err |= clSetKernelArg(kernel_loadAB3, 2, sizeof(cl_mem), &offsetA_d);
	        err |= clSetKernelArg(kernel_loadAB3, 3, sizeof(cl_mem), &offsetB_d);
#endif

	        err |= clSetKernelArg(kernel_results, 0, sizeof(cl_mem), &alAbeg_d);
	        err |= clSetKernelArg(kernel_results, 1, sizeof(cl_mem), &alAend_d);
	        err |= clSetKernelArg(kernel_results, 2, sizeof(cl_mem), &alBbeg_d);
	        err |= clSetKernelArg(kernel_results, 3, sizeof(cl_mem), &alBend_d);
        	CHKERR(err, "Failed to set kernel arguments!");

#pragma omp barrier
        mytimer cl_timer;
        cl_timer.start();
		err = clEnqueueTask(command_loadAB0, kernel_loadAB0, 0, NULL, &kernel_exec);
		err = clEnqueueTask(command_loadAB1, kernel_loadAB1, 0, NULL, &kernel_exec);
		err = clEnqueueTask(command_loadAB2, kernel_loadAB2, 0, NULL, &kernel_exec);
#if 0
		err = clEnqueueTask(command_loadAB3, kernel_loadAB3, 0, NULL, &kernel_exec);
#endif
for(int w=0; w<WORKERS; w++)
{
		err |= clEnqueueTask(commands[w], kernels[w], 0, NULL, &kernel_exec);
		err |= clEnqueueTask(commands_rev[w], kernels_rev[w], 0, NULL, &kernel_exec);
}
		err |= clEnqueueTask(command_results, kernel_results, 0, NULL, &kernel_exec);

		CHKERR(err, "Failed to execute kernel!");
        	clFinish(command_loadAB0);
        	clFinish(command_loadAB1);
        	clFinish(command_loadAB2);
#if 0
        	clFinish(command_loadAB3);
#endif
for(int w=0; w<WORKERS; w++)
{
        	clFinish(commands[w]);
        	clFinish(commands_rev[w]);
}
        	clFinish(command_results);
        double clTime = cl_timer.stop();
flag=1;
#pragma omp barrier
        kernelTime += clTime;

                err = clEnqueueReadBuffer(read_queue, alAbeg_d, CL_FALSE, 0,  blocksLaunched * sizeof(short), alAbeg, 0, NULL, &read);
                err |= clEnqueueReadBuffer(read_queue, alBbeg_d, CL_FALSE, 0, blocksLaunched * sizeof(short), alBbeg, 0, NULL, &read);
                err |= clEnqueueReadBuffer(read_queue, alAend_d, CL_FALSE, 0, blocksLaunched * sizeof(short), alAend, 0, NULL, &read);
                err |= clEnqueueReadBuffer(read_queue, alBend_d, CL_FALSE, 0, blocksLaunched * sizeof(short), alBend, 0, NULL, &read);
        	clFinish(read_queue);
        	CHKERR(err, "Failed to copy data back!");
		
                alAbeg += stringsPerIt;  // perGPUIts;//*stringsPerIt;
                alBbeg += stringsPerIt;  //;//*stringsPerIt;
                alAend += stringsPerIt;  //;//*stringsPerIt;
                alBend += stringsPerIt;  //;//*stringsPerIt;

		err = clReleaseMemObject(strA_d);
		err |= clReleaseMemObject(strB_d);
        	CHKERR(err, "Failed to release memory!");
#endif
#endif
            }
        }  // for iterations end here
        auto                     end1  = NOW;
        chrono::duration<double> diff2 = end1 - start2;
        cout << "Device: " << my_cpu_id << " Total Time:" << diff2.count() << endl;
        cout<< "Kernel time "<< kernelTime/1000<<endl;

#if USE_CUDA
        cudaErrchk(cudaFree(I_i));
        cudaErrchk(cudaFree(I_j));
        cudaErrchk(cudaFree(alAbeg_d));
        cudaErrchk(cudaFree(alBbeg_d));
        cudaErrchk(cudaFree(alAend_d));
        cudaErrchk(cudaFree(alBend_d));
#elif defined(USE_OCL)
	err = clReleaseMemObject(I_i);
	err |= clReleaseMemObject(I_j);
	err |= clReleaseMemObject(alAbeg_d);
	err |= clReleaseMemObject(alBbeg_d);
	err |= clReleaseMemObject(alAend_d);
	err |= clReleaseMemObject(alBend_d);
	err |=clReleaseContext(context);
        //CHKERR(err, "Failed to release memory!");
#endif

//#pragma omp barrier
    }  // paralle pragma ends

    auto                     end  = NOW;
    chrono::duration<double> diff = end - start;

    cout << "Total time:" << diff.count() << endl;
    string   rstLine;
    ifstream rst_file(argv[3]);
    int      k = 0, errors = 0;
    if(rst_file.is_open())
    {
        while(getline(rst_file, rstLine))
        {
            string      in = rstLine.substr(rstLine.find(":") + 1, rstLine.size() - 1);
            vector<int> valsVec;

            stringstream myStream(in);

            int val;
            while(myStream >> val)
            {
                valsVec.push_back(val);
                if(myStream.peek() == ',')
                    myStream.ignore();
            }

            int ref_st  = valsVec[0];
            int ref_end = valsVec[1];
            int que_st  = valsVec[2];
            int que_end = valsVec[3];

            if(/*test_Abeg[k] != ref_st ||*/ test_Aend[k] != ref_end ||
               /*test_Bbeg[k] != que_st ||*/ test_Bend[k] != que_end)
            {
                  cout << "k:"<<k<<" startA=" << test_Abeg[k] << ", endA=" <<
                  test_Aend[k]<<" startB=" << test_Bbeg[k] << ", endB=" <<
                  test_Bend[k]<<endl;
                    cout << "corr:"<<k<<" corr_strtA=" << ref_st << ", corr_endA=" <<
                    ref_end<<" corr_startB=" << que_st << ", corr_endB=" <<
                    que_end<<endl;
		 
                errors++;
                // cout <<"error at:"<<k<<endl;
            }
            //  cout <<ref_st<<" "<<ref_end<<" "<<ref_st<<" "<<ref_end<<endl;
            k++;
        }
        if(errors == 0)
            cout << "VERIFICATION TEST PASSED" << endl;
	else 
            cout << "VERIFICATION FAILED: " <<errors<<"DIFFERENCES" <<endl;
    }
//}

    return 0;
}
