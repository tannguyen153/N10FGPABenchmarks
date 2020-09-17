#include <mpi.h>
#include <strings.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <string.h>
#ifdef MKL
#include "mkl.h"
#else
#endif

#define REPEATS 1
//#define _DOUBLE

#ifdef _DOUBLE 
#define DOUBLE double
#define MPI_TYPE MPI_DOUBLE
#ifdef MKL
extern "C" void dgemm_(const char *transa, const char *transb, const int *m, const int *n, const int *k, const DOUBLE *alpha, const DOUBLE *a, const int *lda, const DOUBLE *b, const int *ldb, const DOUBLE *beta, DOUBLE *c, const int *ldc);
#endif

#else
#define DOUBLE float
#define MPI_TYPE MPI_FLOAT
#ifdef MKL
extern "C" void sgemm_(const char *transa, const char *transb, const int *m, const int *n, const int *k, const DOUBLE *alpha, const DOUBLE *a, const int *lda, const DOUBLE *b, const int *ldb, const DOUBLE *beta, DOUBLE *c, const int *ldc);
#endif
#endif

const double kMicro = 1.0e-6;
double get_time()
{
    struct timeval TV;
    const int RC = gettimeofday(&TV, NULL);
    if(RC == -1)
    {
	printf("ERROR: Bad call to gettimeofday\n");
	return(-1);
    }
    return( ((double)TV.tv_sec) + kMicro * ((double)TV.tv_usec) );
}  // end getTime()

void print_mat(DOUBLE  *mat, int m, int n){
    for (int j=0; j<n;j++){
	for (int i=0; i<m; i++){
	    int index = j*m +i;
	    printf("%e   ",mat[index]);
	}
	printf("\n");
    }
    printf("\n\n");
}

int min(int a, int b){
    return a>b?b:a;
}


int main(int argc, char* argv[])
{
    int M=128, N=128, K=128, m=128, n=128, k=128;
    int px=1, py=1;
    int m_a=128,k_a=128, k_b=128, n_b=128, m_c=128, n_c=128;
    int up, down, left, right;
    int panel;
    int panelSize_a;
    int panelSize_b;
    int verify = 0;
    int error = 0;
    int communication = 1;
    DOUBLE one = 1.0;
    double tolerance = 1e-6;
    DOUBLE *A,*B,*C, *a_tmp, *b_tmp;
    int arg = 0;
    while(++arg < argc) {
	if(!strcmp(argv[arg], "-M"))
	    M = atoi(argv[++arg]);
	else
	    if(!strcmp(argv[arg], "-K"))
		K = atoi(argv[++arg]);
	    else
		if(!strcmp(argv[arg], "-N"))
		    N = atoi(argv[++arg]);
		else
		    if(!strcmp(argv[arg], "-px"))
			px = atoi(argv[++arg]);
		    else
			if(!strcmp(argv[arg], "-py"))
			    py = atoi(argv[++arg]);
			else
			    if(!strcmp(argv[arg], "-l"))
				panel = atoi(argv[++arg]);
			    else
				if(!strcmp(argv[arg], "-v"))
				    verify = 1;
				else
				    if(!strcmp(argv[arg], "-nc"))
					communication = 0;
    }
    int rank, size;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if(size!= px*py) {
	printf("px*py must be equal to the total number of processors\n");
	exit(0);
    }

    int ranky = rank/px;
    int rankx = rank%px;

    m_a = M/py; 
    k_a = K/px; 
    k_b = K/py; 
    n_b = N/px; 
    m_c = m_a; 
    n_c = n_b; 
    if(panel > k_a) panel = k_a;
    if(panel > k_b) panel = k_b;

    up = (rank - px + size)%size;
    down = (rank + px)%size;
    left = rank - 1 + (rank%px==0?px:0);
    right = rank + 1 - (rank%px==px-1?px:0);

    A = (DOUBLE*)malloc(m_a*k_a*sizeof(DOUBLE));
    B = (DOUBLE*)malloc(k_b*n_b*sizeof(DOUBLE));
    C = (DOUBLE*)malloc(m_c*n_c*sizeof(DOUBLE));

    panelSize_a = m_a*panel;
    panelSize_b = n_b*panel;
    a_tmp = (DOUBLE*) malloc(panelSize_a*sizeof(DOUBLE));
    b_tmp = (DOUBLE*) malloc(panelSize_b*sizeof(DOUBLE));

    DOUBLE *aptr, *bptr;
    aptr = A; bptr = B;
    for(int i = k_a*rankx; i < k_a*(rankx+1); i++)
	for(int j = m_a*ranky; j < m_a*(ranky+1); j++){
	    *aptr = 1.0/(i+j+1);
	    aptr++; 
	}

    for(int i = n_b*rankx; i < n_b*(rankx+1); i++)
	for(int j = k_b*ranky; j < k_b*(ranky+1); j++){
	    *bptr = 1.0/(i+j+1);
	    bptr++; 
	}
    aptr = A;
    bptr = B;
    bzero(C, sizeof(DOUBLE)*m_c*n_c);

    MPI_Status status;
    int numPanels_a = k_a/panel;
    int numPanels_b = k_b/panel;
    int ii=0, jj=0;
    int icurrow =0;
    int icurcol =0;
    int iwrk =0;

    double execTime;
    MPI_Barrier(MPI_COMM_WORLD);
    for(int r=0; r<REPEATS; r++)
    {
	execTime = -get_time();
	iwrk = min (panel, k_b -ii);
	iwrk = min (iwrk, k_a -jj);
	panelSize_a = m_a * iwrk;
	panelSize_b = n_b * iwrk; 

	for(int kk = 0; kk < K; kk+=iwrk) {
	    if((icurcol == rankx) && communication){
		aptr = A + jj*m_a;
		MPI_Send(aptr, panelSize_a, MPI_TYPE, right, 0, MPI_COMM_WORLD);
	    }
	    if((icurrow == ranky) && communication){
		bptr = B + ii;
		DOUBLE* it = bptr ;
		for(int i=0; i<n_b; i++){
		    memcpy(&b_tmp[i*iwrk], it, iwrk*sizeof(DOUBLE));
		    it += k_b;
		}
		bptr = b_tmp;
		MPI_Send(bptr, panelSize_b, MPI_TYPE, down, 1, MPI_COMM_WORLD);
	    }
	    if(communication && (icurcol != rankx || px==1)){
		MPI_Recv(a_tmp, panelSize_a, MPI_TYPE, left, 0, MPI_COMM_WORLD, &status);
		aptr = a_tmp;
		if((icurcol+ px-1)%px != rankx){//end of the x ring does not need to send
		    MPI_Send(aptr, panelSize_a, MPI_TYPE, right, 0, MPI_COMM_WORLD);
		}
	    }
	    if(communication && (icurrow != ranky || py==1)){
		MPI_Recv(b_tmp, panelSize_b, MPI_TYPE, up, 1, MPI_COMM_WORLD, &status);
		bptr = b_tmp;
		if((icurrow+py-1)%py != ranky) {//end of the y ring do not need to send
		    MPI_Send(bptr, panelSize_b, MPI_TYPE, down, 1, MPI_COMM_WORLD);
		}
	    }
#ifdef MKL
#ifdef _DOUBLE 
	    dgemm_("N", "N", &m_c, &n_c, &iwrk, &one, aptr, &m_a, bptr,  &iwrk, &one, C, &m_c);
#else
	    sgemm_("N", "N", &m_c, &n_c, &iwrk, &one, aptr, &m_a, bptr,  &iwrk, &one, C, &m_c);
#endif
#endif
	    ii += iwrk;
	    jj += iwrk;
	    if (jj>=k_a) {jj = 0; icurcol++;}
	    if (ii>=k_b) {ii = 0; icurrow++;}
	    iwrk = min (panel, k_b -ii);
	    iwrk = min (iwrk, k_a -jj);
	    panelSize_a = m_a * iwrk;
	    panelSize_b = n_b * iwrk; 
	}
    }
    MPI_Barrier(MPI_COMM_WORLD);
    execTime += get_time();
    MPI_Barrier(MPI_COMM_WORLD);

    if(verify){
	DOUBLE* cptr = C;
	for(int j = n_c*rankx; j < n_c*(rankx+1) && !error; j++) 
	    for(int i = m_c*ranky; i < m_c*(ranky+1) && !error; i++, cptr++){
		DOUBLE tmp = 0;
		for(int k = 0; k < K; k++)
		    tmp += 1.0/((i+k+1)*(k+j+1));
		error = fabs(*cptr-tmp) > tolerance;
	    }
	int temp = error;
	MPI_Reduce(&temp, &error, 1, MPI_INT, MPI_MAX, 0, MPI_COMM_WORLD);
    }

    double gflops = (2e-9)*M*K*N/(execTime/REPEATS);

    if(rank==0) {
	printf("Execution time: %e  \n",execTime);
	if(verify) 
	    printf("Verification %s \n", (error?"failed":"succeeded"));
	printf("GFLOPS: %e \n",gflops);
    }
    MPI_Finalize();
    return 0;
}
