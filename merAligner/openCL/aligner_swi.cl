#define BLOCK_SIZE 128
#define WORKERS 1
#define SHAREDMEM 2048

#define EXTEND_GAP -2
#define START_GAP -2
#define MATCH 15
#define MMATCH -3

__attribute((reqd_work_group_size(1,1,1)))
__kernel void align_sequences_gpu(__global char* seqA_array, __global char* seqB_array, __global unsigned* prefix_lengthA,
	__global unsigned* prefix_lengthB, unsigned maxMatrixSize, __global int* I_i_array,
	__global int* I_j_array, __global short* seqA_align_begin, __global short* seqA_align_end,
	__global short* seqB_align_begin, __global short* seqB_align_end)
{
    unsigned lengthSeqA[WORKERS];
    unsigned lengthSeqB[WORKERS];
    int    seqA_idx[WORKERS];
    int    seqB_idx[WORKERS];
    int I_i_idx[WORKERS];
    int I_j_idx[WORKERS];

    __local unsigned int is_valid_array[WORKERS][SHAREDMEM];//table
    __local unsigned int myLocString[WORKERS][SHAREDMEM];//read in
    __local unsigned int diagOffset[WORKERS][SHAREDMEM];//diag offset
    __local int i_max[WORKERS];
    __local int j_max[WORKERS];
    int             j[WORKERS][BLOCK_SIZE];
    int   	    i[WORKERS][BLOCK_SIZE];
    char myColumnChar[WORKERS][BLOCK_SIZE];
    unsigned int curr_H_idx[WORKERS], prev_H_idx[WORKERS], prev_prev_H_idx[WORKERS], curr_E_idx[WORKERS], prev_E_idx[WORKERS], prev_prev_E_idx[WORKERS], curr_F_idx[WORKERS], prev_F_idx[WORKERS], prev_prev_F_idx[WORKERS];
    unsigned int is_valid_idx[WORKERS];
    short thread_max[WORKERS][BLOCK_SIZE];
    short thread_max_i[WORKERS][BLOCK_SIZE];
    short thread_max_j[WORKERS][BLOCK_SIZE];
    __local short iVal[4];//= {-1,-1,0,0};
    __local short jVal[4];//= {-1,0,-1,0};
    iVal[0] = -1;
    iVal[1] = -1;
    iVal[2] = 0;
    iVal[3] = 0;
    jVal[0] = -1;
    jVal[1] = 0;
    jVal[2] = -1;
    jVal[3] = 0;

    lengthSeqA[0]   = prefix_lengthA[0];
    lengthSeqB[0]   = prefix_lengthB[0];
    seqA_idx[0]     = 0;
    seqB_idx[0]     = 0;
    I_i_idx[0]      = 0;
    I_j_idx[0]      = 0;
    is_valid_idx[0] = 0;
    #pragma unroll WORKERS-1
    for(int w=1; w<WORKERS; w++)
    {
	lengthSeqA[w] = prefix_lengthA[w] - prefix_lengthA[w - 1];
	lengthSeqB[w] = prefix_lengthB[w] - prefix_lengthB[w - 1];
	seqA_idx[w] = prefix_lengthA[w - 1];
	seqB_idx[w] = prefix_lengthB[w - 1];
        is_valid_idx[w]=0;
    }

    #pragma unroll 1
    for(int w=0; w<WORKERS; w++)
    {
	I_i_idx[w]  = w * maxMatrixSize;
	I_j_idx[w]  = w * maxMatrixSize;

        curr_H_idx[w]          = (3 * lengthSeqB[w] + (lengthSeqB[w] & 1));
        prev_H_idx[w]          = curr_H_idx[w]  + (lengthSeqB[w] + 1);
        prev_prev_H_idx[w]     = prev_H_idx[w]  + (lengthSeqB[w] + 1);

        curr_E_idx[w]          = prev_prev_H_idx[w] + (lengthSeqB[w] + 1);
        prev_E_idx[w]          = curr_E_idx[w]      + (lengthSeqB[w] + 1);
        prev_prev_E_idx[w]     = prev_E_idx[w]      + (lengthSeqB[w] + 1);

        curr_F_idx[w]          = prev_prev_E_idx[w] + (lengthSeqB[w] + 1);
        prev_F_idx[w]          = curr_F_idx[w]      + (lengthSeqB[w] + 1);
        prev_prev_F_idx[w]     = prev_F_idx[w]      + (lengthSeqB[w] + 1);

        for(int ii=0; ii<lengthSeqB[w]; ii++) is_valid_array[w][is_valid_idx[w]+ii]=0;
        is_valid_idx[w] += lengthSeqB[w];
        for(int ii=0; ii<lengthSeqB[w]; ii++) is_valid_array[w][is_valid_idx[w]+ii]=1;
        is_valid_idx[w] += lengthSeqB[w];
        for(int ii=0; ii<lengthSeqB[w]; ii++) is_valid_array[w][is_valid_idx[w]+ii]=0;
        for(int ii=0; ii<9*(lengthSeqB[w]+1); ii++) is_valid_array[w][curr_H_idx[w]+ii]=0;
        for(int ii=0; ii<BLOCK_SIZE; ii++)
        {
	    j[w][ii]                  = ii + 1;
	    i[w][ii]                  = 1;
	    myColumnChar[w][ii] = seqB_array[seqB_idx[w]+j[w][ii] - 1];  
	    thread_max[w][ii]=0;
	    thread_max_i[w][ii]=0;
	    thread_max_j[w][ii]=0;
        }
        for(int ii = 0; ii < lengthSeqA[w]; ii ++)
        {
	    myLocString[w][ii] = seqA_array[seqA_idx[w]+ii];
        }
    

        unsigned int      locSum=0;
        for(int diag = 0; diag < lengthSeqA[w] + lengthSeqB[w] - 1; diag++)
        {
	   unsigned int locDiagId = diag + 1;
	   // this computes the prefixSum for diagonal offset look up table.
	   if(locDiagId <= lengthSeqB[w] + 1)
	   {
		locSum += locDiagId;
		diagOffset[w][locDiagId] = locSum;
	   }
	   else if(locDiagId > lengthSeqA[w] + 1)
	   {
		locSum += (lengthSeqB[w] + 1) - (locDiagId - (lengthSeqA[w] + 1));
		diagOffset[w][locDiagId] = locSum;
	   }
	   else
	   {
		locSum += lengthSeqB[w] + 1;
		diagOffset[w][locDiagId] = locSum;
	   }
	   diagOffset[w][lengthSeqA[w] + lengthSeqB[w]] = locSum + 2;
        }
    }

    #pragma unroll WORKERS
    for(int w=0; w<WORKERS; w++)
    {
        for(int diag = 0; diag < lengthSeqA[w] + lengthSeqB[w] - 1; diag++)
        {  // iterate for the number of anti-diagonals
	    is_valid_idx[w] = is_valid_idx[w] - (diag < lengthSeqB[w] || diag >= lengthSeqA[w]);

	    unsigned int tmp= prev_H_idx[w];
	    prev_H_idx[w]      = curr_H_idx[w];
	    curr_H_idx[w]      = prev_prev_H_idx[w];
	    prev_prev_H_idx[w] = tmp;
	    for(int ii=0; ii<lengthSeqB[w] + 1; ii++) is_valid_array[w][curr_H_idx[w]+ii]=0;

	    tmp                = prev_E_idx[w];
	    prev_E_idx[w]      = curr_E_idx[w];
	    curr_E_idx[w]      = prev_prev_E_idx[w];
	    prev_prev_E_idx[w] = tmp;
	    for(int ii=0; ii<lengthSeqB[w] + 1; ii++) is_valid_array[w][curr_E_idx[w]+ii]=0;

   	    tmp     = prev_F_idx[w];
	    prev_F_idx[w]      = curr_F_idx[w];
	    curr_F_idx[w]      = prev_prev_F_idx[w];
	    prev_prev_F_idx[w] = tmp;
	    for(int ii=0; ii<lengthSeqB[w] + 1; ii++) is_valid_array[w][curr_F_idx[w]+ii]=0;

            for(int t = 0; t < BLOCK_SIZE; t++)
	    {
                if( is_valid_array[w][t + is_valid_idx[w]] && (t < lengthSeqB[w] ))
		{
    	            int ind;
	            short fVal  = is_valid_array[w][prev_F_idx[w] +  j[w][t]]   + EXTEND_GAP;
	            short hfVal = is_valid_array[w][prev_H_idx[w] +  j[w][t]]   + START_GAP;
	            short eVal  = is_valid_array[w][prev_E_idx[w] +  (j[w][t]-1)] + EXTEND_GAP;
	            short heVal = is_valid_array[w][prev_H_idx[w] +  (j[w][t]-1)] + START_GAP;

	            is_valid_array[w][curr_F_idx[w] + j[w][t]] = (fVal > hfVal) ? fVal : hfVal;
	            is_valid_array[w][curr_E_idx[w] + j[w][t]] = (eVal > heVal) ? eVal : heVal;

    	            short            traceback[4];
	            traceback[0] =
		    is_valid_array[w][prev_prev_H_idx[w] + (j[w][t]-1)] +
		    ((myLocString[w][i[w][t] - 1] == myColumnChar[w][t])
		    ? MATCH
		    : MMATCH);  // similarityScore(myLocString[i-1],myColumnChar);//seqB[j-1]
	            traceback[1] = is_valid_array[w][curr_F_idx[w]+j[w][t]];
	            traceback[2] = is_valid_array[w][curr_E_idx[w]+j[w][t]];
	            traceback[3] = 0;

	            {
		        short maxVal = traceback[0];
		        ind      = 0;

		        for(int i = 1; i < 4; i++)
		        {
		            if(traceback[i] > maxVal)
		            {
			        maxVal  = traceback[i];
			        ind = i;
		            }
		        }
		        is_valid_array[w][curr_H_idx[w]+j[w][t]] =maxVal;
	            }

	            unsigned int diagId    = i[w][t] + j[w][t];
	            unsigned int locOffset = 0;
	            if(diagId < lengthSeqA[w] + 1)
	            {
	   	        locOffset = j[w][t];
	            }
	            else
	            {
		        unsigned short myOff = diagId - lengthSeqA[w];
		        locOffset            = j[w][t] - myOff;
	            }

	            I_i_array[I_i_idx[w]+diagOffset[w][diagId] + locOffset] = i[w][t] + iVal[ind];  // coalesced accesses, need to change
	            I_j_array[I_j_idx[w]+diagOffset[w][diagId] + locOffset] = j[w][t] + jVal[ind];

	            unsigned int curr_h_val= is_valid_array[w][curr_H_idx[w]+j[w][t]];
	            thread_max_i[w][t] = (thread_max[w][t] >= curr_h_val) ? thread_max_i[w][t] : i[w][t];
	            thread_max_j[w][t] = (thread_max[w][t] >= curr_h_val) ? thread_max_j[w][t] : t + 1;
	            thread_max[w][t]   = (thread_max[w][t] >= curr_h_val) ? thread_max[w][t] : curr_h_val;
	            i[w][t]++;
	        }
	    }//end for 
        }
    }

    __local short cacheVal[WORKERS][BLOCK_SIZE];
    __local short cacheIdx[WORKERS][BLOCK_SIZE];
    __local short cacheIdx2[WORKERS][BLOCK_SIZE];
    #pragma unroll WORKERS
    for(int w=0; w<WORKERS; w++)
    {   
        #pragma unroll 1
        for(int t = 0; t < BLOCK_SIZE; t++)
	{
	    if(thread_max[w][0]< thread_max[w][t]){
	        thread_max[w][0]= thread_max[w][t];
		thread_max_i[w][0]= thread_max_i[w][t];
		thread_max_j[w][0]= thread_max_j[w][t];
	    } 
        }
    }

    #pragma unroll WORKERS
    for(int w=0; w<WORKERS; w++)
    {
	i_max[w]           = thread_max_i[w][0];
	j_max[w]           = thread_max_j[w][0];
	short current_i = i_max[w], current_j = j_max[w];
	seqA_align_end[w] = current_i;
	seqB_align_end[w] = current_j;

	//manually inline the call
	{
	    unsigned short current_diagId;     // = current_i+current_j;
	    unsigned short current_locOffset;  // = 0;
	    current_diagId    = current_i + current_j;
	    current_locOffset = 0;
	    if(current_diagId < lengthSeqA[w] + 1)
	    {
		current_locOffset = current_j;
	    }
	    else
	    {
		unsigned short myOff = current_diagId - lengthSeqA[w];
		current_locOffset    = current_j - myOff;
	    }
	    short next_i = I_i_array[I_i_idx[w]+diagOffset[w][current_diagId] + current_locOffset];
	    short next_j = I_j_array[I_j_idx[w]+diagOffset[w][current_diagId] + current_locOffset];

	    while(((current_i != next_i) || (current_j != next_j)) && (next_j != 0) && (next_i != 0))
	    {
		current_i = next_i;
		current_j = next_j;

		current_diagId    = current_i + current_j;
		current_locOffset = 0;
		if(current_diagId < lengthSeqA[w] + 1)
		{
		    current_locOffset = current_j;
		}
		else
		{
		    unsigned short myOff2 = current_diagId - lengthSeqA[w];
		    current_locOffset     = current_j - myOff2;
		}

		next_i = I_i_array[I_i_idx[w]+diagOffset[w][current_diagId] + current_locOffset];
		next_j = I_j_array[I_j_idx[w]+diagOffset[w][current_diagId] + current_locOffset];
	    }
	    seqA_align_begin[w] = current_i;
	    seqB_align_begin[w] = current_j;
	}
    }
}


