#objects = main.o kernel.o
objects = main.o common_args.o #kernel.o
ARCH = compute_70
ifeq ($(DEBUG),TRUE)
	NVCCFLAGS = -g -G -Xcompiler -fopenmp
else
	NVCCFLAGS = -O3 -Xcompiler -fopenmp
endif

CUDA_INSTALL_PATH = /usr/common/software/cuda/10.1.168/
OCL_LIBS = -L$(CUDA_INSTALL_PATH)/lib64 -lOpenCL
INCLUDES = -I$(CUDA_INSTALL_PATH)/include -I$(CUDA_INSTALL_PATH)/include/CL/

program_gpu: $(objects)
	nvcc -std=c++11 $(NVCCFLAGS) -arch=$(ARCH) $(objects) -o program_gpu $(OCL_LIBS)
common_args.o:
	$(CC)  -O3 -c common_args.c  $(INCLUDES) $(OCL_LIBS) -DUSE_DOUBLE=$(USE_DOUBLE) -w
main.o: main.cpp kernel.hpp
	#nvcc -x cu $(NVCCFLAGS) -DUSE_CUDA=1 -I$(INCLUDES) $(OCL_LIBS) -arch=$(ARCH) -I. -c main.cpp -o $@
	nvcc -x cu $(NVCCFLAGS) -DUSE_OCL=1 -I$(INCLUDES) $(OCL_LIBS) -arch=$(ARCH) -I. -c main.cpp -o $@
#kernel.o: kernel.cpp kernel.hpp
	#nvcc -x cu $(NVCCFLAGS) -arch=$(ARCH) -I. -c kernel.cpp -o $@
clean:
	rm *.o program_gpu
	echo "all object and executables deleted"
