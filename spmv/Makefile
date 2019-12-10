CC=g++
USE_DOUBLE=0
INCLUDES = -I/opt/inteldevstack/intelFPGA_pro/hld/host/include 

#libs
CL_LIBS = -L/opt/inteldevstack/intelFPGA_pro/hld/host/linux64/lib -lOpenCL

SET_WG_SIZE=128
SET_NGROUPS= 4
SET_ROW_BLOCK=64

all:
	$(CC)  -O3 -c common_args.c  $(INCLUDES) $(CL_LIBS) -DUSE_DOUBLE=$(USE_DOUBLE) -w
	$(CC)  -O3 main.C common_args.o -o spmv $(INCLUDES) $(CL_LIBS) -DUSE_DOUBLE=$(USE_DOUBLE) -DNUM_RUN=2 -DWG_SIZE=$(SET_WG_SIZE) -DNGROUPS=$(SET_NGROUPS) -DROW_BLOCK=$(SET_ROW_BLOCK) -w
clean:
	rm *.o
	rm spmv
