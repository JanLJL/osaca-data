#!/bin/sh

CC=gcc
ARMFLAGS="-mcpu=thunderx2t99 -fopenmp-simd -fno-builtin -funroll-loops" 
X86FLAGS=" -fopenmp-simd -fargument-noalias -funroll-loops"

# Compile timing.c
$CC -O3 -march=cascadelake -c timing.c
#$CC -O3 -mcpu=thunderx2t99 -c timing.c

# Compile for CSL
#$CC $X86FLAGS -march=cascadelake -O1 -c copy.c
#$CC $X86FLAGS -march=cascadelake -O1 -S copy.c -o copy.s.skl.O1.s
#$CC copy.o timing.o -lm -o a.copy.skl.O1
#$CC $X86FLAGS -march=cascadelake -O2 -c copy.c
#$CC $X86FLAGS -march=cascadelake -O2 -S copy.c -o copy.s.skl.O2.s
#$CC copy.o timing.o -lm -o a.copy.skl.O2
$CC $X86FLAGS -march=cascadelake -O3 -c copy.c
$CC $X86FLAGS -march=cascadelake -O3 -S copy.c -o copy.s.csl.O3.s
$CC copy.o timing.o -lm -o a.copy.csl.O3

# Compile for SKL
#$CC $X86FLAGS -march=skylake-avx512 -O1 -c copy.c
#$CC $X86FLAGS -march=skylake-avx512 -O1 -S copy.c -o copy.s.skl.O1.s
#$CC copy.o timing.o -lm -o a.copy.skl.O1
#$CC $X86FLAGS -march=skylake-avx512 -O2 -c copy.c
#$CC $X86FLAGS -march=skylake-avx512 -O2 -S copy.c -o copy.s.skl.O2.s
#$CC copy.o timing.o -lm -o a.copy.skl.O2
#$CC $X86FLAGS -march=skylake-avx512 -O3 -c copy.c
#$CC $X86FLAGS -march=skylake-avx512 -O3 -S copy.c -o copy.s.skl.O3.s
#$CC copy.o timing.o -lm -o a.copy.skl.O3

# Compile for ARM
#$CC -fopenmp-simd -march=armv8.1-a -O1 -c copy.c
#$CC -fopenmp-simd -march=armv8.1-a -O1 -S copy.c -o copy.s.arm.O1.s
#$CC copy.o timing.o -lm -o a.copy.arm.O1
#$CC -fopenmp-simd -march=armv8.1-a -O2 -c copy.c
#$CC -fopenmp-simd -march=armv8.1-a -O2 -S copy.c -o copy.s.arm.O2.s
#$CC copy.o timing.o -lm -o a.copy.arm.O2
#$CC $ARMFLAGS -O3 -c copy.c
#$CC $ARMFLAGS -O3 -S copy.c -o copy.s.arm.O3.s
#$CC copy.o timing.o -lm -o a.copy.arm.O3
#$CC $ARMFLAGS -Ofast -c copy.c
#$CC $ARMFLAGS -Ofast -S copy.c -o copy.s.arm.Ofast.s
#$CC copy.o timing.o -lm -o a.copy.arm.Ofast


# Compile for Zen
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -c copy.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -S copy.c -o copy.s.zen.O1.s
#$CC copy.o timing.o -lm -o a.copy.zen.O1
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -c copy.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -S copy.c -o copy.s.zen.O2.s
#$CC copy.o timing.o -lm -o a.copy.zen.O2
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -c copy.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -S copy.c -o copy.s.zen.O3.s
#$CC copy.o timing.o -lm -o a.copy.zen.O3
