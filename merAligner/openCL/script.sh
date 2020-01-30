#!/bin/bash

module load cuda
export OMP_NUM_THREADS=1
srun -n 1 ./program_gpu ./ref_file_30000.txt ./que_file_30000.txt ./results_30000

