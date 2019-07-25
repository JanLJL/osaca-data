#!/bin/sh

CC=gcc
ARMFLAGS="-mcpu=thunderx2t99 -fopenmp-simd" #-funroll-loops"
X86FLAGS=" -fopenmp-simd -fargument-noalias -funroll-loops"

# Compile timing.c
$CC -O3 -march=cascadelake -c timing.c
#$CC -O3 -mcpu=thunderx2t99 -c timing.c

# Compile for CSL
#$CC $X86FLAGS -march=cascadelake -O1 -c triad.c
#$CC $X86FLAGS -march=cascadelake -O1 -S triad.c -o triad.s.skl.O1.s
#$CC triad.o timing.o -lm -o a.triad.skl.O1
#$CC $X86FLAGS -march=cascadelake -O2 -c triad.c
#$CC $X86FLAGS -march=cascadelake -O2 -S triad.c -o triad.s.skl.O2.s
#$CC triad.o timing.o -lm -o a.triad.skl.O2
$CC $X86FLAGS -march=cascadelake -O3 -c triad.c
$CC $X86FLAGS -march=cascadelake -O3 -S triad.c -o triad.s.csl.O3.s
$CC triad.o timing.o -lm -o a.triad.csl.O3

# Compile for SKL
#$CC $X86FLAGS -march=skylake-avx512 -O1 -c triad.c
#$CC $X86FLAGS -march=skylake-avx512 -O1 -S triad.c -o triad.s.skl.O1.s
#$CC triad.o timing.o -lm -o a.triad.skl.O1
#$CC $X86FLAGS -march=skylake-avx512 -O2 -c triad.c
#$CC $X86FLAGS -march=skylake-avx512 -O2 -S triad.c -o triad.s.skl.O2.s
#$CC triad.o timing.o -lm -o a.triad.skl.O2
#$CC $X86FLAGS -march=skylake-avx512 -O3 -c triad.c
#$CC $X86FLAGS -march=skylake-avx512 -O3 -S triad.c -o triad.s.skl.O3.s
#$CC triad.o timing.o -lm -o a.triad.skl.O3

# Compile for ARM
#$CC -fopenmp-simd -march=armv8.1-a -O1 -c triad.c
#$CC -fopenmp-simd -march=armv8.1-a -O1 -S triad.c -o triad.s.arm.O1.s
#$CC triad.o timing.o -lm -o a.triad.arm.O1
#$CC -fopenmp-simd -march=armv8.1-a -O2 -c triad.c
#$CC -fopenmp-simd -march=armv8.1-a -O2 -S triad.c -o triad.s.arm.O2.s
#$CC triad.o timing.o -lm -o a.triad.arm.O2
#$CC $ARMFLAGS -O3 -c triad.c
#$CC $ARMFLAGS -O3 -S triad.c -o triad.s.arm.O3.s
#$CC triad.o timing.o -lm -o a.triad.arm.O3
#$CC $ARMFLAGS -Ofast -c triad.c
#$CC $ARMFLAGS -Ofast -S triad.c -o triad.s.arm.Ofast.s
#$CC triad.o timing.o -lm -o a.triad.arm.Ofast


# Compile for Zen
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -c triad.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -S triad.c -o triad.s.zen.O1.s
#$CC triad.o timing.o -lm -o a.triad.zen.O1
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -c triad.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -S triad.c -o triad.s.zen.O2.s
#$CC triad.o timing.o -lm -o a.triad.zen.O2
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -c triad.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -S triad.c -o triad.s.zen.O3.s
#$CC triad.o timing.o -lm -o a.triad.zen.O3
