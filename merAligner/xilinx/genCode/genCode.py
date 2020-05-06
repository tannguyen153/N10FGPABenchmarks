L=3
W=72
loaders=str(L)+"Loaders"
workers=str(W)+"Workers"
filename= "aligner"+loaders+workers
filename= filename+ ".cl"
f = open(filename,'w')
f.write("#define PAIR_BLOCKS 1000000\n")
f.write("#define B_BLOCK_WIDTH 128\n")
f.write("#define A_BLOCK_WIDTH 1024\n")
f.write("#define EXTEND_GAP -2\n")
f.write("#define START_GAP -2\n")
f.write("#define MATCH 15\n")
f.write("#define MISMATCH -3\n")
WORKER= "#define WORKERS "
WORKER+=str(W)
WORKER+="\n"
f.write(WORKER)
f.write("#pragma OPENCL EXTENSION cl_intel_channels : enable\n")

#generate channels that connect data loader with SW kernels
for i in range(0,W):
  channel="channel char           __attribute__((depth(1))) CHANNELA_W"+str(i)+";\n"
  f.write(channel)
  channel="channel char           __attribute__((depth(1))) CHANNELB_W"+str(i)+";\n"
  f.write(channel)
  channel="channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W"+str(i)+";\n"
  f.write(channel)
  channel="channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W"+str(i)+";\n"
  f.write(channel)
  channel="channel char           __attribute__((depth(1))) CHANNELA_REV_W"+str(i)+";\n"
  f.write(channel)
  channel="channel char           __attribute__((depth(1))) CHANNELB_REV_W"+str(i)+";\n"
  f.write(channel)
  channel="channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W"+str(i)+";\n"
  f.write(channel)
  channel="channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W"+str(i)+";\n"
  f.write(channel)

for i in range(0,L):
  loadFunc= "__attribute__((reqd_work_group_size(1,1,1)))\n"
  loadFunc+= "__kernel void loadAB"
  loadFunc+= str(i)
  loadFunc+= "(__global char * restrict a, __global char * restrict b, \n"
  loadFunc+= "        __global const unsigned * restrict prefix_lengthA,\n"
  loadFunc+= "        __global const unsigned * restrict prefix_lengthB)\n{\n"
  loadFunc+= "    __local char private_b[B_BLOCK_WIDTH];\n"
  loadFunc+= "    __local char ai;\n"
  loadFunc+= "    __local char ai_rev;\n"
#  loadFunc+= "    __local char a_cache[WORKERS][8+8];//8 bytes for forward and 8 bytes for reverse directions\n"
  loadFunc+= "    #pragma unroll 1\n"
  loadFunc+= "    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)\n    {\n"
  loadFunc+= "        __global char* volatile ptr_a[WORKERS];\n"
  loadFunc+= "        #pragma unroll 1\n"
  loadFunc+= "        for(unsigned short w="
  loadFunc+=          str(i)
  loadFunc+=          "; w<WORKERS; w+="
  loadFunc+=          str(L)
  loadFunc+=          ")\n        {\n"
  loadFunc+= "            __global char * volatile ptr_b; //declare with volatile so that the compiler will not waste area for caching loaded data \n"
  loadFunc+= "            unsigned seqA_idx, seqB_idx;\n"
  loadIdx0=  "            if(pair==0 && w==0){ seqA_idx= 0; seqB_idx= 0;}\n            else{ seqA_idx     = prefix_lengthA[pair + w - 1]; seqB_idx= prefix_lengthB[pair + w - 1];}\n"
  loadIdx1=  "            seqA_idx     = prefix_lengthA[pair + w - 1];\n            seqB_idx     = prefix_lengthB[pair + w - 1];\n"
  if i==0: loadFunc+= loadIdx0
  else: loadFunc+= loadIdx1
  loadFunc+= "            ptr_a[w] = &a[seqA_idx];\n"
  loadFunc+= "            ptr_b = &b[seqB_idx];\n"
  loadFunc+= "            #pragma unroll 1\n"
  loadFunc+= "            #pragma ivdep\n"
  loadFunc+= "            for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)\n            {\n"
  loadFunc+= "                private_b[j] = ptr_b[j];\n            }\n"
  loadFunc+= "            switch(w){\n"
  for w in range(i,W,L):
    loadFunc+= "              case "
    loadFunc+= str(w)
    loadFunc+= ":\n"
    loadFunc+= "                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)\n                  {\n"
    loadFunc+= "                      write_channel_intel(CHANNELB_W"
    loadFunc+= str(w)
#    loadFunc+= ", private_b[offset]);\n"
#    loadFunc+= "                      write_channel_intel(CHANNELB_REV_W"
#    loadFunc+= str(w)
    loadFunc+= ", private_b[offset]);\n                  }\n"
    loadFunc+= "                  break;\n"

  loadFunc+= "            }//end switch\n"
  loadFunc+= "        }//end for workers\n"

  #loadFunc+= "        unsigned short i_fwd=0, i_rev=A_BLOCK_WIDTH-1-8;\n"
  loadFunc+= "        unsigned short i_rev=A_BLOCK_WIDTH-1;\n"
  loadFunc+= "        #pragma unroll 1\n"
  loadFunc+= "        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)\n        {\n"
#  loadFunc+= "            unsigned short imod8= i%8;\n"
  loadFunc+= "            #pragma unroll 1\n"
  loadFunc+= "            for(unsigned short w="
  loadFunc+=              str(i)
  loadFunc+=              "; w<WORKERS; w+="
  loadFunc+=              str(L)
  loadFunc+=              ")\n            {\n"
#  loadFunc+= "                if(imod8==0){\n"
#  loadFunc+= "                    #pragma unroll 1\n"
#  loadFunc+= "                    #pragma ivdep\n"
#  loadFunc+= "                    for(unsigned short i0 = 0; i0< 8; i0++){\n"
#  loadFunc+= "                        a_cache[w][i0]= ptr_a[w][i_fwd+i0];\n"
#  loadFunc+= "                        a_cache[w][8+i0]= ptr_a[w][i_rev+i0];\n"
#  loadFunc+= "                    }\n                }\n"
#  loadFunc+= "                char ai     = a_cache[w][imod8];\n"
#  loadFunc+= "                char ai_rev     = a_cache[w][15-imod8];\n"
  loadFunc+= "                ai     = ptr_a[w][i];\n"
  loadFunc+= "                ai_rev     = ptr_a[w][i_rev];\n"
  loadFunc+= "                switch(w){\n"
  for w in range(i,W,L):
    loadFunc+= "                    case "
    loadFunc+= str(w)
    loadFunc+= ":\n"
    loadFunc+= "                        write_channel_intel(CHANNELA_W"
    loadFunc+= str(w)
    loadFunc+= ", ai);\n"
    loadFunc+= "                        write_channel_intel(CHANNELA_REV_W"
    loadFunc+= str(w)
    loadFunc+= ", ai_rev);\n"
    loadFunc+= "                    break;\n"
  loadFunc+= "                }//end switch\n"		
  loadFunc+= "            }//end worker\n"		
#  loadFunc+= "            if(imod8==7){\n"
#  loadFunc+= "                i_fwd = i_fwd +8;\n"
  loadFunc+= "            i_rev= i_rev-1;\n"
#  loadFunc+= "                i_rev= i_rev-8\n;"
#  loadFunc+= "            }\n"
  loadFunc+= "        }//end A rows\n"		
  loadFunc+= "    }//end pair\n"
  loadFunc+= "}//end loadAB function\n"
  f.write(loadFunc);



storeResultsFunc=  "__attribute__((reqd_work_group_size(1,1,1)))\n"
storeResultsFunc+= "__kernel void storeResults (\n"
storeResultsFunc+= "__global unsigned short* restrict seqA_align_beg, __global unsigned short* restrict seqA_align_end,\n"
storeResultsFunc+= "__global unsigned short* restrict seqB_align_beg, __global unsigned short* restrict seqB_align_end)\n{\n"
storeResultsFunc+= "    #pragma unroll 1\n"
storeResultsFunc+= "    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)\n    {\n"
storeResultsFunc+= "        unsigned short row_idx[WORKERS], finalColIdx[WORKERS], row_idx_rev[WORKERS], finalColIdx_rev[WORKERS];\n"
storeResultsFunc+= "        for(unsigned short w=0; w<WORKERS; w++)\n        {\n"
storeResultsFunc+= "            switch(w){\n"
for w in range(0,W):
  storeResultsFunc+= "                case "
  storeResultsFunc+= str(w)
  storeResultsFunc+=  ":\n"
  storeResultsFunc+= "                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W"
  storeResultsFunc+= str(w)
  storeResultsFunc+= ");\n"
  storeResultsFunc+= "                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W"
  storeResultsFunc+= str(w)
  storeResultsFunc+= ");\n"
  storeResultsFunc+= "                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W"
  storeResultsFunc+= str(w)
  storeResultsFunc+= ");\n"
  storeResultsFunc+= "                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W"
  storeResultsFunc+= str(w)
  storeResultsFunc+= ");\n"
  storeResultsFunc+= "                    break;\n"
storeResultsFunc+= "            };//end switch\n"
storeResultsFunc+= "        }//end worker\n"		
storeResultsFunc+= "        #pragma unroll 1\n"
storeResultsFunc+= "        for(unsigned short w=0; w<WORKERS; w++){\n"
storeResultsFunc+= "            seqA_align_end[pair+w]= row_idx[w]+1;\n"
storeResultsFunc+= "            seqB_align_end[pair+w]= finalColIdx[w]+1;\n"
storeResultsFunc+= "            seqA_align_beg[pair+w]= row_idx_rev[w]-1;\n"
storeResultsFunc+= "            seqB_align_beg[pair+w]= finalColIdx_rev[w];\n"
storeResultsFunc+= "        }\n"
storeResultsFunc+= "    }//end pair\n"
storeResultsFunc+= "}//end storeResults function\n"
f.write(storeResultsFunc);

for i in range(0,W):
  sw="__attribute__((reqd_work_group_size(1,1,1)))\n"
  sw+="__kernel void sw"
  sw+=str(i)
  sw+="()\n{\n"
  sw+="    __local short row[B_BLOCK_WIDTH];\n"
  sw+="    __local short maxCol[B_BLOCK_WIDTH];\n"
  sw+="    #pragma unroll 1\n"
  sw+="    for(unsigned pair="
  sw+=str(i)
  sw+=";pair<PAIR_BLOCKS; pair+=WORKERS)\n    {\n"
  sw+="        char private_b[B_BLOCK_WIDTH];\n"
  sw+="        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){\n"
  sw+="            private_b[offset] = read_channel_intel(CHANNELB_W"
  sw+=str(i)
  sw+=");\n"
  sw+="            write_channel_intel(CHANNELB_REV_W"
  sw+=str(i)
  sw+= ", private_b[offset]);\n"
  sw+="        }\n"
  sw+="        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)\n"
  sw+="        {\n"
  sw+="            row[offset]=0;\n"
  sw+="            maxCol[offset]=0;\n"
  sw+="        }\n"
  sw+="        short score=0;\n"
  sw+="        unsigned short row_idx=0, finalColIdx=0;\n"
  sw+="        #pragma unroll 1\n"
  sw+="        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)\n        {\n"
  sw+="            char a_i = read_channel_intel(CHANNELA_W"
  sw+=str(i)
  sw+=");\n"
  sw+="            short previous=0,maxRow_i=0,score_i=0,col_idx=0;\n"
  sw+="            #pragma unroll 1\n"
  sw+="            for(short j=0; j<B_BLOCK_WIDTH; j++)\n            {\n"
  sw+="                unsigned short j0= B_BLOCK_WIDTH-1-j;\n"
  sw+="                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);\n"
  sw+="                current = current> maxRow_i?current:maxRow_i;\n"
  sw+="                current = current>maxCol[j0]?current: maxCol[j0];\n"
  sw+="                current = current>0?current: 0;\n"
  sw+="                // update max score\n"
  sw+="                if(score_i<current){\n"
  sw+="                   score_i= current;\n"
  sw+="                   col_idx= j;\n"
  sw+="                }\n"
  sw+="                short aux1 = maxRow_i + EXTEND_GAP;\n"
  sw+="                short aux2 = maxCol[j0] + EXTEND_GAP;\n"
  sw+="                short aux3 = current + START_GAP;\n"
  sw+="                maxRow_i = aux1> aux3?aux1:aux3;\n"
  sw+="                maxCol[j0] = aux2> aux3?aux2:aux3;\n"       
  sw+="                row[j0] = previous;\n"
  sw+="                previous = current;\n"
  sw+="            }\n"
  sw+="            if(score<score_i){\n"
  sw+="                score= score_i;\n"
  sw+="                row_idx= i;\n"
  sw+="                finalColIdx= col_idx;\n"
  sw+="            }\n"
  sw+="        }//end all rows\n" 
  sw+="        write_channel_intel(CHANNEL_ROWIDX_W"
  sw+=str(i)
  sw+=", row_idx);\n"
  sw+="        write_channel_intel(CHANNEL_COLIDX_W"
  sw+=str(i)
  sw+=", finalColIdx);\n"
  sw+="    }\n"
  sw+="}\n"
  f.write(sw);

for i in range(0,W):
  sw="__attribute__((reqd_work_group_size(1,1,1)))\n"
  sw+="__kernel void sw_rev"
  sw+=str(i)
  sw+="()\n{\n"
  sw+="    __local short row[B_BLOCK_WIDTH];\n"
  sw+="    __local short maxCol[B_BLOCK_WIDTH];\n"
  sw+="    #pragma unroll 1\n"
  sw+="    for(unsigned pair="
  sw+=str(i)
  sw+=";pair<PAIR_BLOCKS; pair+=WORKERS)\n    {\n"
  sw+="        char private_b[B_BLOCK_WIDTH];\n"
  sw+="        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)\n"
  sw+="            private_b[offset] = read_channel_intel(CHANNELB_REV_W"
  sw+=str(i)
  sw+=");\n"
  sw+="        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)\n"
  sw+="        {\n"
  sw+="            row[offset]=0;\n"
  sw+="            maxCol[offset]=0;\n"
  sw+="        }\n"
  sw+="        short score=0;\n"
  sw+="        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;\n"
  sw+="        #pragma unroll 1\n"
  sw+="        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)\n        {\n"
  sw+="            char a_i = read_channel_intel(CHANNELA_REV_W"
  sw+=str(i)
  sw+=");\n"
  sw+="            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;\n"
  sw+="            #pragma unroll 1\n"
  sw+="            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)\n            {\n"
  sw+="                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);\n"
  sw+="                current = current> maxRow_i?current:maxRow_i;\n"
  sw+="                current = current>maxCol[j]?current: maxCol[j];\n"
  sw+="                current = current>0?current: 0;\n"
  sw+="                if(score_i<current){\n"
  sw+="                    score_i= current;\n"
  sw+="                    col_idx= j;\n"
  sw+="                }\n"
  sw+="                short aux1 = maxRow_i + EXTEND_GAP;\n"
  sw+="                short aux2 = maxCol[j] + EXTEND_GAP;\n"
  sw+="                short aux3 = current + START_GAP;\n"
  sw+="                maxRow_i = aux1> aux3?aux1:aux3;\n"
  sw+="                maxCol[j] = aux2> aux3?aux2:aux3;\n"
  sw+="                row[j] = previous;\n"
  sw+="                previous = current;\n"
  sw+="            }\n"
  sw+="            if(score<score_i){\n"
  sw+="                score= score_i;\n"
  sw+="                row_idx= i;\n"
  sw+="                finalColIdx= col_idx;\n"
  sw+="            }\n"
  sw+="        }//end all rows\n"
  sw+="        write_channel_intel(CHANNEL_ROWIDX_REV_W"
  sw+=str(i)
  sw+=", row_idx);\n"
  sw+="        write_channel_intel(CHANNEL_COLIDX_REV_W"
  sw+=str(i)
  sw+=", finalColIdx);\n"
  sw+="    }\n"
  sw+="}\n"
  f.write(sw);
  



f.close()
