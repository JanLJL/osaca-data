#!/bin/sh

CC=gcc
ARMFLAGS="-mcpu=thunderx2t99 -fopenmp-simd -funroll-loops"
X86FLAGS=" -fopenmp-simd -fargument-noalias -funroll-loops"

# Compile timing.c
#$CC -O3 -march=cascadelake -c timing.c
$CC -O3 -mcpu=thunderx2t99 -c timing.c

# Compile for CSL
#$CC $X86FLAGS -march=cascadelake -O1 -c 2d5pt.c
#$CC $X86FLAGS -march=cascadelake -O1 -S 2d5pt.c -o 2d5pt.s.skl.O1.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.skl.O1
#$CC $X86FLAGS -march=cascadelake -O2 -c 2d5pt.c
#$CC $X86FLAGS -march=cascadelake -O2 -S 2d5pt.c -o 2d5pt.s.skl.O2.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.skl.O2
#$CC $X86FLAGS -march=cascadelake -O3 -c 2d5pt.c
#$CC $X86FLAGS -march=cascadelake -O3 -S 2d5pt.c -o 2d5pt.s.csl.O3.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.csl.O3

# Compile for SKL
#$CC $X86FLAGS -march=skylake-avx512 -O1 -c 2d5pt.c
#$CC $X86FLAGS -march=skylake-avx512 -O1 -S 2d5pt.c -o 2d5pt.s.skl.O1.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.skl.O1
#$CC $X86FLAGS -march=skylake-avx512 -O2 -c 2d5pt.c
#$CC $X86FLAGS -march=skylake-avx512 -O2 -S 2d5pt.c -o 2d5pt.s.skl.O2.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.skl.O2
#$CC $X86FLAGS -march=skylake-avx512 -O3 -c 2d5pt.c
#$CC $X86FLAGS -march=skylake-avx512 -O3 -S 2d5pt.c -o 2d5pt.s.skl.O3.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.skl.O3

# Compile for ARM
#$CC -fopenmp-simd -march=armv8.1-a -O1 -c 2d5pt.c
#$CC -fopenmp-simd -march=armv8.1-a -O1 -S 2d5pt.c -o 2d5pt.s.arm.O1.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.arm.O1
#$CC -fopenmp-simd -march=armv8.1-a -O2 -c 2d5pt.c
#$CC -fopenmp-simd -march=armv8.1-a -O2 -S 2d5pt.c -o 2d5pt.s.arm.O2.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.arm.O2
$CC $ARMFLAGS -O3 -c 2d5pt.c
$CC $ARMFLAGS -O3 -S 2d5pt.c -o 2d5pt.s.arm.O3.s
$CC 2d5pt.o timing.o -lm -o a.2d5pt.arm.O3
#$CC $ARMFLAGS -Ofast -c 2d5pt.c
#$CC $ARMFLAGS -Ofast -S 2d5pt.c -o 2d5pt.s.arm.Ofast.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.arm.Ofast


# Compile for Zen
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -c 2d5pt.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -S 2d5pt.c -o 2d5pt.s.zen.O1.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.zen.O1
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -c 2d5pt.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -S 2d5pt.c -o 2d5pt.s.zen.O2.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.zen.O2
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -c 2d5pt.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -S 2d5pt.c -o 2d5pt.s.zen.O3.s
#$CC 2d5pt.o timing.o -lm -o a.2d5pt.zen.O3
