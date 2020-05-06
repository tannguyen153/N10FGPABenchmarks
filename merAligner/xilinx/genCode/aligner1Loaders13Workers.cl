#define PAIR_BLOCKS 1000000
#define B_BLOCK_WIDTH 128
#define A_BLOCK_WIDTH 1024
#define EXTEND_GAP -2
#define START_GAP -2
#define MATCH 15
#define MISMATCH -3
#define WORKERS 13
#pragma OPENCL EXTENSION cl_intel_channels : enable
channel char           __attribute__((depth(1))) CHANNELA_W0;
channel char           __attribute__((depth(1))) CHANNELB_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W0;
channel char           __attribute__((depth(1))) CHANNELA_REV_W0;
channel char           __attribute__((depth(1))) CHANNELB_REV_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W0;
channel char           __attribute__((depth(1))) CHANNELA_W1;
channel char           __attribute__((depth(1))) CHANNELB_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W1;
channel char           __attribute__((depth(1))) CHANNELA_REV_W1;
channel char           __attribute__((depth(1))) CHANNELB_REV_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W1;
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
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB0(__global char * restrict a, __global char * restrict b, 
        __global const unsigned * restrict prefix_lengthA,
        __global const unsigned * restrict prefix_lengthB)
{
    __local char private_b[B_BLOCK_WIDTH];
    __local char a_cache[WORKERS][8+8];//8 bytes for forward and 8 bytes for reverse directions
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=0; w<WORKERS; w+=1)
        {
            __global char * volatile ptr_b; //declare with volatile so that the compiler will not waste area for caching loaded data 
            unsigned seqA_idx, seqB_idx;
            if(pair==0 && w==0){ seqA_idx= 0; seqB_idx= 0;}
            else{ seqA_idx     = prefix_lengthA[pair + w - 1]; seqB_idx= prefix_lengthB[pair + w - 1];}
            ptr_a[w] = &a[seqA_idx];
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
                  }
                  break;
              case 1:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W1, private_b[offset]);
                  }
                  break;
              case 2:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W2, private_b[offset]);
                  }
                  break;
              case 3:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W3, private_b[offset]);
                  }
                  break;
              case 4:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W4, private_b[offset]);
                  }
                  break;
              case 5:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W5, private_b[offset]);
                  }
                  break;
              case 6:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W6, private_b[offset]);
                  }
                  break;
              case 7:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W7, private_b[offset]);
                  }
                  break;
              case 8:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W8, private_b[offset]);
                  }
                  break;
              case 9:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W9, private_b[offset]);
                  }
                  break;
              case 10:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W10, private_b[offset]);
                  }
                  break;
              case 11:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W11, private_b[offset]);
                  }
                  break;
              case 12:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W12, private_b[offset]);
                  }
                  break;
            }//end switch
        }//end for workers
        unsigned short i_fwd=0, i_rev=A_BLOCK_WIDTH-1-8;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            unsigned short imod8= i%8;
            #pragma unroll 1
            for(unsigned short w=0; w<WORKERS; w+=1)
            {
                if(imod8==0){
                    #pragma unroll 1
                    #pragma ivdep
                    for(unsigned short i0 = 0; i0< 8; i0++){
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
                    case 1:
                        write_channel_intel(CHANNELA_W1, ai);
                        write_channel_intel(CHANNELA_REV_W1, ai_rev);
                    break;
                    case 2:
                        write_channel_intel(CHANNELA_W2, ai);
                        write_channel_intel(CHANNELA_REV_W2, ai_rev);
                    break;
                    case 3:
                        write_channel_intel(CHANNELA_W3, ai);
                        write_channel_intel(CHANNELA_REV_W3, ai_rev);
                    break;
                    case 4:
                        write_channel_intel(CHANNELA_W4, ai);
                        write_channel_intel(CHANNELA_REV_W4, ai_rev);
                    break;
                    case 5:
                        write_channel_intel(CHANNELA_W5, ai);
                        write_channel_intel(CHANNELA_REV_W5, ai_rev);
                    break;
                    case 6:
                        write_channel_intel(CHANNELA_W6, ai);
                        write_channel_intel(CHANNELA_REV_W6, ai_rev);
                    break;
                    case 7:
                        write_channel_intel(CHANNELA_W7, ai);
                        write_channel_intel(CHANNELA_REV_W7, ai_rev);
                    break;
                    case 8:
                        write_channel_intel(CHANNELA_W8, ai);
                        write_channel_intel(CHANNELA_REV_W8, ai_rev);
                    break;
                    case 9:
                        write_channel_intel(CHANNELA_W9, ai);
                        write_channel_intel(CHANNELA_REV_W9, ai_rev);
                    break;
                    case 10:
                        write_channel_intel(CHANNELA_W10, ai);
                        write_channel_intel(CHANNELA_REV_W10, ai_rev);
                    break;
                    case 11:
                        write_channel_intel(CHANNELA_W11, ai);
                        write_channel_intel(CHANNELA_REV_W11, ai_rev);
                    break;
                    case 12:
                        write_channel_intel(CHANNELA_W12, ai);
                        write_channel_intel(CHANNELA_REV_W12, ai_rev);
                    break;
                }//end switch
            }//end worker
            if(imod8==7){
                i_fwd = i_fwd +8;
                i_rev= i_rev-8
;            }
        }//end A rows
    }//end pair
}//end loadAB function
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void storeResults (
__global unsigned short* restrict seqA_align_beg, __global unsigned short* restrict seqA_align_end,
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
                case 1:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W1);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W1);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W1);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W1);
                    break;
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
            };//end switch
        }//end worker
        #pragma unroll 1
        for(unsigned short w=0; w<WORKERS; w++){
            seqA_align_end[pair+w]= row_idx[w]+1;
            seqB_align_end[pair+w]= finalColIdx[w]+1;
            seqA_align_beg[pair+w]= row_idx_rev[w]-1;
            seqB_align_beg[pair+w]= finalColIdx_rev[w];
        }
    }//end pair
}//end storeResults function
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw0()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W0);
            write_channel_intel(CHANNELB_REV_W0, private_b[offset]);
        }
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
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W0, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W0, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw1()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=1;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W1);
            write_channel_intel(CHANNELB_REV_W1, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W1);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W1, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W1, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw2()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=2;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W2);
            write_channel_intel(CHANNELB_REV_W2, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W2);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W2, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W2, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw3()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=3;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W3);
            write_channel_intel(CHANNELB_REV_W3, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W3);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W3, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W3, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw4()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=4;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W4);
            write_channel_intel(CHANNELB_REV_W4, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W4);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W4, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W4, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw5()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=5;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W5);
            write_channel_intel(CHANNELB_REV_W5, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W5);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W5, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W5, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw6()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=6;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W6);
            write_channel_intel(CHANNELB_REV_W6, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W6);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W6, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W6, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw7()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=7;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W7);
            write_channel_intel(CHANNELB_REV_W7, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W7);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W7, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W7, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw8()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=8;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W8);
            write_channel_intel(CHANNELB_REV_W8, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W8);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W8, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W8, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw9()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=9;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W9);
            write_channel_intel(CHANNELB_REV_W9, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W9);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W9, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W9, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw10()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=10;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W10);
            write_channel_intel(CHANNELB_REV_W10, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W10);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W10, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W10, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw11()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=11;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W11);
            write_channel_intel(CHANNELB_REV_W11, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W11);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W11, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W11, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw12()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=12;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W12);
            write_channel_intel(CHANNELB_REV_W12, private_b[offset]);
        }
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
            char a_i = read_channel_intel(CHANNELA_W12);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W12, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W12, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev0()
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
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W0, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W0, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev1()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W1);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W1, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W1, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev2()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W2);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W2, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W2, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev3()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W3);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W3, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W3, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev4()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W4);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W4, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W4, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev5()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W5);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W5, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W5, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev6()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W6);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W6, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W6, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev7()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W7);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W7, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W7, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev8()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W8);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W8, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W8, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev9()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W9);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W9, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W9, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev10()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W10);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W10, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W10, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev11()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W11);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W11, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W11, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev12()
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
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W12);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W12, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W12, finalColIdx);
    }
}
