#include <stdio.h>
#include "timing.h"
#include <stdlib.h>
#include <math.h>
#include <unistd.h>
#include <string.h>

void dummy(double*);

int getFreq(char hostname[], long *freq)
{
  if (strcmp(hostname, "casclakesp2") == 0){
      *freq = (long)(2.5*pow(10,9));
      return 0;
  }
  if (strcmp(hostname, "warmup") == 0){
      *freq = (long)(2.2*pow(10,9));
      return 0;
  }
  return -1;
}

void stencil(int size_M, int size_N, int size_P, double c0, double c1) {
  double * restrict a, * restrict b;
  long size = size_M * size_N * size_P;
  a = aligned_alloc(64, size*sizeof(double));
  b = aligned_alloc(64, size*sizeof(double));

  for(int k=0; k<size_M; ++k){
    for(int j=0; j<size_N; ++j){
      for(int i=0; i<size_P; ++i){
        a[k*size_N*size_P + j*size_P + i] = 0.000000123123123123;
      }
    }
  }

  double wcs, wce, ct, runtime;
  int repeat = 1;
  for(runtime=0.0; runtime < .2; repeat *= 2) {
    timing(&wcs, &ct);
    for(int i=0; i<repeat; ++i) {
      if(a[0] > 0) dummy(a);

      for(long k=1; k < size_M-1; ++k){
        for(long j=1; j < size_N-1; ++j){
          #pragma omp simd // enabled O3-like optimizations with O1
          #pragma vector aligned
          for(long i=1; i < size_P-1; ++i){
              long idx = k*size_N*size_P + j*size_P + i;
            b[idx] = c0 * a[idx]
                + c1 * (
                    (a[idx - 1] + a[idx + 1])
                    + (a[idx - size_N*size_P] + a[idx + size_N*size_P]) 
                    + (a[idx - size_P] + a[idx + size_P])
                );
          }
        }
      }
    } 
    timing(&wce, &ct);
    runtime = wce-wcs;
  }
  repeat /= 2;
  char hostname[1024];
  gethostname(hostname, 1024);
  long freq;
  int rc = getFreq(hostname, &freq);
  long size_b = 6 * (size_P);
  size = (size_P-2) * (size_M-2) * (size_N-2);
  printf("%12.1f | %11.8f | %9.3f | %7.2f | %7.1f | %7.1f | %6d | %4ld \n", (double)size_b*sizeof(double)/1000.0, runtime, 8.0*(double)size*(double)repeat*1e-6/runtime, runtime*(double)freq/((double)(size*repeat)/8.0),32.0*(double)repeat*(double)size/runtime/1024.0/1024.0, (double)repeat*(double)size/runtime/1000.0/1000.0, repeat, size);
  
  free(a); free(b);
}


int main(int argc, char *argv[]) 
{ 
  char hostname[1024];
  gethostname(hostname, 1024);
  long freq;
  getFreq(hostname, &freq);
  printf("3D7PT b[k][j][i] = c0 * a[k][j][i] + c1 * (...), 32 byte/it, 8 Flop/it\n");
  printf("Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n", hostname, (double)freq/1000000000);
  printf("Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size\n");
  for(int i=610; i>300; i-=32) {
      int size = (int)pow(1.3, i);
      size = (size/16)*16;
    stencil(3, 3, i, 0.6, 0.0833);
  }
  return 0;
}
