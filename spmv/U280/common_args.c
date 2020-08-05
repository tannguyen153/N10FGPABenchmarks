#include "src/common_args.h"

int _deviceType=0;//default for CPU, if no device option given
int optimized;
cl_device_id device_id;

cl_device_id _ocd_get_device(int platform, int device, cl_int dev_type)
{
    cl_int err;
    cl_uint nPlatforms = 1;
    char DeviceName[100];
    cl_device_id* devices;
    err = clGetPlatformIDs(0, NULL, &nPlatforms);
    printf("Num platforms %d\n", nPlatforms);
    cl_platform_id *platforms = (cl_platform_id *) malloc(sizeof (cl_platform_id) * nPlatforms);
    err = clGetPlatformIDs(nPlatforms, platforms, NULL);

    cl_uint nDevices = 1;
    char platformName[100];
    err = clGetPlatformInfo(platforms[platform], CL_PLATFORM_VENDOR, sizeof (platformName), platformName, NULL);
    printf("Platform Chosen : %s\n", platformName);

    if(device!=-1){
	err = clGetDeviceIDs(platforms[platform], CL_DEVICE_TYPE_ALL, 0, NULL, &nDevices);
	printf("Number of available devices: %d\n", nDevices);
	if (nDevices <= 0) {
	    printf("No OpenCL Device found. Exiting.\n");
	    exit(0);
	}
	if (device < 0 || device >= nDevices) // platform ID out of range
	{
	    printf("Device index %d is out of range. \n", device);
	    exit(-4);
	}
	devices = (cl_device_id *) malloc(sizeof (cl_device_id) * nDevices);
	err = clGetDeviceIDs(platforms[platform], CL_DEVICE_TYPE_ALL, nDevices, devices, NULL);
	err = clGetDeviceInfo(devices[device], CL_DEVICE_NAME, sizeof (DeviceName), DeviceName, NULL);
    }
    //OTHERWISE, check at the device type parameter
    else{
	// query devices
	err = clGetDeviceIDs(platforms[platform], dev_type, 0, NULL, &nDevices);
	if(err == CL_DEVICE_NOT_FOUND)
	{
	    fprintf(stderr,"No supported device of requested type found. Falling back to CPU.\n");
	    dev_type = CL_DEVICE_TYPE_CPU;
	    err = clGetDeviceIDs(platforms[platform], dev_type, 0, NULL, &nDevices);
	    if(err == CL_DEVICE_NOT_FOUND){
		fprintf(stderr, "No CPU device available in this platform. Please, check your available OpenCL devices.\n"); 
		exit(-4);
	    }
	}
	printf("Number of available devices: %d\n", nDevices);
	if (nDevices <= 0) {
	    printf("No OpenCL Device found. Exiting.\n");
	    exit(0);
	}
	devices = (cl_device_id *) malloc(sizeof (cl_device_id) * nDevices);
	err = clGetDeviceIDs(platforms[platform], dev_type, nDevices, devices, NULL);
	//Get the first available device of requested type
	err = clGetDeviceInfo(devices[0], CL_DEVICE_NAME, sizeof (DeviceName), DeviceName, NULL);
	device=0;
    }

    //Return
    printf("Device Chosen : %s\n", DeviceName);
    return devices[device];
}


void ocd_initCL()
{

    cl_int dev_type = CL_DEVICE_TYPE_GPU;
    device_id = _ocd_get_device(0, 0, dev_type);

    // Create a compute context
    cl_int err;
    context = clCreateContext(0, 1, &device_id, NULL, NULL, &err);
    CHKERR(err, "Failed to create a compute context!");

    // Create a command queue
    commands = clCreateCommandQueue(context, device_id, CL_QUEUE_PROFILING_ENABLE, &err);
    CHKERR(err, "Failed to create a command queue!");

}


cl_program ocdBuildProgramFromFile(cl_context   context
	, cl_device_id device_id
	, const  char* kernel_file
	, const  char* args)
{
    cl_int err;
    cl_program program;
    size_t kernelLength;
    char* kernelSource;
    FILE* kernel_fp;
    size_t items_read;
    const char* kernel_file_mode;
    char define_argument[100];
    cl_device_type device_type; //Reconfirming that it was correct
    strcpy(define_argument, " -DOPENCL -I. ");

    clGetDeviceInfo(device_id, CL_DEVICE_TYPE, sizeof(cl_device_type),&device_type,NULL); 


    kernel_file_mode = "r";
    kernel_fp = fopen(kernel_file, kernel_file_mode);
    if(kernel_fp == NULL){
	fprintf(stderr,"common_ocl.ocdBuildProgramFromFile() - Cannot open kernel file! %s", kernel_file);
	exit(-1);
    }
    fseek(kernel_fp, 0, SEEK_END);
    kernelLength = (size_t) ftell(kernel_fp);
    kernelSource = (char*)malloc(sizeof(char)*kernelLength);
    if(kernelSource == NULL){
	fprintf(stderr,"common_ocl.ocdBuildProgramFromFile() - Heap Overflow! Cannot allocate space for kernelSource.");
	exit(-1);
    }
    rewind(kernel_fp);
    items_read = fread((void *) kernelSource, kernelLength, 1, kernel_fp);
    if(items_read != 1){
	fprintf(stderr,"common_ocl.ocdBuildProgramFromFile() - Error reading from kernelFile");
	exit(-1);
    }
    fclose(kernel_fp);

    /* Create the compute program from the source buffer */
    program = clCreateProgramWithSource(context, 1, (const char **) &kernelSource, &kernelLength, &err);

    /* Build the program executable */
    err = clBuildProgram(program, 0, NULL,define_argument, NULL, NULL);

    if (err == CL_BUILD_PROGRAM_FAILURE)
    {
	char *buildLog;
	size_t logLen;
	err = clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, 0, NULL, &logLen);
	buildLog = (char *) malloc(sizeof(char)*logLen);
	if(buildLog == NULL){
	    fprintf(stderr,"common_ocl.ocdBuildProgramFromFile() - Heap Overflow! Cannot allocate space for buildLog.");
	    exit(-1);
	}
	err = clGetProgramBuildInfo(program, device_id, CL_PROGRAM_BUILD_LOG, logLen, (void *) buildLog, NULL);
	fprintf(stderr, "CL Error %d: Failed to build program! Log:\n%s", err, buildLog);
	free(buildLog);
	exit(1);
    }

    free(kernelSource); /* Free kernel source */
    return program;
}
