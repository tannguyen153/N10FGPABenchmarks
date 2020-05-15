#!/bin/bash
nvcc -DNTIMES=1000 -arch=sm_70 -O3 -c kernel.cu -o kernel.o
CC -c -fPIC libbutils.cpp -o libbutils.o
ar rcs libbutils.a libbutils.o
CC -I/usr/common/software/cuda/10.2.89/include/ -DUSE_CUDA=1 -DNTIMES=1000 -DTHREADS_PER_BLOCK=1024 -c ./benchmark_mt.cpp -o ./benchmark_mt.o -fopenmp -O3
CC benchmark_mt.o kernel.o -o benchmark_mt -fopenmp -O3 -v -L. -lbutils -L/usr/common/software/cuda/10.2.89/lib64 -lcudart
