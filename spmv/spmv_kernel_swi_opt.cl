#define FLOAT float
#define UNROLL_FACTOR 4
#define BUFF_SIZE 48000
#define WKR 4
#define ROWS_PER_WKR 1
#define ROWBLOCK WKR*ROWS_PER_WKR
#define ROWBLOCK_OFFSET (WKR-1)*ROWS_PER_WKR

    __attribute((reqd_work_group_size(1,1,1)))
__kernel void csr(const int num_rows,
	const int num_cols,
	__global const int* restrict Ap, 
	__global const int* restrict Aj, 
	__global const FLOAT* restrict Ax, 
	__global FLOAT* restrict x_g, 
	__global FLOAT* restrict y
	)
{
    __local FLOAT x[WKR][BUFF_SIZE];
    __local FLOAT x1[WKR][BUFF_SIZE];
    #pragma unroll 1
    for(int idx=0; idx<num_cols; idx++)
    {
        #pragma unroll WKR
        for(int pe=0; pe<WKR; pe++)
        {
            x[pe][idx]= x_g[idx];
            x1[pe][idx]= x_g[idx];
        }
    }

    #pragma unroll 1
    #pragma ivdep
    for(int row=0; row < num_rows; row+=ROWBLOCK)
    {
        __private FLOAT sum[WKR][ROWS_PER_WKR];
        __private int row_start[WKR][ROWS_PER_WKR];
        __private int row_end[WKR][ROWS_PER_WKR];
        __private int jj[WKR][ROWS_PER_WKR];
        __private int row_end_rounded[WKR][ROWS_PER_WKR];
        __private int row_ctr[WKR];
        __private int flag      = 1;

        #pragma unroll WKR
	for(int pe=0; pe<WKR; pe++)
	{ 
	    __private int offset= pe*ROWS_PER_WKR;
            #pragma unroll 1
	    for(int r=0; r<ROWS_PER_WKR; r++) 
            {
	        row_start[pe][r]          = Ap[row+offset+r]; 
	        row_end[pe][r]            = Ap[row+offset+r+1];
	        jj[pe][r]                 = row_start[pe][r];
	        row_end_rounded[pe][r]    = row_end[pe][r]-(row_end[pe][r]-row_start[pe][r])%UNROLL_FACTOR;
	        sum[pe][r]                = 0;
  	    }
	    row_ctr[pe]=0;
	}

	while(flag){
            #pragma unroll WKR
            #pragma ivdep
	    for(int pe=0; pe<WKR; pe++)
	    {
		if(jj[pe][row_ctr[pe]] <  row_end_rounded[pe][row_ctr[pe]]){
	            __private FLOAT p_Ax[UNROLL_FACTOR];
	            __private int p_Aj[UNROLL_FACTOR];
		    #pragma unroll UNROLL_FACTOR
		    for(int ii=0; ii<UNROLL_FACTOR; ii++)
			p_Ax[ii] = Ax[jj[pe][row_ctr[pe]]+ii];

		    #pragma unroll UNROLL_FACTOR
		    for(int ii=0; ii<UNROLL_FACTOR; ii++)
			p_Aj[ii] = Aj[jj[pe][row_ctr[pe]]+ii];

		    #if UNROLL_FACTOR>=1
		    sum[pe][row_ctr[pe]] += p_Ax[0]*x[pe][p_Aj[0]];
		    #endif
		    #if UNROLL_FACTOR>=2
		    sum[pe][row_ctr[pe]] += p_Ax[1]*x[pe][p_Aj[1]];
		    #endif
		    #if UNROLL_FACTOR>=4
		    sum[pe][row_ctr[pe]] += p_Ax[2]*x1[pe][p_Aj[2]] + p_Ax[3]*x1[pe][p_Aj[3]];
		    #endif
		    #if UNROLL_FACTOR>=8
		    sum[pe][row_ctr[pe]] += p_Ax[4]*x[pe][p_Aj[4]] + p_Ax[5]*x[pe][p_Aj[5]] + p_Ax[6]*x1[pe][p_Aj[6]] + p_Ax[7]*x1[pe][p_Aj[7]];
		    #endif
		    #if UNROLL_FACTOR>=16
		    sum[pe][row_ctr[pe]] += p_Ax[8]*x[pe][p_Aj[8]] + p_Ax[9]*x[pe][p_Aj[9]] + p_Ax[10]*x1[pe][p_Aj[10]] + p_Ax[11]*x1[pe][p_Aj[11]] +
			p_Ax[12]*x[pe][p_Aj[12]] + p_Ax[13]*x[pe][p_Aj[13]] + p_Ax[14]*x1[pe][p_Aj[14]] + p_Ax[15]*x1[pe][p_Aj[15]];   
		    #endif
		    #if UNROLL_FACTOR>=32
		    sum[pe][row_ctr[pe]] += p_Ax[16]*x[pe][p_Aj[16]] + p_Ax[17]*x[pe][p_Aj[17]] + p_Ax[18]*x1[pe][p_Aj[18]] + p_Ax[19]*x1[pe][p_Aj[19]] +
			p_Ax[20]*x[pe][p_Aj[20]] + p_Ax[21]*x[pe][p_Aj[21]] + p_Ax[22]*x1[pe][p_Aj[22]] + p_Ax[23]*x1[pe][p_Aj[23]] +
			p_Ax[24]*x[pe][p_Aj[24]] + p_Ax[25]*x[pe][p_Aj[25]] + p_Ax[26]*x1[pe][p_Aj[26]] + p_Ax[27]*x1[pe][p_Aj[27]] +
			p_Ax[28]*x[pe][p_Aj[28]] + p_Ax[29]*x[pe][p_Aj[29]] + p_Ax[30]*x1[pe][p_Aj[30]] + p_Ax[31]*x1[pe][p_Aj[31]] ;  
		    #endif
		    #if UNROLL_FACTOR>=64
		    sum[pe][row_ctr[pe]] += p_Ax[32]*x[pe][p_Aj[32]] + p_Ax[33]*x[pe][p_Aj[33]] + p_Ax[34]*x1[pe][p_Aj[34]] + p_Ax[35]*x1[pe][p_Aj[35]] +
			p_Ax[36]*x[pe][p_Aj[36]] + p_Ax[37]*x[pe][p_Aj[37]] + p_Ax[38]*x1[pe][p_Aj[38]] + p_Ax[39]*x1[pe][p_Aj[39]] +
			p_Ax[40]*x[pe][p_Aj[40]] + p_Ax[41]*x[pe][p_Aj[41]] + p_Ax[42]*x1[pe][p_Aj[42]] + p_Ax[43]*x1[pe][p_Aj[43]] +
			p_Ax[44]*x[pe][p_Aj[44]] + p_Ax[45]*x[pe][p_Aj[45]] + p_Ax[46]*x1[pe][p_Aj[46]] + p_Ax[47]*x1[pe][p_Aj[47]] +
			p_Ax[48]*x[pe][p_Aj[48]] + p_Ax[49]*x[pe][p_Aj[49]] + p_Ax[50]*x1[pe][p_Aj[50]] + p_Ax[51]*x1[pe][p_Aj[51]] +
			p_Ax[52]*x[pe][p_Aj[52]] + p_Ax[53]*x[pe][p_Aj[53]] + p_Ax[54]*x1[pe][p_Aj[54]] + p_Ax[55]*x1[pe][p_Aj[55]] +
			p_Ax[56]*x[pe][p_Aj[56]] + p_Ax[57]*x[pe][p_Aj[57]] + p_Ax[58]*x1[pe][p_Aj[58]] + p_Ax[59]*x1[pe][p_Aj[59]] +
			p_Ax[60]*x[pe][p_Aj[60]] + p_Ax[61]*x[pe][p_Aj[61]] + p_Ax[62]*x1[pe][p_Aj[62]] + p_Ax[63]*x1[pe][p_Aj[63]] ;
		    #endif
                    jj[pe][row_ctr[pe]] += UNROLL_FACTOR;
		}else{
		    if(row_ctr[pe]<ROWS_PER_WKR)row_ctr[pe]++;
		    else if(pe==0){
			#if WKR==1
			    flag=0;
			#endif
			#if WKR==2
			    if(row_ctr[1]>=ROWS_PER_WKR)flag=0;
			#endif
			#if WKR==4
			    if(row_ctr[1]>=ROWS_PER_WKR && (row_ctr[2]>=ROWS_PER_WKR && row_ctr[3]>=ROWS_PER_WKR))flag=0;
			#else
                            int exitCond=1;
		            //check if all other WKRs finished, too
                            #pragma unroll 1
                            for(int pe=1; pe<WKR; pe++) 
                                if(jj[pe][row_ctr[pe]] <  row_end[pe][row_ctr[pe]]) exitCond=0;
                            if(exitCond) flag=0;
		        #endif
                    }
		}
	    }
	}
	#pragma unroll WKR
        #pragma ivdep
	for(int pe=0; pe<WKR; pe++)
	{
            __private int offset= pe*ROWS_PER_WKR;
            #pragma unroll 1
            for(int r=0; r<ROWS_PER_WKR; r++) 
            {   
	        #pragma unroll 1
	        for(int ii=row_end_rounded[pe][r]; ii<row_end[pe][r]; ii++)
		    sum[pe][r] += Ax[ii] * x[0][Aj[ii]];
	        y[row+offset+r] = sum[pe][r];
	    }
        }
    }//end for loop over row blocks
}
