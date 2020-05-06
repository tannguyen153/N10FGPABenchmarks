CC=g++
INCLUDES = -I/opt/inteldevstack/intelFPGA_pro/hld/host/include

#libs
CL_LIBS = -L/opt/inteldevstack/intelFPGA_pro/hld/host/linux64/lib -lOpenCL

objects = main.o common_args.o

program_gpu: $(objects)
	$(CC) -O3 -fopenmp -std=c++11 $(objects) -o program_gpu $(CL_LIBS) -w
common_args.o:
	$(CC) -O3 -c common_args.c  $(INCLUDES) $(OCL_LIBS) -DUSE_DOUBLE=$(USE_DOUBLE) -w
#main.o: main.cpp kernel.hpp
#	$(CC) -O3 -fopenmp -std=c++11 -DUSE_OCL=1 -I$(INCLUDES) $(CL_LIBS) -I. -c main.cpp -o $@ -w
main.o: main_separateIO.cpp kernel.hpp
	$(CC) -O3 -fopenmp -std=c++11 -DUSE_OCL=1 -I$(INCLUDES) $(CL_LIBS) -I. -c main_separateIO.cpp -o $@ -w
clean:
	rm *.o program_gpu
	echo "all object and executables deleted"
