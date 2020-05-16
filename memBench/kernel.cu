#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#define TYPE float
#define WARP_SIZE 32
#define THREADS_PER_BLOCK 512
#define NWARPS THREADS_PER_BLOCK/WARP_SIZE
#define ENABLE_READ 0
#define ENABLE_READWRITE 1
#define TEST_RANDOMICITY 0
#if TEST_RANDOMICITY==1
#define RANDOM_SEGMENTS 1
#define RANDOM_ELEMENTS 0
#endif

#define TEST_SCRATCHPAD 1
#if TEST_SCRATCHPAD==1
#define ONCHIP_BUFFERSIZE 512
#endif


#include <curand.h>
#include <curand_kernel.h>

#if ENABLE_READ==1
__inline__ __device__
TYPE warpSumReduction(TYPE val) {
    for (int offset = WARP_SIZE/2; offset > 0; offset /= 2)
        val += __shfl_down(val, offset);
    return val;
}
#endif

__global__ void kernel(TYPE *mat, TYPE *val, unsigned long num_thread_blocks,unsigned long num_segments, unsigned long num_elements, int ntimes) 
{
    static __shared__ TYPE psum[32];
    int lane = threadIdx.x % WARP_SIZE;
    int wid = threadIdx.x / WARP_SIZE;
    int dataBlockSize= num_segments*num_elements;
    int gidx = blockIdx.x*dataBlockSize;
#if TEST_SCRATCHPAD==1
    __shared__ TYPE data[NWARPS][ONCHIP_BUFFERSIZE];
    for (int i= lane; i < ONCHIP_BUFFERSIZE; i+=WARP_SIZE)
	data[wid][i]=0;
#endif

    TYPE tmp_val=0;
#if TEST_RANDOMICITY==1
    for(unsigned long j0=wid; j0<num_segments; j0+=NWARPS)
    {
        unsigned long j= (j0+ wid*NWARPS)%num_segments;
#else
    for(unsigned long j=wid; j<num_segments; j+=NWARPS)
    {
#endif
        unsigned long start=gidx+j*num_elements;
        unsigned long stop= start+num_elements;
	#if TEST_SCRATCHPAD==1
        for (unsigned long i = start; i < stop; i+=ONCHIP_BUFFERSIZE) {
            //load part of the segment from HBM to scratchpad
	    for (unsigned long i0 = lane; i0 < ONCHIP_BUFFERSIZE && i+i0<stop; i0+=WARP_SIZE)
   	        data[wid][i0]= mat[i+i0];
	    for(int r=0; r<ntimes; r++){
		for (unsigned long i0 = lane; i0 < ONCHIP_BUFFERSIZE; i0+=WARP_SIZE){
	            data[wid][i0]+=1.0; 
		}
	    }
	    //store the data back to HBM
	    for (unsigned long i0 = lane; i0 < ONCHIP_BUFFERSIZE && i+i0<stop; i0+=WARP_SIZE)
	    {
		mat[i+i0]= data[wid][i0];
//		if(wid==0 && lane==0)printf("Final value at %ul is %f\n", i+i0, data[wid][i0]);
	    }
	}
	#else
        for(int r=0; r<ntimes; r++)
            for (unsigned long i = start+ lane; i < stop; i+=WARP_SIZE) {
   	        #if ENABLE_READ==1
	        tmp_val += mat[i]; 
	        #elif ENABLE_READWRITE==1
	        tmp_val =  mat[i]+1.0;
	        mat[i]= tmp_val;
	        #endif
        }
	#endif
    }

#if ENABLE_READ==1
    tmp_val = warpSumReduction(tmp_val);
    if (lane==0) psum[wid]=tmp_val;
    __syncthreads();
    tmp_val = (threadIdx.x < blockDim.x / WARP_SIZE) ? psum[lane] : 0;
    if (wid==0){
        tmp_val = warpSumReduction(tmp_val);
        if(threadIdx.x==0)atomicAdd(val, tmp_val);
    }
#elif ENABLE_READWRITE==1 
#endif
}


//we don't want to set VEC_LENGTH to 1, as it will trigger the optimizer that caches data in register instead of shared memory in some certain cases
#define VEC_LENGTH 2
#define VECS_PER_WARP WARP_SIZE/VEC_LENGTH
#define NVECS NWARPS*VECS_PER_WARP
//The padding alignment is to avoid bank conflict
#define LOW_ONCHIP_BUFFERSIZE 32+VEC_LENGTH
__global__ void kernel_lowLocality(TYPE *mat, TYPE *val, unsigned long num_thread_blocks,unsigned long num_segments, unsigned long num_elements, int ntimes)
{
    static __shared__ TYPE psum[32];
    int warp_lane = threadIdx.x % WARP_SIZE;
    int warp_id= threadIdx.x/WARP_SIZE;
    int lane = threadIdx.x % VEC_LENGTH;
    int wid= threadIdx.x/VEC_LENGTH;
    unsigned long dataBlockSize= num_segments*num_elements;
    unsigned long gidx = blockIdx.x*dataBlockSize;
#if TEST_SCRATCHPAD==1
    __shared__ TYPE data[NVECS][LOW_ONCHIP_BUFFERSIZE];
    for (int i= lane; i < LOW_ONCHIP_BUFFERSIZE; i+=VEC_LENGTH)
	data[wid][i]=0;
#endif

    TYPE tmp_val=0;
#if TEST_RANDOMICITY==1
    for(unsigned long j0=wid; j0<num_segments; j0+=NVECS)
    {
        unsigned long j= (j0+ wid*NVECS)%num_segments;
#else
    for(unsigned long j=wid; j<num_segments; j+=NVECS)
    {
#endif
        unsigned long start=gidx+j*num_elements;
        unsigned long stop= start+num_elements;
        #if TEST_SCRATCHPAD==1
        for (unsigned long i = start; i < stop; i+=LOW_ONCHIP_BUFFERSIZE) {
            //load part of the segment from HBM to scratchpad
            for (unsigned long i0 = lane; i0 < LOW_ONCHIP_BUFFERSIZE && i+i0<stop; i0+=VEC_LENGTH)
                data[wid][i0]= mat[i+i0];
	    if(num_elements<LOW_ONCHIP_BUFFERSIZE){
                for(int r=0; r<ntimes; r++)
                    for (unsigned long i0 = lane; i0 < num_elements; i0+=VEC_LENGTH)
                        data[wid][i0]+=1.0;
	    }else{
                for(int r=0; r<ntimes; r++)
                    for (unsigned long i0 = lane; i0 < LOW_ONCHIP_BUFFERSIZE; i0+=VEC_LENGTH)
                        data[wid][i0]+=1.0;
	    }
            //store the data back to HBM
            for (unsigned long i0 = lane; i0 < LOW_ONCHIP_BUFFERSIZE && i+i0<stop; i0+=VEC_LENGTH)
	    {
                mat[i+i0]= data[wid][i0];
	    }
        }
	#else
        for(int r=0; r<ntimes; r++)
           for (unsigned long i = start+ lane; i < stop; i+=VEC_LENGTH) {
	        #if ENABLE_READ==1
                tmp_val += mat[i];
	        #elif ENABLE_READWRITE==1
                tmp_val =mat[i]+1.0;
                mat[i]= tmp_val;
	        #endif
           }
	#endif
    }
#if ENABLE_READ==1
    tmp_val = warpSumReduction(tmp_val);
    if (warp_lane==0) psum[warp_id]=tmp_val;
    __syncthreads();
    tmp_val = (threadIdx.x < blockDim.x / WARP_SIZE) ? psum[warp_lane] : 0;
    if (warp_id==0)
    {
        tmp_val = warpSumReduction(tmp_val);
        if(threadIdx.x==0)atomicAdd(val, tmp_val);
    }
#elif ENABLE_READWRITE==1
#endif
}


#define LARGE_VEC_LENGTH 64
#define N_LARGE_VECS NWARPS*WARP_SIZE/LARGE_VEC_LENGTH
#define HIGH_ONCHIP_BUFFERSIZE 1024

__global__ void kernel_extremeLocality(TYPE *mat, TYPE *val, unsigned long num_thread_blocks,unsigned long num_segments, unsigned long num_elements, int ntimes)
{
    static __shared__ TYPE psum[32];
    int lane = threadIdx.x % LARGE_VEC_LENGTH;
    int wid = threadIdx.x / LARGE_VEC_LENGTH;
    int dataBlockSize= num_segments*num_elements;
    int gidx = blockIdx.x*dataBlockSize;
#if TEST_SCRATCHPAD==1
    __shared__ TYPE data[N_LARGE_VECS][HIGH_ONCHIP_BUFFERSIZE];
    for (int i= lane; i < HIGH_ONCHIP_BUFFERSIZE; i+=LARGE_VEC_LENGTH)
	data[wid][i]=0;
#endif


    TYPE tmp_val=0;
#if TEST_RANDOMICITY==1
    for(unsigned long j0=wid; j0<num_segments; j0+=N_LARGE_VECS)
    {
        unsigned long j= (j0+ wid*N_LARGE_VECS)%num_segments;
#else
    for(unsigned long j=wid; j<num_segments; j+=N_LARGE_VECS)
    {
#endif
        unsigned long start=gidx+j*num_elements;
        unsigned long stop= start+num_elements;
        #if TEST_SCRATCHPAD==1
        for (unsigned long i = start; i < stop; i+=ONCHIP_BUFFERSIZE) {
            //load part of the segment from HBM to scratchpad
            for (unsigned long i0 = lane; i0 < HIGH_ONCHIP_BUFFERSIZE && i+i0<stop; i0+=LARGE_VEC_LENGTH)
                data[wid][i0]= mat[i+i0];
            for(int r=0; r<ntimes; r++){
                for (unsigned long i0 = lane; i0 < HIGH_ONCHIP_BUFFERSIZE; i0+=LARGE_VEC_LENGTH){
                    data[wid][i0]+=1.0;
                }
            }
            //store the data back to HBM
            for (unsigned long i0 = lane; i0 < HIGH_ONCHIP_BUFFERSIZE && i+i0<stop; i0+=LARGE_VEC_LENGTH)
		mat[i+i0]= data[wid][i0];
        }
        #else
        for(int r=0; r<ntimes; r++)
           for (unsigned long i = start+ lane; i < stop; i+=LARGE_VEC_LENGTH) {
	    #if ENABLE_READ==1
               tmp_val += mat[i];
	       #elif ENABLE_READWRITE==1
               tmp_val =mat[i]+1.0;
               mat[i]= tmp_val;
	    #endif
           }
	#endif
    }
    #if ENABLE_READ==1
    tmp_val = warpSumReduction(tmp_val);
    if (lane==0) psum[wid]=tmp_val;
    __syncthreads();
    tmp_val = (threadIdx.x < blockDim.x / WARP_SIZE) ? psum[lane] : 0;
    if (wid==0){
        tmp_val = warpSumReduction(tmp_val);
        if(threadIdx.x==0)atomicAdd(val, tmp_val);
    }
#elif ENABLE_READWRITE==1
#endif
}


void cudaKernel(TYPE *d_mat, TYPE *d_val, unsigned long num_thread_blocks, unsigned long num_segments, unsigned long num_elements, int ntimes)
{
    if(num_elements<=256){
	std::cout<<"Low Locality: Breaking each warp to subwarps"<< std::endl;
	kernel_lowLocality<<< num_thread_blocks, THREADS_PER_BLOCK >>>(d_mat, d_val, num_thread_blocks, num_segments, num_elements, ntimes);
    }
    else{
	if(num_segments<32){
	    std::cout<<"High Locality: Breaking each warp to subwarps"<< std::endl;
	    kernel_extremeLocality<<< num_thread_blocks, THREADS_PER_BLOCK >>>(d_mat, d_val, num_thread_blocks, num_segments, num_elements, ntimes);
	}else kernel<<< num_thread_blocks, THREADS_PER_BLOCK >>>(d_mat, d_val, num_thread_blocks, num_segments, num_elements, ntimes);
    }
    cudaDeviceSynchronize();

#ifdef DEBUG
    TYPE *val= new TYPE;
    cudaMemcpy(val, d_val, 1 * sizeof(TYPE), cudaMemcpyDeviceToHost);
    std::cout<<"Final sum"<< *val<<std::endl;
    free(val);
#endif
}
