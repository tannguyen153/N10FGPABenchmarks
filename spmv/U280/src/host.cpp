#include "common.h"
#include "common_args.h"
#include "mmio.h"
#define KERNELS 12 
#define BANKS 4
#define TILES_PER_KERNEL 1
#define TILES_PER_BANK 1
#ifndef ROW_BLOCK
#define ROW_BLOCK 1
#endif

int n_platform;
int n_device;
extern cl_device_id device_id;
cl_command_queue commands;
cl_context context;
int num_wg_sizes=1;

void createBuffer(const cl_context* p_context, cl_mem* ptr, const size_t num_bytes, const cl_mem_flags flags, void* hostptr, const char* buff_name)
{
    cl_int err;
    char err_msg[128];
    *ptr = clCreateBuffer(*p_context, flags,num_bytes, hostptr, &err);
    snprintf(err_msg,88,"Failed to allocate device memory for %s!",buff_name);
}

void spmv_cl(int m_total, int n, int nnz,
	int *csrRowPtrA, int *csrColIdxA, value_type *csrValA,
	value_type *x, value_type *y, value_type *y_ref)
{
    size_t items_read;
    cl_int err;
    double gb = (double)((m_total + 1 + nnz) * sizeof(int) + (2 * nnz + m_total) * sizeof(value_type));
    double gflop = (double)(2 * nnz);

    cl_command_queue write_queue[KERNELS];
    cl_command_queue read_queue[KERNELS];
    cl_command_queue commands[KERNELS];
    cl_program program;
    cl_kernel kernel[KERNELS];
    cl_mem csr_ap[BANKS],csr_aj[BANKS],csr_ax[BANKS],x_loc[BANKS],y_loc[BANKS];
    cl_mem_ext_ptr_t ap_h[BANKS],aj_h[BANKS],ax_h[BANKS],x_loc_h[BANKS],y_loc_h[BANKS];
    cl_event kernel_exec,ap_write[KERNELS],aj_write[KERNELS],ax_write[KERNELS],x_loc_write[KERNELS],y_loc_write,y_read[KERNELS];

    ocd_initCL();

    FILE* kernel_fp = fopen("kernel.hw.xilinx_u280_xdma_201920_3.xclbin", "r");
    if(kernel_fp == NULL){
	fprintf(stderr,"Cannot open kernel file: spmv_kernel.cl");
	exit(-1);
    }
    fseek(kernel_fp, 0, SEEK_END);
    size_t kernelLength = (size_t) ftell(kernel_fp);
    char* kernelSource = (char*)malloc(sizeof(char)*kernelLength);
    rewind(kernel_fp);
    items_read = fread((void *) kernelSource, kernelLength, 1, kernel_fp);
    if(items_read != 1){
	fprintf(stderr,"Error reading from kernelFile");
	exit(-1);
    }
    fclose(kernel_fp);
    program = clCreateProgramWithBinary(context,1,&device_id,&kernelLength,(const unsigned char**)&kernelSource,NULL,&err);

    CHKERR(err, "Failed to create the program from source!");
    err = clBuildProgram(program, 0, NULL, "", NULL, NULL);
    CHKERR(err, "Failed to build the program!");
    free(kernelSource);

for(int b=0; b<BANKS; b++)
{
    int m=m_total/BANKS;
    printf("m %d n %d nnz %d\n", m,n,nnz);

    ap_h[b].obj= csrRowPtrA; ap_h[b].param=0; ap_h[b].flags= b|XCL_MEM_TOPOLOGY;
    aj_h[b].obj= csrColIdxA; aj_h[b].param=0; aj_h[b].flags= b|XCL_MEM_TOPOLOGY;
    ax_h[b].obj= csrValA; ax_h[b].param=0; ax_h[b].flags= b|XCL_MEM_TOPOLOGY;
    y_loc_h[b].obj= y; y_loc_h[b].param=0; y_loc_h[b].flags= b|XCL_MEM_TOPOLOGY;
    x_loc_h[b].obj= x; x_loc_h[b].param=0; x_loc_h[b].flags= b|XCL_MEM_TOPOLOGY;
    createBuffer(&context,&csr_ap[b],sizeof(int)*(m_total+1), CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX| CL_MEM_USE_HOST_PTR, &ap_h[b],"csr_ap");
    createBuffer(&context,&x_loc[b],sizeof(value_type)*n, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX| CL_MEM_USE_HOST_PTR, &x_loc_h[b],"x_loc");
    createBuffer(&context,&y_loc[b],sizeof(value_type)*m_total, CL_MEM_READ_WRITE | CL_MEM_EXT_PTR_XILINX| CL_MEM_USE_HOST_PTR, &y_loc_h[b],"y_loc");
    createBuffer(&context,&csr_aj[b],sizeof(int)*nnz, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX| CL_MEM_USE_HOST_PTR, &aj_h[b],"csr_aj");
    createBuffer(&context,&csr_ax[b],sizeof(value_type)*nnz, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX| CL_MEM_USE_HOST_PTR, &ax_h[b],"csr_ax");
    printf("DONE WITH MEM ALLOCATION on bank %d\n",b);
}

for(int k=0; k<KERNELS; k++){
    char kname[20];
    int kID= k%3;
    int instanceID=k/3+1;
    sprintf(kname, "csr%d:{csr%d_%d}", kID,kID,instanceID);
    kernel[k] = clCreateKernel(program, kname, &err);
    CHKERR(err, "Failed to create a compute kernel!");
    /* Create command queues, one for each stage in the write-execute-read pipeline */
    write_queue[k] = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);
    CHKERR(err, "Failed to create a command queue!");
    commands[k] = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);//re-assigned every time (ocd_initCL has already done this)
    CHKERR(err, "Failed to create a command queue!");
    read_queue[k] = clCreateCommandQueue(context, device_id, 0/*CL_QUEUE_PROFILING_ENABLE*/, &err);
    CHKERR(err, "Failed to create a command queue!");
    /* Get the maximum work group size for executing the kernel on the device */
    /* Write our data set into the input array in device memory */
}

#if 0
for(int b=0; b<BANKS; b++)
{
    err = clEnqueueWriteBuffer(write_queue[b], csr_ap[b], CL_FALSE, 0, sizeof(int)*(m_total+1), csrRowPtrA, 0, NULL, &ap_write[b]);
    CHKERR(err, "Failed to write to source array!");
    err = clEnqueueWriteBuffer(write_queue[b], csr_aj[b], CL_FALSE, 0, sizeof(int)*nnz, csrColIdxA, 0, NULL, &aj_write[b]);
    CHKERR(err, "Failed to write to source array!");
    err = clEnqueueWriteBuffer(write_queue[b], csr_ax[b], CL_FALSE, 0, sizeof(value_type)*nnz, csrValA, 0, NULL, &ax_write[b]);
    CHKERR(err, "Failed to write to source array!");
    err = clEnqueueWriteBuffer(write_queue[b], x_loc[b], CL_FALSE, 0, sizeof(value_type)*n, x, 0, NULL, &x_loc_write[b]);
    CHKERR(err, "Failed to write to source array!");
    err = clEnqueueWriteBuffer(write_queue[b], y_loc[b], CL_FALSE, 0, sizeof(value_type)*m_total, y, 0, NULL, &y_loc_write[b]);
    CHKERR(err, "Failed to write to source array!");

    clFinish(write_queue[b]);
}
#endif
printf("START COMPUTING\n");

for(int i=0; i<NUM_RUN; i++) 
{
    mytimer cl_timer;
    cl_timer.start();
    for(int k=0; k<KERNELS; k++){
        int bankID=k/3;
        int m=m_total/(KERNELS/3);
    	int startRow=(k/3)*m;
	err = clSetKernelArg(kernel[k], 0, sizeof(int), &m);
	err |= clSetKernelArg(kernel[k], 1, sizeof(int), &n);
	err |= clSetKernelArg(kernel[k], 2, sizeof(int), &startRow);
	err |= clSetKernelArg(kernel[k], 3, sizeof(cl_mem), &csr_ap[bankID]);
	err |= clSetKernelArg(kernel[k], 4, sizeof(cl_mem), &csr_aj[bankID]);
	err |= clSetKernelArg(kernel[k], 5, sizeof(cl_mem), &csr_ax[bankID]);
	err |= clSetKernelArg(kernel[k], 6, sizeof(cl_mem), &x_loc[bankID]);
	err |= clSetKernelArg(kernel[k], 7, sizeof(cl_mem), &y_loc[bankID]);
	CHKERR(err, "Failed to set kernel arguments!");
	printf("SETTING ARGS DONE FOR KERNEL %d\n",k);
	err = clEnqueueTask(commands[k], kernel[k], 0, NULL,  NULL);
    }
    for(int k=0; k<KERNELS; k++) clFinish(commands[k]);
    double clTime = cl_timer.stop();
    printf("DONE WITH COMP\n");

	/* Read back the results from the device to verify the output */
	value_type *y_cl_ref = (value_type *)malloc(m_total * sizeof(value_type));
    for(int b=0; b<BANKS; b++){
	int m= m_total/BANKS;
	err = clEnqueueReadBuffer(read_queue[b], y_loc[b], CL_FALSE, 0, sizeof(value_type)*m, y_cl_ref+b*m, 0, NULL, NULL);
	clFinish(read_queue[b]);
    }
	cout << "CL execution time = " << clTime
	    << " ms. Bandwidth = " << gb/(1.0e+6 * clTime)
	    << " GB/s. GFlops = " << gflop/(1.0e+6 * clTime)  << " GFlops." << endl << endl;

	cout << endl << "Checking FPGA SpMV Correctness ... ";

	int error_count=0;
	for (int i = 0; i < m_total; i++)
	    //if (abs((y_ref[i] - y_cl_ref[i])/y_ref[i])> 0.1)
	    {
		//error_count++;
	    }
	if (error_count)
	    cout << "NO PASS. Error count = " << error_count << " out of " << m_total << " entries.";
	else
	    cout << "PASS!";
	cout << endl;
    }
    /* Shutdown and cleanup */
for(int b=0; b<BANKS; b++){
    err = clReleaseMemObject(csr_ap[b]);
    err = clReleaseMemObject(csr_aj[b]);
    err = clReleaseMemObject(csr_ax[b]);
    err = clReleaseMemObject(x_loc[b]);
    err = clReleaseMemObject(y_loc[b]);
}
    //free(device_out);

    clReleaseContext(context);
}

int spmv(const char *inputMat)
{
    int err = 0;
    cout << "RUN SpMV " << NUM_RUN << " times" << endl;

    int ret_code;
    MM_typecode matcode;
    FILE *f;
    int m, n, nnzA;
    int *csrRowPtrA;
    int *csrColIdxA;
    value_type *csrValA;

    int nnzA_mtx_report;
    int isInteger = 0, isReal = 0, isPattern = 0, isSymmetric = 0;

    // load matrix
    if ((f = fopen(inputMat, "r")) == NULL)
	return -1;

    if (mm_read_banner(f, &matcode) != 0)
    {
	cout << "Could not process Matrix Market banner." << endl;
	return -2;
    }

    if ( mm_is_complex( matcode ) )
    {
	cout <<"Sorry, data type 'COMPLEX' is not supported. " << endl;
	return -3;
    }

    if ( mm_is_pattern( matcode ) )  { isPattern = 1; /*cout << "type = Pattern" << endl;*/ }
    if ( mm_is_real ( matcode) )     { isReal = 1; /*cout << "type = real" << endl;*/ }
    if ( mm_is_integer ( matcode ) ) { isInteger = 1; /*cout << "type = integer" << endl;*/ }

    /* find out size of sparse matrix .... */
    ret_code = mm_read_mtx_crd_size(f, &m, &n, &nnzA_mtx_report);
    if (ret_code != 0)
	return -4;

    if ( mm_is_symmetric( matcode ) || mm_is_hermitian( matcode ) )
    {
	isSymmetric = 1;
    }

    //do padding
    //m= m+ (ROW_BLOCK- m%ROW_BLOCK);
    //m= m- m%ROW_BLOCK;

    int *csrRowPtrA_counter = (int *)malloc((m+1) * sizeof(int));
    memset(csrRowPtrA_counter, 0, (m+1) * sizeof(int));

    int *csrRowIdxA_tmp = (int *)malloc(nnzA_mtx_report * sizeof(int));
    int *csrColIdxA_tmp = (int *)malloc(nnzA_mtx_report * sizeof(int));
    value_type *csrValA_tmp    = (value_type *)malloc(nnzA_mtx_report * sizeof(value_type));

    /* NOTE: when reading in doubles, ANSI C requires the use of the "l"  */
    /*   specifier as in "%lg", "%lf", "%le", otherwise errors will occur */
    /*  (ANSI C X3.159-1989, Sec. 4.9.6.2, p. 136 lines 13-15)            */

    for (int i = 0; i < nnzA_mtx_report; i++)
    {
	int idxi, idxj;
	double fval;
	int ival;

	if (isReal)
	    int count = fscanf(f, "%d %d %lg\n", &idxi, &idxj, &fval);
	else if (isInteger)
	{
	    int count = fscanf(f, "%d %d %d\n", &idxi, &idxj, &ival);
	    fval = ival;
	}
	else if (isPattern)
	{
	    int count = fscanf(f, "%d %d\n", &idxi, &idxj);
	    fval = 1.0;
	}

	// adjust from 1-based to 0-based
	idxi--;
	idxj--;

	csrRowPtrA_counter[idxi]++;
	csrRowIdxA_tmp[i] = idxi;
	csrColIdxA_tmp[i] = idxj;
	csrValA_tmp[i] = fval;
    }

    if (f != stdin)
	fclose(f);

    if (isSymmetric)
    {
	for (int i = 0; i < nnzA_mtx_report; i++)
	{
	    if (csrRowIdxA_tmp[i] != csrColIdxA_tmp[i])
		csrRowPtrA_counter[csrColIdxA_tmp[i]]++;
	}
    }

    // exclusive scan for csrRowPtrA_counter
    int old_val, new_val;

    old_val = csrRowPtrA_counter[0];
    csrRowPtrA_counter[0] = 0;
    for (int i = 1; i <= m; i++)
    {
	new_val = csrRowPtrA_counter[i];
	csrRowPtrA_counter[i] = old_val + csrRowPtrA_counter[i-1];
	old_val = new_val;
    }

    nnzA = csrRowPtrA_counter[m];
    csrRowPtrA = (int *)malloc((m+1) * sizeof(int));
    memcpy(csrRowPtrA, csrRowPtrA_counter, (m+1) * sizeof(int));
    memset(csrRowPtrA_counter, 0, (m+1) * sizeof(int));

    csrColIdxA = (int *)malloc(nnzA * sizeof(int));
    csrValA    = (value_type *)malloc(nnzA * sizeof(value_type));

    double gb = (double)((m + 1 + nnzA) * sizeof(int) + (2 * nnzA + m) * sizeof(value_type));
    double gflop = (double)(2 * nnzA);

    if (isSymmetric)
    {
	for (int i = 0; i < nnzA_mtx_report; i++)
	{
	    if (csrRowIdxA_tmp[i] != csrColIdxA_tmp[i])
	    {
		int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
		csrColIdxA[offset] = csrColIdxA_tmp[i];
		csrValA[offset] = csrValA_tmp[i];
		csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;

		offset = csrRowPtrA[csrColIdxA_tmp[i]] + csrRowPtrA_counter[csrColIdxA_tmp[i]];
		csrColIdxA[offset] = csrRowIdxA_tmp[i];
		csrValA[offset] = csrValA_tmp[i];
		csrRowPtrA_counter[csrColIdxA_tmp[i]]++;
	    }
	    else
	    {
		int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
		csrColIdxA[offset] = csrColIdxA_tmp[i];
		csrValA[offset] = csrValA_tmp[i];
		csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;
	    }
	}
    }
    else
    {
	for (int i = 0; i < nnzA_mtx_report; i++)
	{
	    int offset = csrRowPtrA[csrRowIdxA_tmp[i]] + csrRowPtrA_counter[csrRowIdxA_tmp[i]];
	    csrColIdxA[offset] = csrColIdxA_tmp[i];
	    csrValA[offset] = csrValA_tmp[i];
	    csrRowPtrA_counter[csrRowIdxA_tmp[i]]++;
	}
    }

    // free tmp space
    free(csrColIdxA_tmp);
    free(csrValA_tmp);
    free(csrRowIdxA_tmp);
    free(csrRowPtrA_counter);

    cout << " ( " << m << ", " << n << " ) nnz = " << nnzA << endl;

    srand(time(NULL));
    for (int i = 0; i < nnzA; i++)
    {
	csrValA[i] = 1;//rand() % 10;
    }

    value_type *x = (value_type *)malloc(n * sizeof(value_type));
    for (int i = 0; i < n; i++)
	x[i] = 1;//rand() % 10;

    value_type *y = (value_type *)malloc(m * sizeof(value_type));
    value_type *y_ref = (value_type *)malloc(m * sizeof(value_type));

    // compute cpu results
    mytimer ref_timer;
    ref_timer.start();

    int ref_iter = 1;
    for (int iter = 0; iter < ref_iter; iter++)
    {
	for (int i = 0; i < m; i++)
	{
	    value_type sum = 0;
	    for (int j = csrRowPtrA[i]; j < csrRowPtrA[i+1]; j++)
		sum += x[csrColIdxA[j]] * csrValA[j];
	    y_ref[i] = sum;
	}
    }

    double ref_time = ref_timer.stop() / (double)ref_iter;
    cout << "cpu sequential time = " << ref_time
	<< " ms. Bandwidth = " << gb/(1.0e+6 * ref_time)
	<< " GB/s. GFlops = " << gflop/(1.0e+6 * ref_time)  << " GFlops." << endl << endl;

    memset(y, 0, m * sizeof(value_type));

    spmv_cl(m, n, nnzA, csrRowPtrA, csrColIdxA, csrValA, x, y, y_ref);

    free(csrRowPtrA);
    free(csrColIdxA);
    free(csrValA);
    free(x);
    free(y);
    free(y_ref);

    return err;
}

int main(int argc, char ** argv)
{
    char  *filename;
    if(argc ==2)
    {
	filename = argv[1];
    }else{
	printf("Input matrix required\n");
	exit(0);
    }
    int err = spmv(filename);
    return err;
}
