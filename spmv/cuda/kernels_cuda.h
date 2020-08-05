#ifndef KERNELS_CUDA_H
#define KERNELS_CUDA_H

#include "common.h"

// csr_spmv kernel extracted from the CUSP library v0.4.0
template <typename IndexType, typename ValueType, unsigned int VECTORS_PER_BLOCK, unsigned int THREADS_PER_VECTOR>
__launch_bounds__(VECTORS_PER_BLOCK * THREADS_PER_VECTOR,1)
__global__ void
spmv_csr_vector_kernel(const IndexType num_rows,
                       const IndexType * Ap,
                       const IndexType * Aj,
                       const ValueType * Ax,
                       const ValueType * x,
                       ValueType * y)
{
    __shared__ volatile ValueType sdata[VECTORS_PER_BLOCK * THREADS_PER_VECTOR + THREADS_PER_VECTOR / 2];  // padded to avoid reduction conditionals
    __shared__ volatile IndexType ptrs[VECTORS_PER_BLOCK][2];

    const IndexType THREADS_PER_BLOCK = VECTORS_PER_BLOCK * THREADS_PER_VECTOR;

    const IndexType thread_id   = THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;    // global thread index
    const IndexType thread_lane = threadIdx.x & (THREADS_PER_VECTOR - 1);          // thread index within the vector
    const IndexType vector_id   = thread_id   /  THREADS_PER_VECTOR;               // global vector index
    const IndexType vector_lane = threadIdx.x /  THREADS_PER_VECTOR;               // vector index within the block
    const IndexType num_vectors = VECTORS_PER_BLOCK * gridDim.x;                   // total number of active vectors

    for(IndexType row = vector_id; row < num_rows; row += num_vectors)
    {
        // use two threads to fetch Ap[row] and Ap[row+1]
        // this is considerably faster than the straightforward version
        if(thread_lane < 2)
            ptrs[vector_lane][thread_lane] = Ap[row + thread_lane];

        const IndexType row_start = ptrs[vector_lane][0];                   //same as: row_start = Ap[row];
        const IndexType row_end   = ptrs[vector_lane][1];                   //same as: row_end   = Ap[row+1];

        // initialize local sum
        ValueType sum = 0;

        if (THREADS_PER_VECTOR == 32 && row_end - row_start > 32)
        {
            // ensure aligned memory access to Aj and Ax

            IndexType jj = row_start - (row_start & (THREADS_PER_VECTOR - 1)) + thread_lane;

            // accumulate local sums
            if(jj >= row_start && jj < row_end)
                sum += Ax[jj] * x[ Aj[jj] ];

            // accumulate local sums
            for(jj += THREADS_PER_VECTOR; jj < row_end; jj += THREADS_PER_VECTOR)
                sum += Ax[jj] * x[ Aj[jj] ];
        }
        else
        {
            // accumulate local sums
            for(IndexType jj = row_start + thread_lane; jj < row_end; jj += THREADS_PER_VECTOR)
                sum += Ax[jj] * x[ Aj[jj] ];
        }

        // store local sum in shared memory
        sdata[threadIdx.x] = sum;

        // reduce local sums to row sum
        if (THREADS_PER_VECTOR > 16) sdata[threadIdx.x] = sum = sum + sdata[threadIdx.x + 16];
        if (THREADS_PER_VECTOR >  8) sdata[threadIdx.x] = sum = sum + sdata[threadIdx.x +  8];
        if (THREADS_PER_VECTOR >  4) sdata[threadIdx.x] = sum = sum + sdata[threadIdx.x +  4];
        if (THREADS_PER_VECTOR >  2) sdata[threadIdx.x] = sum = sum + sdata[threadIdx.x +  2];
        if (THREADS_PER_VECTOR >  1) sdata[threadIdx.x] = sum = sum + sdata[threadIdx.x +  1];

        // first thread writes the result
        if (thread_lane == 0)
            y[row] = sdata[threadIdx.x];
    }
}
#endif // KERNELS_CUDA_H
