#ifndef COMMON_H
#define COMMON_H

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string.h>
#include <math.h>

#include <sys/time.h>

#include <sys/types.h>
#include <dirent.h>

#include <cuda_runtime.h>
#include <helper_functions.h>
#include <helper_cuda.h>

#include <cusparse_v2.h>
#include <omp.h>

using namespace std;

#if USE_DOUBLE
typedef double   value_type;
#else
typedef float   value_type;
#endif

#define NUM_RUN      10

struct mytimer {
    timeval t1, t2;
    struct timezone tzone;

    void start() {
        gettimeofday(&t1, &tzone);
    }

    double stop() {
        gettimeofday(&t2, &tzone);
        double elapsedTime = 0;
        elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000.0;      // sec to ms
        elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000.0;   // us to ms
        return elapsedTime;
    }
};

#endif // COMMON_H
