#define FLOAT float
#define UNROLL_FACTOR 16 
#define BUFF_SIZE 48000 
#define WKR 4 
#define ROWS_PER_WKR 1 
#define ROWBLOCK WKR*ROWS_PER_WKR
#define ROWBLOCK_OFFSET (WKR-1)*ROWS_PER_WKR
#define ROW_STRIDE 3

kernel __attribute__((reqd_work_group_size(1, 1, 1)))
void csr0(const int num_rows,
	const int num_cols,
	const int starting_row,
	__global const int* restrict Ap, 
	__global const int* restrict Aj, 
	__global const FLOAT* restrict Ax, 
	__global FLOAT* restrict x_g, 
	__global FLOAT* restrict y
	)
{
    __local FLOAT x[BUFF_SIZE] __attribute__((xcl_array_partition(block,1024,1)));

    __attribute__((opencl_unroll_hint(1)))
    for(int idx=0; idx<num_cols; idx++)
    {
        x[idx]= x_g[idx];
    }

    __attribute__((opencl_unroll_hint(ROWBLOCK)))
    ROWLOOP:for(int row=starting_row; row < num_rows; row+=ROW_STRIDE)
    {
        __private FLOAT sum[UNROLL_FACTOR] __attribute__((xcl_array_partition(block,UNROLL_FACTOR,1)));
        __private int row_start= Ap[row];
        __private int row_end  = Ap[row+1];
        __private int jj= row_start;
        __private int row_end_rounded= row_end-(row_end-row_start)%UNROLL_FACTOR;
        __attribute__((opencl_unroll_hint(UNROLL_FACTOR)))
	for(int i=0; i<UNROLL_FACTOR; i++) sum[i]=0;

    	__attribute__((xcl_pipeline_loop(1)))
	COLLOOP:for(jj= row_start; jj <  row_end_rounded; jj+=UNROLL_FACTOR)
	{
	            __private float16 p_Ax;
	            __private int16   p_Aj;

  		    p_Ax  = *((__global const float16*)&Ax[jj]); 
		    p_Aj  = *((__global const int16*)  &Aj[jj]);
		    #if UNROLL_FACTOR>=1
		    sum[0] += p_Ax.s0*x[p_Aj.s0];
		    #endif
		    #if UNROLL_FACTOR>=2
		    sum[1] += p_Ax.s1*x[p_Aj.s1];
		    #endif
		    #if UNROLL_FACTOR>=4
		    sum[2] += p_Ax.s2*x[p_Aj.s2]; sum[3] += p_Ax.s3*x[p_Aj.s3];
		    #endif
		    #if UNROLL_FACTOR>=8
		    sum[4] += p_Ax.s4*x[p_Aj.s4];  sum[5] +=p_Ax.s5*x[p_Aj.s5];
		    sum[6] += p_Ax.s6*x[p_Aj.s6];  sum[7] +=p_Ax.s7*x[p_Aj.s7];
		    #endif
		    #if UNROLL_FACTOR>=16
		    sum[8] += p_Ax.s8*x[p_Aj.s8];   sum[9] += p_Ax[9]*x[p_Aj.s9];
		    sum[10]+= p_Ax.sa*x[p_Aj.sa];   sum[11]+= p_Ax.sb*x[p_Aj.sb];
		    sum[12]+= p_Ax.sc*x[p_Aj.sc];   sum[13]+= p_Ax.sd*x[p_Aj.sd];
		    sum[14]+= p_Ax.se*x[p_Aj.se];   sum[15]+= p_Ax.sf*x[p_Aj.sf];   
		    #endif
	}
        FLOAT s=sum[0]+sum[1]+sum[2]+sum[3]+sum[4]+sum[5]+sum[6]+sum[7]+sum[8]+sum[9]+sum[10]+sum[11]+sum[12]+sum[13]+sum[14]+sum[15];
	__attribute__((opencl_unroll_hint(1)))
	for(int ii=row_end_rounded; ii<row_end; ii++)
	    s+= Ax[ii] * x[Aj[ii]];
	__attribute__((xcl_dependence(class="array", type="inter", direction="WAW", dependent="false")))
        y[row] = s;
    }//end for loop over row blocks
}

kernel __attribute__((reqd_work_group_size(1, 1, 1)))
void csr1(const int num_rows,
	const int num_cols,
	const int starting_row,
	__global const int* restrict Ap, 
	__global const int* restrict Aj, 
	__global const FLOAT* restrict Ax, 
	__global FLOAT* restrict x_g, 
	__global FLOAT* restrict y
	)
{
    __local FLOAT x[BUFF_SIZE] __attribute__((xcl_array_partition(block,1024,1)));

    __attribute__((opencl_unroll_hint(1)))
    for(int idx=0; idx<num_cols; idx++)
    {
        x[idx]= x_g[idx];
    }

    __attribute__((opencl_unroll_hint(ROWBLOCK)))
    ROWLOOP:for(int row=starting_row+1; row < num_rows; row+=ROW_STRIDE)
    {
        __private FLOAT sum[UNROLL_FACTOR] __attribute__((xcl_array_partition(block,UNROLL_FACTOR,1)));
        __private int row_start= Ap[row];
        __private int row_end  = Ap[row+1];
        __private int jj= row_start;
        __private int row_end_rounded= row_end-(row_end-row_start)%UNROLL_FACTOR;
        __attribute__((opencl_unroll_hint(UNROLL_FACTOR)))
	for(int i=0; i<UNROLL_FACTOR; i++) sum[i]=0;

    	__attribute__((xcl_pipeline_loop(1)))
	COLLOOP:for(jj= row_start; jj <  row_end_rounded; jj+=UNROLL_FACTOR)
	{
	            __private float16 p_Ax;
	            __private int16   p_Aj;

  		    p_Ax  = *((__global const float16*)&Ax[jj]); 
		    p_Aj  = *((__global const int16*)  &Aj[jj]);
		    #if UNROLL_FACTOR>=1
		    sum[0] += p_Ax.s0*x[p_Aj.s0];
		    #endif
		    #if UNROLL_FACTOR>=2
		    sum[1] += p_Ax.s1*x[p_Aj.s1];
		    #endif
		    #if UNROLL_FACTOR>=4
		    sum[2] += p_Ax.s2*x[p_Aj.s2]; sum[3] += p_Ax.s3*x[p_Aj.s3];
		    #endif
		    #if UNROLL_FACTOR>=8
		    sum[4] += p_Ax.s4*x[p_Aj.s4];  sum[5] +=p_Ax.s5*x[p_Aj.s5];
		    sum[6] += p_Ax.s6*x[p_Aj.s6];  sum[7] +=p_Ax.s7*x[p_Aj.s7];
		    #endif
		    #if UNROLL_FACTOR>=16
		    sum[8] += p_Ax.s8*x[p_Aj.s8];   sum[9] += p_Ax[9]*x[p_Aj.s9];
		    sum[10]+= p_Ax.sa*x[p_Aj.sa];   sum[11]+= p_Ax.sb*x[p_Aj.sb];
		    sum[12]+= p_Ax.sc*x[p_Aj.sc];   sum[13]+= p_Ax.sd*x[p_Aj.sd];
		    sum[14]+= p_Ax.se*x[p_Aj.se];   sum[15]+= p_Ax.sf*x[p_Aj.sf];   
		    #endif
	}
        FLOAT s=sum[0]+sum[1]+sum[2]+sum[3]+sum[4]+sum[5]+sum[6]+sum[7]+sum[8]+sum[9]+sum[10]+sum[11]+sum[12]+sum[13]+sum[14]+sum[15];
	__attribute__((opencl_unroll_hint(1)))
	for(int ii=row_end_rounded; ii<row_end; ii++)
	    s+= Ax[ii] * x[Aj[ii]];
	__attribute__((xcl_dependence(class="array", type="inter", direction="WAW", dependent="false")))
        y[row] = s;
    }//end for loop over row blocks
}

kernel __attribute__((reqd_work_group_size(1, 1, 1)))
void csr2(const int num_rows,
	const int num_cols,
	const int starting_row,
	__global const int* restrict Ap, 
	__global const int* restrict Aj, 
	__global const FLOAT* restrict Ax, 
	__global FLOAT* restrict x_g, 
	__global FLOAT* restrict y
	)
{
    __local FLOAT x[BUFF_SIZE] __attribute__((xcl_array_partition(block,1024,1)));

    __attribute__((opencl_unroll_hint(1)))
    for(int idx=0; idx<num_cols; idx++)
    {
        x[idx]= x_g[idx];
    }

    __attribute__((opencl_unroll_hint(ROWBLOCK)))
    ROWLOOP:for(int row=starting_row+2; row < num_rows; row+=ROW_STRIDE)
    {
        __private FLOAT sum[UNROLL_FACTOR] __attribute__((xcl_array_partition(block,UNROLL_FACTOR,1)));
        __private int row_start= Ap[row];
        __private int row_end  = Ap[row+1];
        __private int jj= row_start;
        __private int row_end_rounded= row_end-(row_end-row_start)%UNROLL_FACTOR;
        __attribute__((opencl_unroll_hint(UNROLL_FACTOR)))
	for(int i=0; i<UNROLL_FACTOR; i++) sum[i]=0;

    	__attribute__((xcl_pipeline_loop(1)))
	COLLOOP:for(jj= row_start; jj <  row_end_rounded; jj+=UNROLL_FACTOR)
	{
	            __private float16 p_Ax;
	            __private int16   p_Aj;

  		    p_Ax  = *((__global const float16*)&Ax[jj]); 
		    p_Aj  = *((__global const int16*)  &Aj[jj]);
		    #if UNROLL_FACTOR>=1
		    sum[0] += p_Ax.s0*x[p_Aj.s0];
		    #endif
		    #if UNROLL_FACTOR>=2
		    sum[1] += p_Ax.s1*x[p_Aj.s1];
		    #endif
		    #if UNROLL_FACTOR>=4
		    sum[2] += p_Ax.s2*x[p_Aj.s2]; sum[3] += p_Ax.s3*x[p_Aj.s3];
		    #endif
		    #if UNROLL_FACTOR>=8
		    sum[4] += p_Ax.s4*x[p_Aj.s4];  sum[5] +=p_Ax.s5*x[p_Aj.s5];
		    sum[6] += p_Ax.s6*x[p_Aj.s6];  sum[7] +=p_Ax.s7*x[p_Aj.s7];
		    #endif
		    #if UNROLL_FACTOR>=16
		    sum[8] += p_Ax.s8*x[p_Aj.s8];   sum[9] += p_Ax[9]*x[p_Aj.s9];
		    sum[10]+= p_Ax.sa*x[p_Aj.sa];   sum[11]+= p_Ax.sb*x[p_Aj.sb];
		    sum[12]+= p_Ax.sc*x[p_Aj.sc];   sum[13]+= p_Ax.sd*x[p_Aj.sd];
		    sum[14]+= p_Ax.se*x[p_Aj.se];   sum[15]+= p_Ax.sf*x[p_Aj.sf];   
		    #endif
	}
        FLOAT s=sum[0]+sum[1]+sum[2]+sum[3]+sum[4]+sum[5]+sum[6]+sum[7]+sum[8]+sum[9]+sum[10]+sum[11]+sum[12]+sum[13]+sum[14]+sum[15];
	__attribute__((opencl_unroll_hint(1)))
	for(int ii=row_end_rounded; ii<row_end; ii++)
	    s+= Ax[ii] * x[Aj[ii]];
	__attribute__((xcl_dependence(class="array", type="inter", direction="WAW", dependent="false")))
        y[row] = s;
    }//end for loop over row blocks
}

