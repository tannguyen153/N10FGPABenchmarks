#ifndef __COMMON_ARGS_H__
#define __COMMON_ARGS_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <CL/cl.h>
#include <string.h>
#include <stdio.h>

#define USEGPU 1

#define MINIMUM(i,j) ((i)<(j) ? (i) : (j))
#define ACL_ALIGNMENT 64 // Minimum alignment for DMA transfer to Altera FPGA board

	#define CHKERR(err, str) \
    if (err != CL_SUCCESS) \
    { \
        fprintf(stdout, "CL Error %d: %s\n", err, str); \
        exit(1); \
    }


extern int _deviceType;
extern int n_platform;
extern int n_device;
extern cl_device_id device_id;
extern cl_context context;
extern cl_command_queue commands;


extern cl_device_id _ocd_get_device(int platform, int device, cl_int dev_type);
extern void ocd_initCL();

extern cl_program ocdBuildProgramFromFile(cl_context context,cl_device_id device_id,const char* kernel_file_name, const char* args);


#ifdef __cplusplus
}
#endif

#endif //__COMMONARGS_H__
