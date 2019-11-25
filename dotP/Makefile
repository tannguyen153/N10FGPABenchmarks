CC=g++
USE_DOUBLE=0
FLAGS+=-O3
INCLUDES = -I/opt/inteldevstack/intelFPGA_pro/hld/host/include 

CL_LIBS = -L/opt/inteldevstack/intelFPGA_pro/hld/host/linux64/lib -lOpenCL

all:
	$(CC)  -O3 -c common_args.c  $(INCLUDES) $(CL_LIBS) -DUSE_DOUBLE=$(USE_DOUBLE) -w
	$(CC)  -O3 -fopenmp main.C common_args.o -o dotP $(INCLUDES) $(CL_LIBS) -DUSE_DOUBLE=$(USE_DOUBLE) -DNUM_RUN=2 -DWG_SIZE=$(SET_WG_SIZE) -DNGROUPS=$(SET_NGROUPS) -DROW_BLOCK=$(SET_ROW_BLOCK) $(FLAGS) -w
clean:
	rm *.o
	rm dotP
