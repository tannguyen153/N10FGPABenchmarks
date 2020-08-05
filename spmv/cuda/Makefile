CC=nvcc
USE_DOUBLE=1
CUDA_INSTALL_PATH = /usr/common/software/cuda/10.1.168/
INCLUDES = -I$(CUDA_INSTALL_PATH)/include -I$(CUDA_INSTALL_PATH)/samples/common/inc

#libs
CUDA_LIBS = -L$(CUDA_INSTALL_PATH)/lib -lcudart -lcusparse -lgomp
LIBS = $(CUDA_LIBS)

all:
	$(CC)  -arch=sm_70 -O3 -Xcompiler -fopenmp main.cu -o spmv $(INCLUDES) $(LIBS) -DUSE_DOUBLE=$(USE_DOUBLE) -w
clean:
	rm spmv
