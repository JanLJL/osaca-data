#!/bin/sh

CC=gfortran
ARMFLAGS="-mcpu=thunderx2t99+simd+fp -fopenmp-simd -funroll-loops"
#X86FLAGS=" -fopenmp-simd -fargument-noalias -funroll-loops"
X86FLAGS="-funroll-loops "

# Compile timing.c
armclang -c timing.c

## Compile for CSX
#$CC $X86FLAGS -xCASCADELAKE -Ofast -c gs_xxx.f90
#$CC $X86FLAGS -xCASCADELAKE -Ofast -S gs_xxx.f90 -o gs.s.csx.Ofast.s
#$CC gs_xxx.o timing.o -lm -o a.gs.csx.Ofast

# Compile for SKX
#$CC $X86FLAGS -march=skylake-avx512 -Ofast -c gauss.c
#$CC $X86FLAGS -march=skylake-avx512 -Ofast -S gauss.c -o gauss.s.skl.Ofast.s
#$CC gauss.o timing.o -lm -o a.gauss.skl.Ofast

# Compile for ARM
$CC $ARMFLAGS -Ofast -c gs_xxx.f90
$CC $ARMFLAGS -Ofast -S gs_xxx.f90 -o gs.s.arm.Ofast.s
$CC gs_xxx.o timing.o -lm -o a.gs.arm.Ofast


# Compile for Zen
#$CC $X86FLAGS -mavx2 -mfma -Ofast -c gs_xxx.f90
#$CC $X86FLAGS -mavx2 -mfma -Ofast -S gs_xxx.f90 -o gs.s.zen1.Ofast.s
#$CC gs_xxx.o timing.o -lm -o a.gs.zen1.Ofast
