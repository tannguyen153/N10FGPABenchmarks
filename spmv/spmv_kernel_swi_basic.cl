#define FLOAT float
#define MANUAL_UNROLL_FACTOR 32

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
    __local FLOAT x[48000];
    __local FLOAT x1[48000];
    for(int idx=0; idx<num_cols; idx++)
	x[idx]= x_g[idx];
    for(int idx=0; idx<num_cols; idx++)
        x1[idx]= x_g[idx];

    size_t row;
    #pragma ivdep array(y)
    #pragma unroll 1
    for(row=0; row < num_rows; row++)
    {
	    __private FLOAT sum = 0;
	    __private const int row_start = Ap[row];
	    __private const int row_end   = Ap[row+1];
	    __private size_t jj,ii;//,kk;
	    __private FLOAT p_Ax[MANUAL_UNROLL_FACTOR];
	    __private int p_Aj[MANUAL_UNROLL_FACTOR];
            __private int row_end_rounded= row_end-(row_end-row_start)%MANUAL_UNROLL_FACTOR;
	    #pragma unroll 1
            #pragma ivdep
	    for (jj = row_start; jj < row_end_rounded; jj=jj+MANUAL_UNROLL_FACTOR)
	    {
		#pragma unroll MANUAL_UNROLL_FACTOR
		for(ii=0; ii<MANUAL_UNROLL_FACTOR; ii++)
		    p_Ax[ii] = Ax[jj+ii];

		#pragma unroll MANUAL_UNROLL_FACTOR
		for(ii=0; ii<MANUAL_UNROLL_FACTOR; ii++)
		    p_Aj[ii] = Aj[jj+ii];

		#if MANUAL_UNROLL_FACTOR>=1
		sum += p_Ax[0]*x[p_Aj[0]];
		#endif
		#if MANUAL_UNROLL_FACTOR>=2
		sum+= p_Ax[1]*x[p_Aj[1]];
		#endif
		#if MANUAL_UNROLL_FACTOR>=4
		sum+= p_Ax[2]*x1[p_Aj[2]] + p_Ax[3]*x1[p_Aj[3]];
		#endif
		#if MANUAL_UNROLL_FACTOR>=8
		sum+= p_Ax[4]*x[p_Aj[4]] + p_Ax[5]*x[p_Aj[5]] + p_Ax[6]*x1[p_Aj[6]] + p_Ax[7]*x1[p_Aj[7]];
		#endif
		#if MANUAL_UNROLL_FACTOR>=16
		sum+= p_Ax[8]*x[p_Aj[8]] + p_Ax[9]*x[p_Aj[9]] + p_Ax[10]*x1[p_Aj[10]] + p_Ax[11]*x1[p_Aj[11]] + 
		    p_Ax[12]*x[p_Aj[12]] + p_Ax[13]*x[p_Aj[13]] + p_Ax[14]*x1[p_Aj[14]] + p_Ax[15]*x1[p_Aj[15]];   
		#endif
                #if MANUAL_UNROLL_FACTOR>=32
                sum+= p_Ax[16]*x[p_Aj[16]] + p_Ax[17]*x[p_Aj[17]] + p_Ax[18]*x1[p_Aj[18]] + p_Ax[19]*x1[p_Aj[19]] +
                    p_Ax[20]*x[p_Aj[20]] + p_Ax[21]*x[p_Aj[21]] + p_Ax[22]*x1[p_Aj[22]] + p_Ax[23]*x1[p_Aj[23]] +
                    p_Ax[24]*x[p_Aj[24]] + p_Ax[25]*x[p_Aj[25]] + p_Ax[26]*x1[p_Aj[26]] + p_Ax[27]*x1[p_Aj[27]] +
                    p_Ax[28]*x[p_Aj[28]] + p_Ax[29]*x[p_Aj[29]] + p_Ax[30]*x1[p_Aj[30]] + p_Ax[31]*x1[p_Aj[31]] ;  
                #endif
                #if MANUAL_UNROLL_FACTOR>=64
                sum+= p_Ax[32]*x[p_Aj[32]] + p_Ax[33]*x[p_Aj[33]] + p_Ax[34]*x1[p_Aj[34]] + p_Ax[35]*x1[p_Aj[35]] +
                    p_Ax[36]*x[p_Aj[36]] + p_Ax[37]*x[p_Aj[37]] + p_Ax[38]*x1[p_Aj[38]] + p_Ax[39]*x1[p_Aj[39]] +
                    p_Ax[40]*x[p_Aj[40]] + p_Ax[41]*x[p_Aj[41]] + p_Ax[42]*x1[p_Aj[42]] + p_Ax[43]*x1[p_Aj[43]] +
                    p_Ax[44]*x[p_Aj[44]] + p_Ax[45]*x[p_Aj[45]] + p_Ax[46]*x1[p_Aj[46]] + p_Ax[47]*x1[p_Aj[47]] +
                    p_Ax[48]*x[p_Aj[48]] + p_Ax[49]*x[p_Aj[49]] + p_Ax[50]*x1[p_Aj[50]] + p_Ax[51]*x1[p_Aj[51]] +
                    p_Ax[52]*x[p_Aj[52]] + p_Ax[53]*x[p_Aj[53]] + p_Ax[54]*x1[p_Aj[54]] + p_Ax[55]*x1[p_Aj[55]] +
                    p_Ax[56]*x[p_Aj[56]] + p_Ax[57]*x[p_Aj[57]] + p_Ax[58]*x1[p_Aj[58]] + p_Ax[59]*x1[p_Aj[59]] +
                    p_Ax[60]*x[p_Aj[60]] + p_Ax[61]*x[p_Aj[61]] + p_Ax[62]*x1[p_Aj[62]] + p_Ax[63]*x1[p_Aj[63]] ;
                #endif
	    }
	    #pragma unroll 1
	    for(ii=row_end_rounded; ii<row_end; ii++)
		sum += Ax[ii] * x[Aj[ii]];
	    y[row] = sum;
    }
}
