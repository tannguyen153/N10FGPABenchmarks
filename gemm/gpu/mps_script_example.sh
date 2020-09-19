#!/bin/bash
#
# Example usage:
# > srun -n 2 -c 1 mps-wrapper.sh command arg1 arg2 ...
#
# https://docs.nvidia.com/deploy/mps/index.html
export CUDA_MPS_PIPE_DIRECTORY=/tmp/nvidia-mps
export CUDA_MPS_LOG_DIRECTORY=/tmp/nvidia-log
# https://docs.nvidia.com/deploy/mps/index.html#topic_3_3_5_2
# export CUDA_MPS_ACTIVE_THREAD_PERCENTAGE=$((100 / $SLURM_NTASKS))

export CUDA_MPS_ACTIVE_THREAD_PERCENTAGE=1
if [ $SLURM_PROCID -eq 0 ]; then
    nvidia-cuda-mps-control -d
fi
sleep 5
srun -n 1 ./main 8192 8192 8192
# run the command
if [ $SLURM_PROCID -eq 0 ]; then
    echo quit | nvidia-cuda-mps-control
fi

export CUDA_MPS_ACTIVE_THREAD_PERCENTAGE=5
if [ $SLURM_PROCID -eq 0 ]; then
    nvidia-cuda-mps-control -d
fi
sleep 5
srun -n 1 ./main 8192 8192 8192
# run the command
if [ $SLURM_PROCID -eq 0 ]; then
    echo quit | nvidia-cuda-mps-control
fi

export CUDA_MPS_ACTIVE_THREAD_PERCENTAGE=20
if [ $SLURM_PROCID -eq 0 ]; then
    nvidia-cuda-mps-control -d
fi
sleep 5
srun -n 1 ./main 8192 8192 8192
# run the command
if [ $SLURM_PROCID -eq 0 ]; then
    echo quit | nvidia-cuda-mps-control
fi

export CUDA_MPS_ACTIVE_THREAD_PERCENTAGE=80
if [ $SLURM_PROCID -eq 0 ]; then
    nvidia-cuda-mps-control -d
fi
sleep 5
srun -n 1 ./main 8192 8192 8192
# run the command
if [ $SLURM_PROCID -eq 0 ]; then
    echo quit | nvidia-cuda-mps-control
fi
