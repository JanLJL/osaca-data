#!/bin/sh

CC=gcc
ARMFLAGS="-mcpu=thunderx2t99 -fopenmp-simd -funroll-loops"
X86FLAGS=" -fopenmp-simd -fargument-noalias -funroll-loops"

# Compile timing.c
#$CC -O3 -march=cascadelake -c timing.c
$CC -O3 -mcpu=thunderx2t99 -c timing.c

# Compile for CSL
#$CC $X86FLAGS -march=cascadelake -O1 -c add.c
#$CC $X86FLAGS -march=cascadelake -O1 -S add.c -o add.s.skl.O1.s
#$CC add.o timing.o -lm -o a.add.skl.O1
#$CC $X86FLAGS -march=cascadelake -O2 -c add.c
#$CC $X86FLAGS -march=cascadelake -O2 -S add.c -o add.s.skl.O2.s
#$CC add.o timing.o -lm -o a.add.skl.O2
#$CC $X86FLAGS -march=cascadelake -O3 -c add.c
#$CC $X86FLAGS -march=cascadelake -O3 -S add.c -o add.s.csl.O3.s
#$CC add.o timing.o -lm -o a.add.csl.O3

# Compile for SKL
#$CC $X86FLAGS -march=skylake-avx512 -O1 -c add.c
#$CC $X86FLAGS -march=skylake-avx512 -O1 -S add.c -o add.s.skl.O1.s
#$CC add.o timing.o -lm -o a.add.skl.O1
#$CC $X86FLAGS -march=skylake-avx512 -O2 -c add.c
#$CC $X86FLAGS -march=skylake-avx512 -O2 -S add.c -o add.s.skl.O2.s
#$CC add.o timing.o -lm -o a.add.skl.O2
#$CC $X86FLAGS -march=skylake-avx512 -O3 -c add.c
#$CC $X86FLAGS -march=skylake-avx512 -O3 -S add.c -o add.s.skl.O3.s
#$CC add.o timing.o -lm -o a.add.skl.O3

# Compile for ARM
#$CC -fopenmp-simd -march=armv8.1-a -O1 -c add.c
#$CC -fopenmp-simd -march=armv8.1-a -O1 -S add.c -o add.s.arm.O1.s
#$CC add.o timing.o -lm -o a.add.arm.O1
#$CC -fopenmp-simd -march=armv8.1-a -O2 -c add.c
#$CC -fopenmp-simd -march=armv8.1-a -O2 -S add.c -o add.s.arm.O2.s
#$CC add.o timing.o -lm -o a.add.arm.O2
$CC $ARMFLAGS -O3 -c add.c
$CC $ARMFLAGS -O3 -S add.c -o add.s.arm.O3.s
$CC add.o timing.o -lm -o a.add.arm.O3
#$CC $ARMFLAGS -Ofast -c add.c
#$CC $ARMFLAGS -Ofast -S add.c -o add.s.arm.Ofast.s
#$CC add.o timing.o -lm -o a.add.arm.Ofast


# Compile for Zen
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -c add.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -S add.c -o add.s.zen.O1.s
#$CC add.o timing.o -lm -o a.add.zen.O1
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -c add.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -S add.c -o add.s.zen.O2.s
#$CC add.o timing.o -lm -o a.add.zen.O2
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -c add.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -S add.c -o add.s.zen.O3.s
#$CC add.o timing.o -lm -o a.add.zen.O3
