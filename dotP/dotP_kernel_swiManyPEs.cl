#define FLOAT float
#define UNROLL_FACTOR 128
#define BLOCKSIZE 2048
#define PE 4
#define NEXTBLOCK_OFFSET BLOCKSIZE*(PE-1)
#define ALL_PE_BLOCKSIZE BLOCKSIZE*PE

__attribute((reqd_work_group_size(1,1,1)))
__kernel void dotP(const int m,
	__global const FLOAT* restrict A, 
	__global const FLOAT* restrict x, 
	__global FLOAT* restrict psum
	)
{
    	    __private FLOAT sum[PE];
	    __private FLOAT p_A[PE][UNROLL_FACTOR];
	    __private FLOAT p_x[PE][UNROLL_FACTOR];
	    __private int i[PE];
	    __private int i0[PE];
	    __private int globali=0;
	    #pragma unroll PE
	    for(int pe=0; pe<PE; pe++)
	    {
		sum[pe]=0.;
		i[pe]= pe*BLOCKSIZE;
		i0[pe] =0;
	    }
	    #pragma unroll 1
            #pragma ivdep
	    while(globali<m)
	    {
	      #pragma unroll PE
	      for(int pe=0; pe<PE; pe++)
	      {
		#pragma unroll UNROLL_FACTOR
		for(int ii=0; ii<UNROLL_FACTOR; ii++)
		    p_A[pe][ii] = A[i[pe]+ii];
		#pragma unroll UNROLL_FACTOR
		for(int ii=0; ii<UNROLL_FACTOR; ii++)
		    p_x[pe][ii] = x[i[pe]+ii];

		#if UNROLL_FACTOR>=1
		sum[pe] += p_A[pe][0]*p_x[pe][0];
		#endif
		#if UNROLL_FACTOR>=2
		sum[pe]+= p_A[pe][1]*p_x[pe][1];
		#endif
		#if UNROLL_FACTOR>=4
		sum[pe]+= p_A[pe][2]*p_x[pe][2] + p_A[pe][3]*p_x[pe][3];
		#endif
		#if UNROLL_FACTOR>=8
		sum[pe]+= p_A[pe][4]*p_x[pe][4] + p_A[pe][5]*p_x[pe][5] + p_A[pe][6]*p_x[pe][6] + p_A[pe][7]*p_x[pe][7];
		#endif
		#if UNROLL_FACTOR>=16
		sum[pe]+= p_A[pe][8]*p_x[pe][8] + p_A[pe][9]*p_x[pe][9] + p_A[pe][10]*p_x[pe][10] + p_A[pe][11]*p_x[pe][11] + 
		    p_A[pe][12]*p_x[pe][12] + p_A[pe][13]*p_x[pe][13] + p_A[pe][14]*p_x[pe][14] + p_A[pe][15]*p_x[pe][15];   
		#endif
                #if UNROLL_FACTOR>=32
                sum[pe]+= p_A[pe][16]*p_x[pe][16] + p_A[pe][17]*p_x[pe][17] + p_A[pe][18]*p_x[pe][18] + p_A[pe][19]*p_x[pe][19] +
                    p_A[pe][20]*p_x[pe][20] + p_A[pe][21]*p_x[pe][21] + p_A[pe][22]*p_x[pe][22] + p_A[pe][23]*p_x[pe][23] +
                    p_A[pe][24]*p_x[pe][24] + p_A[pe][25]*p_x[pe][25] + p_A[pe][26]*p_x[pe][26] + p_A[pe][27]*p_x[pe][27] +
                    p_A[pe][28]*p_x[pe][28] + p_A[pe][29]*p_x[pe][29] + p_A[pe][30]*p_x[pe][30] + p_A[pe][31]*p_x[pe][31] ;  
                #endif
                #if UNROLL_FACTOR>=64
                sum[pe]+= p_A[pe][32]*p_x[pe][32] + p_A[pe][33]*p_x[pe][33] + p_A[pe][34]*p_x[pe][34] + p_A[pe][35]*p_x[pe][35] +
                    p_A[pe][36]*p_x[pe][36] + p_A[pe][37]*p_x[pe][37] + p_A[pe][38]*p_x[pe][38] + p_A[pe][39]*p_x[pe][39] +
                    p_A[pe][40]*p_x[pe][40] + p_A[pe][41]*p_x[pe][41] + p_A[pe][42]*p_x[pe][42] + p_A[pe][43]*p_x[pe][43] +
                    p_A[pe][44]*p_x[pe][44] + p_A[pe][45]*p_x[pe][45] + p_A[pe][46]*p_x[pe][46] + p_A[pe][47]*p_x[pe][47] +
                    p_A[pe][48]*p_x[pe][48] + p_A[pe][49]*p_x[pe][49] + p_A[pe][50]*p_x[pe][50] + p_A[pe][51]*p_x[pe][51] +
                    p_A[pe][52]*p_x[pe][52] + p_A[pe][53]*p_x[pe][53] + p_A[pe][54]*p_x[pe][54] + p_A[pe][55]*p_x[pe][55] +
                    p_A[pe][56]*p_x[pe][56] + p_A[pe][57]*p_x[pe][57] + p_A[pe][58]*p_x[pe][58] + p_A[pe][59]*p_x[pe][59] +
                    p_A[pe][60]*p_x[pe][60] + p_A[pe][61]*p_x[pe][61] + p_A[pe][62]*p_x[pe][62] + p_A[pe][63]*p_x[pe][63] ;
                #endif
                #if UNROLL_FACTOR>=128
                sum[pe]+= p_A[pe][64]*p_x[pe][64] + p_A[pe][65]*p_x[pe][65] + p_A[pe][66]*p_x[pe][66] + p_A[pe][67]*p_x[pe][67] +
                    p_A[pe][68]*p_x[pe][68] + p_A[pe][69]*p_x[pe][69] + p_A[pe][70]*p_x[pe][70] + p_A[pe][71]*p_x[pe][71] +
                    p_A[pe][72]*p_x[pe][72] + p_A[pe][73]*p_x[pe][73] + p_A[pe][74]*p_x[pe][74] + p_A[pe][75]*p_x[pe][75] +
                    p_A[pe][76]*p_x[pe][76] + p_A[pe][77]*p_x[pe][77] + p_A[pe][78]*p_x[pe][78] + p_A[pe][79]*p_x[pe][79] +
                    p_A[pe][80]*p_x[pe][80] + p_A[pe][81]*p_x[pe][81] + p_A[pe][82]*p_x[pe][82] + p_A[pe][83]*p_x[pe][83] +
                    p_A[pe][84]*p_x[pe][84] + p_A[pe][85]*p_x[pe][85] + p_A[pe][86]*p_x[pe][86] + p_A[pe][87]*p_x[pe][87] +
                    p_A[pe][88]*p_x[pe][88] + p_A[pe][89]*p_x[pe][89] + p_A[pe][90]*p_x[pe][90] + p_A[pe][91]*p_x[pe][91] +
                    p_A[pe][92]*p_x[pe][92] + p_A[pe][93]*p_x[pe][93] + p_A[pe][94]*p_x[pe][94] + p_A[pe][95]*p_x[pe][95] +
                    p_A[pe][96]*p_x[pe][96] + p_A[pe][97]*p_x[pe][97] + p_A[pe][98]*p_x[pe][98] + p_A[pe][99]*p_x[pe][99] +
                    p_A[pe][100]*p_x[pe][100] + p_A[pe][101]*p_x[pe][101] + p_A[pe][102]*p_x[pe][102] + p_A[pe][103]*p_x[pe][103] +
                    p_A[pe][104]*p_x[pe][104] + p_A[pe][105]*p_x[pe][105] + p_A[pe][106]*p_x[pe][106] + p_A[pe][107]*p_x[pe][107] +
                    p_A[pe][108]*p_x[pe][108] + p_A[pe][109]*p_x[pe][109] + p_A[pe][110]*p_x[pe][110] + p_A[pe][111]*p_x[pe][111] +
                    p_A[pe][112]*p_x[pe][112] + p_A[pe][113]*p_x[pe][113] + p_A[pe][114]*p_x[pe][114] + p_A[pe][115]*p_x[pe][115] +
                    p_A[pe][116]*p_x[pe][116] + p_A[pe][117]*p_x[pe][117] + p_A[pe][118]*p_x[pe][118] + p_A[pe][119]*p_x[pe][119] +
                    p_A[pe][120]*p_x[pe][120] + p_A[pe][121]*p_x[pe][121] + p_A[pe][122]*p_x[pe][122] + p_A[pe][123]*p_x[pe][123] +
                    p_A[pe][124]*p_x[pe][124] + p_A[pe][125]*p_x[pe][125] + p_A[pe][126]*p_x[pe][126] + p_A[pe][127]*p_x[pe][127] ;
                #endif

		i[pe]+= UNROLL_FACTOR;
		i0[pe]+= UNROLL_FACTOR;
		if(i0[pe]==BLOCKSIZE){
		    i0[pe]=0;
		    if(pe==0)globali+= ALL_PE_BLOCKSIZE;
		    i[pe]+= NEXTBLOCK_OFFSET;//reach end of the block, jump to next block
		}
	      }
	    } 
    #pragma unroll 1
    for(int pe=1; pe<PE; pe++) sum[0]+= sum[pe];
    *psum = sum[0];
}


