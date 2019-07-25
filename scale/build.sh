#!/bin/sh

CC=gcc
ARMFLAGS="-mcpu=thunderx2t99 -fopenmp-simd -funroll-loops" 
X86FLAGS=" -fopenmp-simd -fargument-noalias" #-funroll-loops"

# Compile timing.c
#$CC -O3 -march=cascadelake -c timing.c
$CC -O3 -mcpu=thunderx2t99 -c timing.c

# Compile for CSL
#$CC $X86FLAGS -march=cascadelake -O1 -c scale.c
#$CC $X86FLAGS -march=cascadelake -O1 -S scale.c -o scale.s.skl.O1.s
#$CC scale.o timing.o -lm -o a.scale.skl.O1
#$CC $X86FLAGS -march=cascadelake -O2 -c scale.c
#$CC $X86FLAGS -march=cascadelake -O2 -S scale.c -o scale.s.skl.O2.s
#$CC scale.o timing.o -lm -o a.scale.skl.O2
#$CC $X86FLAGS -march=cascadelake -O3 -c scale.c
#$CC $X86FLAGS -march=cascadelake -O3 -S scale.c -o scale.s.csl.O3.s
#$CC scale.o timing.o -lm -o a.scale.csl.O3

# Compile for SKL
#$CC $X86FLAGS -march=skylake-avx512 -O1 -c scale.c
#$CC $X86FLAGS -march=skylake-avx512 -O1 -S scale.c -o scale.s.skl.O1.s
#$CC scale.o timing.o -lm -o a.scale.skl.O1
#$CC $X86FLAGS -march=skylake-avx512 -O2 -c scale.c
#$CC $X86FLAGS -march=skylake-avx512 -O2 -S scale.c -o scale.s.skl.O2.s
#$CC scale.o timing.o -lm -o a.scale.skl.O2
#$CC $X86FLAGS -march=skylake-avx512 -O3 -c scale.c
#$CC $X86FLAGS -march=skylake-avx512 -O3 -S scale.c -o scale.s.skl.O3.s
#$CC scale.o timing.o -lm -o a.scale.skl.O3

# Compile for ARM
#$CC -fopenmp-simd -march=armv8.1-a -O1 -c scale.c
#$CC -fopenmp-simd -march=armv8.1-a -O1 -S scale.c -o scale.s.arm.O1.s
#$CC scale.o timing.o -lm -o a.scale.arm.O1
#$CC -fopenmp-simd -march=armv8.1-a -O2 -c scale.c
#$CC -fopenmp-simd -march=armv8.1-a -O2 -S scale.c -o scale.s.arm.O2.s
#$CC scale.o timing.o -lm -o a.scale.arm.O2
$CC $ARMFLAGS -O3 -c scale.c
$CC $ARMFLAGS -O3 -S scale.c -o scale.s.arm.O3.s
$CC scale.o timing.o -lm -o a.scale.arm.O3
#$CC $ARMFLAGS -Ofast -c scale.c
#$CC $ARMFLAGS -Ofast -S scale.c -o scale.s.arm.Ofast.s
#$CC scale.o timing.o -lm -o a.scale.arm.Ofast


# Compile for Zen
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -c scale.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O1 -S scale.c -o scale.s.zen.O1.s
#$CC scale.o timing.o -lm -o a.scale.zen.O1
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -c scale.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O2 -S scale.c -o scale.s.zen.O2.s
#$CC scale.o timing.o -lm -o a.scale.zen.O2
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -c scale.c
#$CC -fopenmp-simd -march=znver1 -mavx2 -mfma -O3 -S scale.c -o scale.s.zen.O3.s
#$CC scale.o timing.o -lm -o a.scale.zen.O3
