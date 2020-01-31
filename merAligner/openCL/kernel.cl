#define BLOCK_SIZE 128
#define SHAREMEM 2048
#pragma OPENCL EXTENSION cl_khr_initialize_memory : enable

#define EXTEND_GAP -2
#define START_GAP -2
#define MATCH 15
#define MISMATCH -3

inline short findMax(short array[], int length, int* ind)
{
    short max = array[0];
    *ind      = 0;

    for(int i = 1; i < length; i++)
    {
        if(array[i] > max)
        {
            max  = array[i];
            *ind = i;
        }
    }
    return max;
}

inline  short blockReduce(short myVal, short* myIndex, short* myIndex2, unsigned lengthSeqB)
{
    __local short cacheVal[BLOCK_SIZE];
    __local short cacheIdx[BLOCK_SIZE];
    __local short cacheIdx2[BLOCK_SIZE];
    __private size_t tid = get_global_id(0);
    int myTId = tid%BLOCK_SIZE;
    cacheVal[myTId]= myVal;
    cacheIdx[myTId]= *myIndex;
    cacheIdx2[myTId]= *myIndex2;
    int step=BLOCK_SIZE/2;
    barrier(CLK_LOCAL_MEM_FENCE);
    while(step>0){
        if(myTId < step)
            if(cacheVal[myTId]< cacheVal[myTId+step]){
	    	cacheVal[myTId]= cacheVal[myTId+step];
	    	cacheIdx[myTId]= cacheIdx[myTId+step];
	    	cacheIdx2[myTId]= cacheIdx2[myTId+step];
            }
	step= step/2;
        barrier(CLK_LOCAL_MEM_FENCE);
    }
    *myIndex= cacheIdx[0];
    *myIndex2= cacheIdx2[0];
    return cacheVal[0];
}

__attribute__((num_simd_work_items(16)))
__attribute__((reqd_work_group_size(128,1,1)))
__kernel 
void align_sequences_gpu(__global char* seqA_array, __global char* seqB_array, __global unsigned* prefix_lengthA,
                    __global unsigned* prefix_lengthB, unsigned maxMatrixSize, __global int* I_i_array,
                    __global int* I_j_array, __global short* seqA_align_begin, __global short* seqA_align_end,
                    __global short* seqB_align_begin, __global short* seqB_align_end)
{
    __private size_t tid = get_global_id(0);
    size_t gSize= get_global_size(0);
    int myId  = tid/BLOCK_SIZE;
    int myTId = tid%BLOCK_SIZE;
    unsigned lengthSeqA;
    unsigned lengthSeqB;
    // local pointers
    __global char*    seqA;
    __global char*    seqB;
    __global int* I_i;
    __global int* I_j;

    __local unsigned int is_valid_array[SHAREMEM];//table
    __local unsigned int myLocString[SHAREMEM];//read in
    __local unsigned int diagOffset[SHAREMEM];//diag offset

    if(myId == 0)
    {
        lengthSeqA   = prefix_lengthA[0];
        lengthSeqB   = prefix_lengthB[0];
        seqA         = seqA_array;
        seqB         = seqB_array;
        I_i          = I_i_array + (myId * maxMatrixSize);
        I_j          = I_j_array + (myId * maxMatrixSize);
    }
    else
    {
        lengthSeqA = prefix_lengthA[myId] - prefix_lengthA[myId - 1];
        lengthSeqB = prefix_lengthB[myId] - prefix_lengthB[myId - 1];
        seqA = seqA_array + prefix_lengthA[myId - 1];
        seqB = seqB_array + prefix_lengthB[myId - 1];
        I_i  = I_i_array + (myId * maxMatrixSize);
        I_j  = I_j_array + (myId * maxMatrixSize);
    }
    unsigned int curr_H_idx, prev_H_idx, prev_prev_H_idx, curr_E_idx, prev_E_idx, prev_prev_E_idx, curr_F_idx, prev_F_idx, prev_prev_F_idx;
    unsigned int is_valid_idx=0;

    curr_H_idx          = (3 * lengthSeqB + (lengthSeqB & 1));
    int curr_H_base= curr_H_idx;
    prev_H_idx          = curr_H_idx  + (lengthSeqB + 1);
    prev_prev_H_idx     = prev_H_idx  + (lengthSeqB + 1);

    curr_E_idx          = prev_prev_H_idx + (lengthSeqB + 1);
    prev_E_idx          = curr_E_idx      + (lengthSeqB + 1);
    prev_prev_E_idx     = prev_E_idx      + (lengthSeqB + 1);

    curr_F_idx          = prev_prev_E_idx + (lengthSeqB + 1);
    prev_F_idx          = curr_F_idx      + (lengthSeqB + 1);
    prev_prev_F_idx     = prev_F_idx      + (lengthSeqB + 1);

    for(int ii=myTId; ii<lengthSeqB; ii+= BLOCK_SIZE) is_valid_array[is_valid_idx+ii]=0;
    is_valid_idx += lengthSeqB;
    for(int ii=myTId; ii<lengthSeqB; ii+= BLOCK_SIZE) is_valid_array[is_valid_idx+ii]=1;
    is_valid_idx += lengthSeqB;
    for(int ii=myTId; ii<lengthSeqB; ii+= BLOCK_SIZE) is_valid_array[is_valid_idx+ii]=0;
    for(int ii=myTId; ii<9*(lengthSeqB+1); ii+= BLOCK_SIZE) is_valid_array[curr_H_idx+ii]=0;

    __local int i_max;
    __local int j_max;
    int            j            = myTId + 1;
    char           myColumnChar = seqB[j - 1];  // read only once

    ///////////locsl dtring read in
    for(int i = myTId; i < lengthSeqA; i += 32)
    {
        myLocString[i] = seqA[i];
    }

    barrier(CLK_LOCAL_MEM_FENCE);
    short            traceback[4];
    __local short iVal[4];  //= {-1,-1,0,0};
    __local short jVal[4];  //= {-1,0,-1,0};
    if(myTId == 0)
    {
        iVal[0] = -1;
        iVal[1] = -1;
        iVal[2] = 0;
        iVal[3] = 0;
        jVal[0] = -1;
        jVal[1] = 0;
        jVal[2] = -1;
        jVal[3] = 0;
    }
    barrier(CLK_LOCAL_MEM_FENCE);

    int ind;

    int   i            = 1;
    short thread_max   = 0;
    short thread_max_i = 0;
    short thread_max_j = 0;
    barrier(CLK_LOCAL_MEM_FENCE);

    unsigned int    locSum = 0;
    for(int diag = 0; diag < lengthSeqA + lengthSeqB - 1; diag++)
    {
        unsigned int locDiagId = diag + 1;
        if(myTId == 0)
        {  // this computes the prefixSum for diagonal offset look up table.
            if(locDiagId <= lengthSeqB + 1)
            {
                locSum += locDiagId;
                diagOffset[locDiagId] = locSum;
            }
            else if(locDiagId > lengthSeqA + 1)
            {
                locSum += (lengthSeqB + 1) - (locDiagId - (lengthSeqA + 1));
                diagOffset[locDiagId] = locSum;
            }
            else
            {
                locSum += lengthSeqB + 1;
                diagOffset[locDiagId] = locSum;
            }
            diagOffset[lengthSeqA + lengthSeqB] = locSum + 2;
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);

    for(int diag = 0; diag < lengthSeqA + lengthSeqB - 1; diag++)
    {  // iterate for the number of anti-diagonals
        is_valid_idx = is_valid_idx - (diag < lengthSeqB || diag >= lengthSeqA);

        unsigned int tmp= prev_H_idx;
        prev_H_idx      = curr_H_idx;
        curr_H_idx      = prev_prev_H_idx;
        prev_prev_H_idx = tmp;
        for(int ii=myTId; ii<lengthSeqB + 1; ii+= BLOCK_SIZE) is_valid_array[curr_H_idx+ii]=0;
        barrier(CLK_LOCAL_MEM_FENCE);

        tmp     	= prev_E_idx;
        prev_E_idx      = curr_E_idx;
        curr_E_idx      = prev_prev_E_idx;
        prev_prev_E_idx = tmp;
        for(int ii=0; ii<lengthSeqB + 1; ii+=BLOCK_SIZE) is_valid_array[curr_E_idx+ii]=0;
        barrier(CLK_LOCAL_MEM_FENCE);

        tmp     = prev_F_idx;
        prev_F_idx      = curr_F_idx;
        curr_F_idx      = prev_prev_F_idx;
        prev_prev_F_idx = tmp;
        for(int ii=0; ii<lengthSeqB + 1; ii+= BLOCK_SIZE) is_valid_array[curr_F_idx+ii]=0;
        barrier(CLK_LOCAL_MEM_FENCE);

        if(is_valid_array[myTId + is_valid_idx] && myTId < lengthSeqB)
        {
            short fVal  = is_valid_array[prev_F_idx+j] + EXTEND_GAP;
            short hfVal = is_valid_array[prev_H_idx + j] + START_GAP;
            short eVal  = is_valid_array[prev_E_idx + (j-1)] + EXTEND_GAP;
            short heVal = is_valid_array[prev_H_idx + (j-1)] + START_GAP;

            is_valid_array[curr_F_idx + j] = (fVal > hfVal) ? fVal : hfVal;
            is_valid_array[curr_E_idx + j] = (eVal > heVal) ? eVal : heVal;

            //(myLocString[i-1] == myColumnChar)?MATCH:MISMATCH

            traceback[0] =
                is_valid_array[prev_prev_H_idx + (j-1)] +
                ((myLocString[i - 1] == myColumnChar)
                     ? MATCH
                     : MISMATCH);  // similarityScore(myLocString[i-1],myColumnChar);//seqB[j-1]
            traceback[1] = is_valid_array[curr_F_idx+j];
            traceback[2] = is_valid_array[curr_E_idx+j];
            traceback[3] = 0;

            is_valid_array[curr_H_idx+j] = findMax(traceback, 4, &ind);

            unsigned int diagId    = i + j;
            unsigned int locOffset = 0;
            if(diagId < lengthSeqA + 1)
            {
                locOffset = j;
            }
            else
            {
                unsigned short myOff = diagId - lengthSeqA;
                locOffset            = j - myOff;
            }

            I_i[diagOffset[diagId] + locOffset] = i + iVal[ind];  // coalesced accesses, need to change
            I_j[diagOffset[diagId] + locOffset] = j + jVal[ind];

	    unsigned int curr_h_val= is_valid_array[curr_H_idx+j];
            thread_max_i = (thread_max >= curr_h_val) ? thread_max_i : i;
            thread_max_j = (thread_max >= curr_h_val) ? thread_max_j : myTId + 1;
            thread_max   = (thread_max >= curr_h_val) ? thread_max : curr_h_val;

            i++;
        }
        barrier(CLK_LOCAL_MEM_FENCE);
    }
    barrier(CLK_LOCAL_MEM_FENCE);

    thread_max = blockReduce(thread_max, &thread_max_i, &thread_max_j, lengthSeqB);  // thread 0 will have the correct values

    barrier(CLK_LOCAL_MEM_FENCE);
    if(myTId == 0)
    {
        //printf("max:%d thread_i:%d\n", thread_max, thread_max_i );
        i_max           = thread_max_i;
        j_max           = thread_max_j;
        short current_i = i_max, current_j = j_max;
        seqA_align_end[myId] = current_i;
        seqB_align_end[myId] = current_j;

        //traceBack(myId, current_i, current_j, seqA_align_begin, seqB_align_begin, seqA, seqB,
                  //I_i, I_j, lengthSeqB, lengthSeqA, diagOffset);
	//manually inline the call
	{
	    unsigned short current_diagId;     // = current_i+current_j;
            unsigned short current_locOffset;  // = 0;

            current_diagId    = current_i + current_j;
            current_locOffset = 0;
            if(current_diagId < lengthSeqA + 1)
            {
                current_locOffset = current_j;
            }
            else
            {
                unsigned short myOff = current_diagId - lengthSeqA;
                current_locOffset    = current_j - myOff;
            }
            short next_i = I_i[diagOffset[current_diagId] + current_locOffset];
            short next_j = I_j[diagOffset[current_diagId] + current_locOffset];
    	     //printf("End_i %d and End_j %d next_i=%d, next_j=%d \n", seqA_align_end[myId], seqB_align_end[myId], next_i, next_j);

            while(((current_i != next_i) || (current_j != next_j)) && (next_j != 0) && (next_i != 0))
            {
                current_i = next_i;
                current_j = next_j;

	        current_diagId    = current_i + current_j;
        	current_locOffset = 0;
        	if(current_diagId < lengthSeqA + 1)
        	{
            	    current_locOffset = current_j;
        	}
        	else
        	{
            	    unsigned short myOff2 = current_diagId - lengthSeqA;
            	    current_locOffset     = current_j - myOff2;
        	}

	        next_i = I_i[diagOffset[current_diagId] + current_locOffset];
        	next_j = I_j[diagOffset[current_diagId] + current_locOffset];
    	    }
    	    seqA_align_begin[myId] = current_i;
    	    seqB_align_begin[myId] = current_j;
	}
    }
}
