#define PAIR_BLOCKS 1000000
#define B_BLOCK_WIDTH 128
#define A_BLOCK_WIDTH 1024
#define WORKERS 16
#define EXTEND_GAP -2
#define START_GAP -2
#define MATCH 15
#define MISMATCH -3

#pragma OPENCL EXTENSION cl_intel_channels : enable

//Chanels for SW kernels
channel char           __attribute__((depth(1))) CHANNELA_W0;
channel char           __attribute__((depth(1))) CHANNELB_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W0;
channel char           __attribute__((depth(1))) CHANNELA_REV_W0;
channel char           __attribute__((depth(1))) CHANNELB_REV_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W0;
#if WORKERS>=2
channel char           __attribute__((depth(1))) CHANNELA_W1;
channel char           __attribute__((depth(1))) CHANNELB_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W1;
channel char           __attribute__((depth(1))) CHANNELA_REV_W1;
channel char           __attribute__((depth(1))) CHANNELB_REV_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W1;
#endif
#if WORKERS>=4
channel char           __attribute__((depth(1))) CHANNELA_W2;
channel char           __attribute__((depth(1))) CHANNELB_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W2;
channel char           __attribute__((depth(1))) CHANNELA_REV_W2;
channel char           __attribute__((depth(1))) CHANNELB_REV_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W2;
channel char           __attribute__((depth(1))) CHANNELA_W3;
channel char           __attribute__((depth(1))) CHANNELB_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W3;
channel char           __attribute__((depth(1))) CHANNELA_REV_W3;
channel char           __attribute__((depth(1))) CHANNELB_REV_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W3;
#endif
#if WORKERS>=8
channel char           __attribute__((depth(1))) CHANNELA_W4;
channel char           __attribute__((depth(1))) CHANNELB_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W4;
channel char           __attribute__((depth(1))) CHANNELA_REV_W4;
channel char           __attribute__((depth(1))) CHANNELB_REV_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W4;
channel char           __attribute__((depth(1))) CHANNELA_W5;
channel char           __attribute__((depth(1))) CHANNELB_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W5;
channel char           __attribute__((depth(1))) CHANNELA_REV_W5;
channel char           __attribute__((depth(1))) CHANNELB_REV_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W5;
channel char           __attribute__((depth(1))) CHANNELA_W6;
channel char           __attribute__((depth(1))) CHANNELB_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W6;
channel char           __attribute__((depth(1))) CHANNELA_REV_W6;
channel char           __attribute__((depth(1))) CHANNELB_REV_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W6;
channel char           __attribute__((depth(1))) CHANNELA_W7;
channel char           __attribute__((depth(1))) CHANNELB_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W7;
channel char           __attribute__((depth(1))) CHANNELA_REV_W7;
channel char           __attribute__((depth(1))) CHANNELB_REV_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W7;
#endif
#if WORKERS>=16
channel char           __attribute__((depth(1))) CHANNELA_W8;
channel char           __attribute__((depth(1))) CHANNELB_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W8;
channel char           __attribute__((depth(1))) CHANNELA_REV_W8;
channel char           __attribute__((depth(1))) CHANNELB_REV_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W8;
channel char           __attribute__((depth(1))) CHANNELA_W9;
channel char           __attribute__((depth(1))) CHANNELB_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W9;
channel char           __attribute__((depth(1))) CHANNELA_REV_W9;
channel char           __attribute__((depth(1))) CHANNELB_REV_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W9;
channel char           __attribute__((depth(1))) CHANNELA_W10;
channel char           __attribute__((depth(1))) CHANNELB_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W10;
channel char           __attribute__((depth(1))) CHANNELA_REV_W10;
channel char           __attribute__((depth(1))) CHANNELB_REV_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W10;
channel char           __attribute__((depth(1))) CHANNELA_W11;
channel char           __attribute__((depth(1))) CHANNELB_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W11;
channel char           __attribute__((depth(1))) CHANNELA_REV_W11;
channel char           __attribute__((depth(1))) CHANNELB_REV_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W11;
channel char           __attribute__((depth(1))) CHANNELA_W12;
channel char           __attribute__((depth(1))) CHANNELB_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W12;
channel char           __attribute__((depth(1))) CHANNELA_REV_W12;
channel char           __attribute__((depth(1))) CHANNELB_REV_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W12;
channel char           __attribute__((depth(1))) CHANNELA_W13;
channel char           __attribute__((depth(1))) CHANNELB_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W13;
channel char           __attribute__((depth(1))) CHANNELA_REV_W13;
channel char           __attribute__((depth(1))) CHANNELB_REV_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W13;
channel char           __attribute__((depth(1))) CHANNELA_W14;
channel char           __attribute__((depth(1))) CHANNELB_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W14;
channel char           __attribute__((depth(1))) CHANNELA_REV_W14;
channel char           __attribute__((depth(1))) CHANNELB_REV_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W14;
channel char           __attribute__((depth(1))) CHANNELA_W15;
channel char           __attribute__((depth(1))) CHANNELB_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W15;
channel char           __attribute__((depth(1))) CHANNELA_REV_W15;
channel char           __attribute__((depth(1))) CHANNELB_REV_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W15;
#endif

#if WORKERS>=32
channel char           __attribute__((depth(1))) CHANNELA_W16;
channel char           __attribute__((depth(1))) CHANNELB_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W16;
channel char           __attribute__((depth(1))) CHANNELA_REV_W16;
channel char           __attribute__((depth(1))) CHANNELB_REV_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W16;
channel char           __attribute__((depth(1))) CHANNELA_W17;
channel char           __attribute__((depth(1))) CHANNELB_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W17;
channel char           __attribute__((depth(1))) CHANNELA_REV_W17;
channel char           __attribute__((depth(1))) CHANNELB_REV_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W17;
channel char           __attribute__((depth(1))) CHANNELA_W18;
channel char           __attribute__((depth(1))) CHANNELB_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W18;
channel char           __attribute__((depth(1))) CHANNELA_REV_W18;
channel char           __attribute__((depth(1))) CHANNELB_REV_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W18;
channel char           __attribute__((depth(1))) CHANNELA_W19;
channel char           __attribute__((depth(1))) CHANNELB_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W19;
channel char           __attribute__((depth(1))) CHANNELA_REV_W19;
channel char           __attribute__((depth(1))) CHANNELB_REV_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W19;
channel char           __attribute__((depth(1))) CHANNELA_W20;
channel char           __attribute__((depth(1))) CHANNELB_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W20;
channel char           __attribute__((depth(1))) CHANNELA_REV_W20;
channel char           __attribute__((depth(1))) CHANNELB_REV_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W20;
channel char           __attribute__((depth(1))) CHANNELA_W21;
channel char           __attribute__((depth(1))) CHANNELB_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W21;
channel char           __attribute__((depth(1))) CHANNELA_REV_W21;
channel char           __attribute__((depth(1))) CHANNELB_REV_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W21;
channel char           __attribute__((depth(1))) CHANNELA_W22;
channel char           __attribute__((depth(1))) CHANNELB_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W22;
channel char           __attribute__((depth(1))) CHANNELA_REV_W22;
channel char           __attribute__((depth(1))) CHANNELB_REV_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W22;
channel char           __attribute__((depth(1))) CHANNELA_W23;
channel char           __attribute__((depth(1))) CHANNELB_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W23;
channel char           __attribute__((depth(1))) CHANNELA_REV_W23;
channel char           __attribute__((depth(1))) CHANNELB_REV_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W23;
channel char           __attribute__((depth(1))) CHANNELA_W24;
channel char           __attribute__((depth(1))) CHANNELB_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W24;
channel char           __attribute__((depth(1))) CHANNELA_REV_W24;
channel char           __attribute__((depth(1))) CHANNELB_REV_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W24;
channel char           __attribute__((depth(1))) CHANNELA_W25;
channel char           __attribute__((depth(1))) CHANNELB_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W25;
channel char           __attribute__((depth(1))) CHANNELA_REV_W25;
channel char           __attribute__((depth(1))) CHANNELB_REV_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W25;
channel char           __attribute__((depth(1))) CHANNELA_W26;
channel char           __attribute__((depth(1))) CHANNELB_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W26;
channel char           __attribute__((depth(1))) CHANNELA_REV_W26;
channel char           __attribute__((depth(1))) CHANNELB_REV_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W26;
channel char           __attribute__((depth(1))) CHANNELA_W27;
channel char           __attribute__((depth(1))) CHANNELB_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W27;
channel char           __attribute__((depth(1))) CHANNELA_REV_W27;
channel char           __attribute__((depth(1))) CHANNELB_REV_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W27;
channel char           __attribute__((depth(1))) CHANNELA_W28;
channel char           __attribute__((depth(1))) CHANNELB_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W28;
channel char           __attribute__((depth(1))) CHANNELA_REV_W28;
channel char           __attribute__((depth(1))) CHANNELB_REV_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W28;
channel char           __attribute__((depth(1))) CHANNELA_W29;
channel char           __attribute__((depth(1))) CHANNELB_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W29;
channel char           __attribute__((depth(1))) CHANNELA_REV_W29;
channel char           __attribute__((depth(1))) CHANNELB_REV_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W29;
channel char           __attribute__((depth(1))) CHANNELA_W30;
channel char           __attribute__((depth(1))) CHANNELB_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W30;
channel char           __attribute__((depth(1))) CHANNELA_REV_W30;
channel char           __attribute__((depth(1))) CHANNELB_REV_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W30;
channel char           __attribute__((depth(1))) CHANNELA_W31;
channel char           __attribute__((depth(1))) CHANNELB_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W31;
channel char           __attribute__((depth(1))) CHANNELA_REV_W31;
channel char           __attribute__((depth(1))) CHANNELB_REV_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W31;
#endif

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB0 (__global char * restrict a, __global char * restrict b,
        __global const unsigned * restrict prefix_lengthA,
        __global const unsigned * restrict prefix_lengthB)
{
     __local char private_b[B_BLOCK_WIDTH];
     __local char a_cache[WORKERS][8+8];//8 bytes for forward and 8 bytes for reverse directions

    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        //declare with volatile so that the compiler will not waste area for caching loaded data
        #pragma unroll 1
        for(unsigned short w=0; w<WORKERS; w+=4)
        {
            __global char * volatile ptr_b;
            unsigned seqB_idx;
            //update for the next pair
            if(pair==0 && w==0){
                seqB_idx     = 0;
            }else{
                seqB_idx     = prefix_lengthB[pair + w - 1];
            }
            ptr_b = &b[seqB_idx];

            #pragma unroll 1
            #pragma ivdep
            for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)
            {
                private_b[j] = ptr_b[j];
            }
            switch(w){
              case 0:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W0, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W0, private_b[offset]);
                }
                break;
#if WORKERS>=8
              case 4:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W4, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W4, private_b[offset]);
                }
                break;
              case 8:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W8, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W8, private_b[offset]);
                }
                break;
              case 12:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W12, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W12, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=32
              case 16:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W16, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W16, private_b[offset]);
                }
                break;
              case 20:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W20, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W20, private_b[offset]);
                }
                break;
              case 24:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W24, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W24, private_b[offset]);
                }
                break;
              case 28:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W28, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W28, private_b[offset]);
                }
                break;
#endif
            }//end switch
        }//end for workers

        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=0; w<WORKERS; w+=4)
        {
            unsigned seqA_idx;
            if(pair==0 && w==0){
                seqA_idx     = 0;
            }else{
                seqA_idx     = prefix_lengthA[pair + w - 1];
            }
            ptr_a[w]= &a[seqA_idx];
        }

        unsigned short i_fwd=0, i_rev=A_BLOCK_WIDTH-1-8;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
          unsigned short imod8= i%8;
          #pragma unroll 1
          for(unsigned short w=0; w<WORKERS; w+=4)
          {
             if(imod8==0){
                  #pragma unroll 1
                  #pragma ivdep
                  for(unsigned short i0 = 0; i0< 8; i0++)
                  {
                    a_cache[w][i0]= ptr_a[w][i_fwd+i0];
                    a_cache[w][8+i0]= ptr_a[w][i_rev+i0];
                  }
             }
             char ai     = a_cache[w][imod8];
             char ai_rev     = a_cache[w][15-imod8];

             switch(w){
              case 0:
                    write_channel_intel(CHANNELA_W0, ai);
                    write_channel_intel(CHANNELA_REV_W0, ai_rev);
                    break;
#if WORKERS>=8
              case 4:
                    write_channel_intel(CHANNELA_W4, ai);
                    write_channel_intel(CHANNELA_REV_W4, ai_rev);
                    break;
#endif
#if WORKERS>=16
              case 8:
                    write_channel_intel(CHANNELA_W8, ai);
                    write_channel_intel(CHANNELA_REV_W8, ai_rev);
                    break;
              case 12:
                    write_channel_intel(CHANNELA_W12, ai);
                    write_channel_intel(CHANNELA_REV_W12, ai_rev);
                    break;
#endif
#if WORKERS>=32
              case 16:
                    write_channel_intel(CHANNELA_W16, ai);
                    write_channel_intel(CHANNELA_REV_W16, ai_rev);
                    break;
              case 20:
                    write_channel_intel(CHANNELA_W20, ai);
                    write_channel_intel(CHANNELA_REV_W20, ai_rev);
                    break;
              case 24:
                    write_channel_intel(CHANNELA_W24, ai);
                    write_channel_intel(CHANNELA_REV_W24, ai_rev);
                    break;
              case 28:
                    write_channel_intel(CHANNELA_W28, ai);
                    write_channel_intel(CHANNELA_REV_W28, ai_rev);
                    break;
#endif
            }//end switch
          }//end workers
          if(imod8==7){
             i_fwd = i_fwd +8;
             i_rev= i_rev-8;
          }
        }//end for A length
    }//end pair
}



__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB1 (__global char * restrict a, __global char * restrict b,
        __global const unsigned * restrict prefix_lengthA,
        __global const unsigned * restrict prefix_lengthB)
{
     __local char private_b[B_BLOCK_WIDTH];
     __local char a_cache[WORKERS][8+8];//8 bytes for forward and 8 bytes for reverse directions

    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        //declare with volatile so that the compiler will not waste area for caching loaded data
        #pragma unroll 1
        for(unsigned short w=1; w<WORKERS; w+=4)
        {
            __global char * volatile ptr_b;
            unsigned seqB_idx;
            //update for the next pair
            seqB_idx     = prefix_lengthB[pair + w - 1];
            ptr_b = &b[seqB_idx];

            #pragma unroll 1
            #pragma ivdep
            for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)
            {
                private_b[j] = ptr_b[j];
            }
            switch(w){
#if WORKERS>=2
              case 1:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W1, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W1, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=8
              case 5:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W5, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W5, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=16
              case 9:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W9, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W9, private_b[offset]);
                }
                break;
              case 13:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W13, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W13, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=32
              case 17:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W17, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W17, private_b[offset]);
                }
                break;
              case 21:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W21, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W21, private_b[offset]);
                }
                break;
              case 25:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W25, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W25, private_b[offset]);
                }
                break;
              case 29:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W29, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W29, private_b[offset]);
                }
                break;
#endif
            }//end switch
        }//end for workers
        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=1; w<WORKERS; w+=4)
        {
            unsigned seqA_idx;
            seqA_idx     = prefix_lengthA[pair + w - 1];
            ptr_a[w]= &a[seqA_idx];
        }

        unsigned short i_fwd=0, i_rev=A_BLOCK_WIDTH-1-8;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
          unsigned short imod8= i%8;
          #pragma unroll 1
          for(unsigned short w=1; w<WORKERS; w+=4)
          {
             if(imod8==0){
                  #pragma unroll 1
                  #pragma ivdep
                  for(unsigned short i0 = 0; i0< 8; i0++)
                  {
                    a_cache[w][i0]= ptr_a[w][i_fwd+i0];
                    a_cache[w][8+i0]= ptr_a[w][i_rev+i0];
                  }
             }
             char ai     = a_cache[w][imod8];
             char ai_rev     = a_cache[w][15-imod8];

             switch(w){
#if WORKERS>=2
              case 1:
                    write_channel_intel(CHANNELA_W1, ai);
                    write_channel_intel(CHANNELA_REV_W1, ai_rev);
                    break;
#endif
#if WORKERS>=8
              case 5:
                    write_channel_intel(CHANNELA_W5, ai);
                    write_channel_intel(CHANNELA_REV_W5, ai_rev);
                    break;
#endif
#if WORKERS>=16
              case 9:
                    write_channel_intel(CHANNELA_W9, ai);
                    write_channel_intel(CHANNELA_REV_W9, ai_rev);
                    break;
              case 13:
                    write_channel_intel(CHANNELA_W13, ai);
                    write_channel_intel(CHANNELA_REV_W13, ai_rev);
                    break;
#endif
#if WORKERS>=32
              case 17:
                    write_channel_intel(CHANNELA_W17, ai);
                    write_channel_intel(CHANNELA_REV_W17, ai_rev);
                    break;
              case 21:
                    write_channel_intel(CHANNELA_W21, ai);
                    write_channel_intel(CHANNELA_REV_W21, ai_rev);
                    break;
              case 25:
                    write_channel_intel(CHANNELA_W25, ai);
                    write_channel_intel(CHANNELA_REV_W25, ai_rev);
                    break;
              case 29:
                    write_channel_intel(CHANNELA_W29, ai);
                    write_channel_intel(CHANNELA_REV_W29, ai_rev);
                    break;
#endif
            }//end switch
          }//end workers
          if(imod8==7){
             i_fwd = i_fwd +8;
             i_rev= i_rev-8;
          }
        }//end for A length
    }//end pair
}



__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB2 (__global char * restrict a, __global char * restrict b,
        __global const unsigned * restrict prefix_lengthA,
        __global const unsigned * restrict prefix_lengthB)
{
     __local char private_b[B_BLOCK_WIDTH];
     __local char a_cache[WORKERS][8+8];//8 bytes for forward and 8 bytes for reverse directions

    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        //declare with volatile so that the compiler will not waste area for caching loaded data
        #pragma unroll 1
        for(unsigned short w=2; w<WORKERS; w+=4)
        {
            __global char * volatile ptr_b;
            unsigned seqB_idx;
            //update for the next pair
            seqB_idx     = prefix_lengthB[pair + w - 1];
            ptr_b = &b[seqB_idx];

            #pragma unroll 1
            #pragma ivdep
            for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)
            {
                private_b[j] = ptr_b[j];
            }
            switch(w){
#if WORKERS>=4
              case 2:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W2, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W2, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=8
              case 6:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W6, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W6, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=16
              case 10:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W10, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W10, private_b[offset]);
                }
                break;
              case 14:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W14, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W14, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=32
              case 18:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W18, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W18, private_b[offset]);
                }
                break;
              case 22:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W22, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W22, private_b[offset]);
                }
                break;
              case 26:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W26, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W26, private_b[offset]);
                }
                break;
              case 30:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W30, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W30, private_b[offset]);
                }
                break;
#endif
            }//end switch
        }//end for workers


        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=2; w<WORKERS; w+=4)
        {
            unsigned seqA_idx;
            seqA_idx     = prefix_lengthA[pair + w - 1];
            ptr_a[w]= &a[seqA_idx];
        }

        unsigned short i_fwd=0, i_rev=A_BLOCK_WIDTH-1-8;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
          unsigned short imod8= i%8;
          #pragma unroll 1
          for(unsigned short w=2; w<WORKERS; w+=4)
          {
             if(imod8==0){
                  #pragma unroll 1
                  #pragma ivdep
                  for(unsigned short i0 = 0; i0< 8; i0++)
                  {
                    a_cache[w][i0]= ptr_a[w][i_fwd+i0];
                    a_cache[w][8+i0]= ptr_a[w][i_rev+i0];
                  }
             }
             char ai     = a_cache[w][imod8];
             char ai_rev     = a_cache[w][15-imod8];

             switch(w){
#if WORKERS>=4
              case 2:
                    write_channel_intel(CHANNELA_W2, ai);
                    write_channel_intel(CHANNELA_REV_W2, ai_rev);
                    break;
#endif
#if WORKERS>=8
              case 6:
                    write_channel_intel(CHANNELA_W6, ai);
                    write_channel_intel(CHANNELA_REV_W6, ai_rev);
                    break;
#endif
#if WORKERS>=16
              case 10:
                    write_channel_intel(CHANNELA_W10, ai);
                    write_channel_intel(CHANNELA_REV_W10, ai_rev);
                    break;
              case 14:
                    write_channel_intel(CHANNELA_W14, ai);
                    write_channel_intel(CHANNELA_REV_W14, ai_rev);
                    break;
#endif
#if WORKERS>=32
              case 18:
                    write_channel_intel(CHANNELA_W18, ai);
                    write_channel_intel(CHANNELA_REV_W18, ai_rev);
                    break;
              case 22:
                    write_channel_intel(CHANNELA_W22, ai);
                    write_channel_intel(CHANNELA_REV_W22, ai_rev);
                    break;
              case 26:
                    write_channel_intel(CHANNELA_W26, ai);
                    write_channel_intel(CHANNELA_REV_W26, ai_rev);
                    break;
              case 30:
                    write_channel_intel(CHANNELA_W30, ai);
                    write_channel_intel(CHANNELA_REV_W30, ai_rev);
                    break;
#endif

            }//end switch
          }//end workers
          if(imod8==7){
             i_fwd = i_fwd +8;
             i_rev= i_rev-8;
          }
        }//end for A length
    }//end pair
}


__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB3 (__global char * restrict a, __global char * restrict b, 
	__global const unsigned * restrict prefix_lengthA,
	__global const unsigned * restrict prefix_lengthB)
{
     __local char private_b[B_BLOCK_WIDTH];
     __local char a_cache[WORKERS][8+8];//8 bytes for forward and 8 bytes for reverse directions

    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        //declare with volatile so that the compiler will not waste area for caching loaded data
	#pragma unroll 1
	for(unsigned short w=3; w<WORKERS; w+=4)
	{
	    __global char * volatile ptr_b;
    	    unsigned seqB_idx;
	    seqB_idx     = prefix_lengthB[pair + w - 1];
	    ptr_b = &b[seqB_idx];
	    
            #pragma unroll 1
	    #pragma ivdep
	    for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)
	    {
		private_b[j] = ptr_b[j];
	    }
	    switch(w){
#if WORKERS>=4
              case 3:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W3, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W3, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=8
              case 7:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W7, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W7, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=16
              case 11:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W11, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W11, private_b[offset]);
                }
                break;
              case 15:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W15, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W15, private_b[offset]);
                }
                break;
#endif
#if WORKERS>=32
              case 19:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W19, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W19, private_b[offset]);
                }
                break;
              case 23:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W23, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W23, private_b[offset]);
                }
                break;
              case 27:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W27, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W27, private_b[offset]);
                }
                break;
              case 31:
                for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                {
                    write_channel_intel(CHANNELB_W31, private_b[offset]);
                    write_channel_intel(CHANNELB_REV_W31, private_b[offset]);
		}
                break;
#endif

	    }//end switch
	}//end for workers


        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=3; w<WORKERS; w+=4)
        {
	    unsigned seqA_idx;
            seqA_idx     = prefix_lengthA[pair + w - 1];
	    ptr_a[w]= &a[seqA_idx];
	}

        unsigned short i_fwd=0, i_rev=A_BLOCK_WIDTH-1-8;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
          unsigned short imod8= i%8;
          #pragma unroll 1
          for(unsigned short w=3; w<WORKERS; w+=4)
          {
             if(imod8==0){
                  #pragma unroll 1
                  #pragma ivdep
                  for(unsigned short i0 = 0; i0< 8; i0++)
                  {
                    a_cache[w][i0]= ptr_a[w][i_fwd+i0];
                    a_cache[w][8+i0]= ptr_a[w][i_rev+i0];
                  }
             }
             char ai     = a_cache[w][imod8];
             char ai_rev     = a_cache[w][15-imod8];

             switch(w){
#if WORKERS>=4
              case 3:
                    write_channel_intel(CHANNELA_W3, ai);
                    write_channel_intel(CHANNELA_REV_W3, ai_rev);
                    break;
#endif
#if WORKERS>=8
              case 7:
                    write_channel_intel(CHANNELA_W7, ai);
                    write_channel_intel(CHANNELA_REV_W7, ai_rev);
                    break;
#endif
#if WORKERS>=16
              case 11:
                    write_channel_intel(CHANNELA_W11, ai);
                    write_channel_intel(CHANNELA_REV_W11, ai_rev);
                    break;
              case 15:
                    write_channel_intel(CHANNELA_W15, ai);
                    write_channel_intel(CHANNELA_REV_W15, ai_rev);
                    break;
#endif
#if WORKERS>=32
              case 19:
                    write_channel_intel(CHANNELA_W19, ai);
                    write_channel_intel(CHANNELA_REV_W19, ai_rev);
                    break;
              case 23:
                    write_channel_intel(CHANNELA_W23, ai);
                    write_channel_intel(CHANNELA_REV_W23, ai_rev);
                    break;
              case 27:
                    write_channel_intel(CHANNELA_W27, ai);
                    write_channel_intel(CHANNELA_REV_W27, ai_rev);
                    break;
              case 31:
                    write_channel_intel(CHANNELA_W31, ai);
                    write_channel_intel(CHANNELA_REV_W31, ai_rev);
                    break;
#endif

  	    }//end switch
	  }//end workers
          if(imod8==7){
             i_fwd = i_fwd +8;
             i_rev= i_rev-8;
          }
	}//end for A length
    }//end pair
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void storeResults (__global unsigned short* restrict seqA_align_beg, __global unsigned short* restrict seqA_align_end, 
			    __global unsigned short* restrict seqB_align_beg, __global unsigned short* restrict seqB_align_end)
{   
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {   
	unsigned short row_idx[WORKERS], finalColIdx[WORKERS], row_idx_rev[WORKERS], finalColIdx_rev[WORKERS];
        for(unsigned short w=0; w<WORKERS; w++)
        {   
	    switch(w){
	      case 0:
    	        row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W0);
	        finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W0);
 	        row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W0);
	        finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W0);
	        break;

#if WORKERS>=2
	      case 1:
	        row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W1);
	        finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W1);
	        row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W1);
	        finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W1);
	        break;
#endif
#if WORKERS>=4
              case 2:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W2);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W2);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W2);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W2);
                break;

              case 3:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W3);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W3);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W3);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W3);
                break;
#endif
#if WORKERS>=8 
              case 4:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W4);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W4);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W4);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W4);
                break;
                
              case 5:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W5);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W5);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W5);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W5);
                break;
              case 6:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W6);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W6);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W6);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W6);
                break;
              case 7:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W7);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W7);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W7);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W7);
                break;
#endif     
#if WORKERS>=16
              case 8:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W8);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W8);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W8);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W8);
                break;
              case 9:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W9);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W9);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W9);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W9);
                break;
              case 10:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W10);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W10);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W10);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W10);
                break;
              case 11:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W11);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W11);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W11);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W11);
                break;
              case 12:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W12);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W12);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W12);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W12);
                break;
              case 13:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W13);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W13);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W13);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W13);
                break;
              case 14:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W14);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W14);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W14);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W14);
                break;
              case 15:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W15);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W15);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W15);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W15);
                break;
#endif
#if WORKERS>=32
              case 16:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W16);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W16);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W16);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W16);
                break;
              case 17:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W17);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W17);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W17);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W17);
                break;
              case 18:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W18);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W18);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W18);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W18);
                break;
              case 19:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W19);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W19);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W19);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W19);
                break;
              case 20:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W20);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W20);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W20);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W20);
                break;
              case 21:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W21);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W21);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W21);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W21);
                break;
              case 22:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W22);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W22);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W22);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W22);
                break;
              case 23:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W23);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W23);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W23);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W23);
                break;
              case 24:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W24);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W24);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W24);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W24);
                break;
              case 25:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W25);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W25);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W25);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W25);
                break;
              case 26:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W26);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W26);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W26);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W26);
                break;
              case 27:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W27);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W27);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W27);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W27);
                break;
              case 28:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W28);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W28);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W28);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W28);
                break;
              case 29:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W29);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W29);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W29);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W29);
                break;
              case 30:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W30);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W30);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W30);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W30);
                break;
              case 31:
                row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W31);
                finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W31);
                row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W31);
                finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W31);
                break;
#endif

	   }
        }
	#pragma unroll 1
        for(unsigned short w=0; w<WORKERS; w++)
        {   
                seqA_align_end[pair+w]= row_idx[w]+1;
                seqB_align_end[pair+w]= finalColIdx[w]+1; 
                seqA_align_beg[pair+w]= row_idx_rev[w]-1;
                seqB_align_beg[pair+w]= finalColIdx_rev[w]; 
	}
    }
}


__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw0 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W0);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W0);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W0, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W0, finalColIdx);
    }
}

#if WORKERS>=2
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw1 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=1;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W1);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W1);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W1, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W1, finalColIdx);
    }
}
#endif

#if WORKERS>=4
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw2 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=2;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W2);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W2);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W2, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W2, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw3 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=3;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W3);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W3);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W3, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W3, finalColIdx);
    }
}
#endif

#if WORKERS>=8
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw4 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=4;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W4);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W4);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W4, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W4, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw5 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=5;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W5);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W5);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W5, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W5, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw6 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=6;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W6);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W6);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W6, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W6, finalColIdx);
    }
}


__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw7 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=7;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W7);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W7);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W7, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W7, finalColIdx);
    }
}
#endif


#if WORKERS>=16
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw8 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=8;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W8);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W8);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W8, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W8, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw9 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=9;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W9);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W9);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W9, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W9, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw10 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=10;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W10);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W10);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W10, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W10, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw11 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=11;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W11);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W11);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W11, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W11, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw12 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=12;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W12);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W12);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W12, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W12, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw13 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=13;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W13);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W13);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W13, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W13, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw14 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=14;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W14);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W14);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W14, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W14, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw15 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=15;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W15);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W15);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W15, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W15, finalColIdx);
    }
}

#endif
#if WORKERS>=32
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw16 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=16;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W16);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W16);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W16, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W16, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw17 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=17;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W17);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W17);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W17, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W17, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw18 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=18;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W18);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W18);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W18, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W18, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw19 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=19;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W19);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W19);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W19, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W19, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw20 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=20;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W20);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W20);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W20, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W20, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw21 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=21;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W21);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W21);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W21, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W21, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw22 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=22;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W22);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W22);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W22, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W22, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw23 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=23;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W23);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W23);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W23, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W23, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw24 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=24;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W24);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W24);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W24, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W24, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw25 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=25;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W25);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W25);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W25, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W25, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw26 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=26;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W26);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W26);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W26, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W26, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw27 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=27;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W27);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W27);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W27, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W27, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw28 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=28;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W28);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W28);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W28, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W28, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw29 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=29;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W29);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W29);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W29, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W29, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw30 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=30;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W30);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W30);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W30, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W30, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw31 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=31;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_W31);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
	{
	    row[offset]=0;
	    maxCol[offset]=0;
	}
        short score=0;
	unsigned short row_idx=0, finalColIdx=0;
	#pragma unroll 1
	for(short i = 0; i< A_BLOCK_WIDTH; i++)
	{
	    char a_i = read_channel_intel(CHANNELA_W31);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=0;
	    #pragma unroll 1
	    for(short j=0; j<B_BLOCK_WIDTH; j++)
	    {
                short j0= B_BLOCK_WIDTH-1-j;
		short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j0]?current: maxCol[j0]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j0] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j0] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j0] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W31, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W31, finalColIdx);
    }
}
#endif



//Reverse SW

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev0 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W0);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W0);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W0, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W0, finalColIdx);
    }
}

#if WORKERS>=2
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev1 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=1;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W1);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W1);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W1, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W1, finalColIdx);
    }
}
#endif

#if WORKERS>=4
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev2 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=2;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W2);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W2);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W2, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W2, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev3 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=3;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W3);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W3);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W3, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W3, finalColIdx);
    }
}
#endif

#if WORKERS>=8
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev4 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=4;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W4);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W4);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W4, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W4, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev5 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=5;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W5);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W5);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W5, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W5, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev6 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=6;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W6);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W6);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W6, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W6, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev7 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=7;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W7);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W7);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W7, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W7, finalColIdx);
    }
}
#endif

#if WORKERS>=16

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev8 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=8;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W8);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W8);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W8, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W8, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev9 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=9;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W9);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W9);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W9, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W9, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev10 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=10;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W10);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W10);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W10, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W10, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev11 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=11;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W11);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W11);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W11, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W11, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev12 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=12;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W12);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W12);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W12, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W12, finalColIdx);
    }
}


__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev13 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=13;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W13);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W13);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W13, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W13, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev14 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=14;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W14);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W14);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W14, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W14, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev15 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=15;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W15);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W15);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W15, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W15, finalColIdx);
    }
}
#endif

#if WORKERS>=32
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev16 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=16;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W16);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W16);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W16, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W16, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev17 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=17;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W17);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W17);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W17, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W17, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev18 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=18;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W18);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W18);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W18, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W18, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev19 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=19;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W19);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W19);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W19, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W19, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev20 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=20;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W20);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W20);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W20, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W20, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev21 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=21;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W21);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W21);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W21, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W21, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev22 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=22;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W22);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W22);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W22, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W22, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev23 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=23;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W23);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W23);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W23, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W23, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev24 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=24;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W24);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W24);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W24, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W24, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev25 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=25;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W25);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W25);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W25, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W25, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev26 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=26;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W26);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W26);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W26, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W26, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev27 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=27;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W27);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W27);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W27, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W27, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev28 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=28;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W28);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W28);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W28, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W28, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev29 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=29;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W29);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W29);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W29, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W29, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev30 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=30;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W30);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W30);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W30, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W30, finalColIdx);
    }
}

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev31 ()
{   
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=31;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W31);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
	unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
	#pragma unroll 1
	for(int i = A_BLOCK_WIDTH-1; i>=0; i--)
	{
	    char a_i = read_channel_intel(CHANNELA_REV_W31);
	    short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
	    #pragma unroll 1
	    for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
	    {
		short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH); //use row
		current = current> maxRow_i?current:maxRow_i;
		current = current>maxCol[j]?current: maxCol[j]; //use maxCol
		current = current>0?current: 0;
		// update max score
		if(score_i<current){
		    score_i= current;
		    col_idx= j;
		}
		short aux1 = maxRow_i + EXTEND_GAP;
		short aux2 = maxCol[j] + EXTEND_GAP; //use maxCol
		short aux3 = current + START_GAP;
		maxRow_i = aux1> aux3?aux1:aux3;
		maxCol[j] = aux2> aux3?aux2:aux3;//define maxCol	
		row[j] = previous; //define row
		previous = current;
	    }
	    if(score<score_i){ //use score
	 	score= score_i; //define score
		row_idx= i;
		finalColIdx= col_idx;
	    }
	}//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W31, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W31, finalColIdx);
    }
}
#endif
