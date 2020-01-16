# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.5.239 Build 20170817";
# mark_description "-qopenmp-simd -fno-alias -unroll -qopt-zmm-usage=high -xCORE-AVX512 -Ofast -S -use-msasm -o sum_reduction.s.";
# mark_description "csx.s";
	.file "sum_reduction.c"
	.text
..TXTST0:
# -- Begin  main
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main(int, char **)
main:
# parameter 1: %edi
# parameter 2: %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_main.1:
..L2:
                                                          #66.1
        pushq     %rbp                                          #66.1
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #66.1
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-128, %rsp                                   #66.1
        pushq     %r12                                          #66.1
        pushq     %r13                                          #66.1
        pushq     %r14                                          #66.1
        pushq     %r15                                          #66.1
        pushq     %rbx                                          #66.1
        subq      $2136, %rsp                                   #66.1
        movq      $0x64199d9ffe, %rsi                           #66.1
        movl      $3, %edi                                      #66.1
        call      __intel_new_feature_proc_init                 #66.1
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE r12 r13 r14 r15
..B1.61:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
        vstmxcsr  1024(%rsp)                                    #66.1
        movl      $1024, %esi                                   #68.3
        lea       (%rsp), %rdi                                  #68.3
        orl       $32832, 1024(%rdi)                            #66.1
        vldmxcsr  1024(%rdi)                                    #66.1
..___tag_value_main.11:
#       gethostname(char *, size_t)
        call      gethostname                                   #68.3
..___tag_value_main.12:
                                # LOE r12 r13 r14 r15
..B1.2:                         # Preds ..B1.61
                                # Execution count [1.00e+00]
        movl      $.L_2__STRING.0, %esi                         #70.3
        lea       (%rsp), %rdi                                  #70.3
..L13:                                                          #70.3
        movb      (%rdi), %dl                                   #70.3
        cmpb      (%rsi), %dl                                   #70.3
        jne       ..L15         # Prob 50%                      #70.3
        testb     %dl, %dl                                      #70.3
        je        ..L14         # Prob 50%                      #70.3
        movb      1(%rdi), %dl                                  #70.3
        cmpb      1(%rsi), %dl                                  #70.3
        jne       ..L15         # Prob 50%                      #70.3
        addq      $2, %rdi                                      #70.3
        addq      $2, %rsi                                      #70.3
        testb     %dl, %dl                                      #70.3
        jne       ..L13         # Prob 50%                      #70.3
..L14:                                                          #
        xorl      %eax, %eax                                    #70.3
        jmp       ..L16         # Prob 100%                     #70.3
..L15:                                                          #
        sbbl      %eax, %eax                                    #70.3
        orl       $1, %eax                                      #70.3
..L16:                                                          #
                                # LOE r12 r13 r14 r15 eax
..B1.62:                        # Preds ..B1.2
                                # Execution count [1.00e+00]
        testl     %eax, %eax                                    #70.3
        je        ..B1.6        # Prob 28%                      #70.3
                                # LOE r12 r13 r14 r15
..B1.3:                         # Preds ..B1.62
                                # Execution count [7.20e-01]
        movl      $.L_2__STRING.1, %esi                         #70.3
        lea       (%rsp), %rdi                                  #70.3
..L17:                                                          #70.3
        movb      (%rdi), %dl                                   #70.3
        cmpb      (%rsi), %dl                                   #70.3
        jne       ..L19         # Prob 50%                      #70.3
        testb     %dl, %dl                                      #70.3
        je        ..L18         # Prob 50%                      #70.3
        movb      1(%rdi), %dl                                  #70.3
        cmpb      1(%rsi), %dl                                  #70.3
        jne       ..L19         # Prob 50%                      #70.3
        addq      $2, %rdi                                      #70.3
        addq      $2, %rsi                                      #70.3
        testb     %dl, %dl                                      #70.3
        jne       ..L17         # Prob 50%                      #70.3
..L18:                                                          #
        xorl      %eax, %eax                                    #70.3
        jmp       ..L20         # Prob 100%                     #70.3
..L19:                                                          #
        sbbl      %eax, %eax                                    #70.3
        orl       $1, %eax                                      #70.3
..L20:                                                          #
                                # LOE r12 r13 r14 r15 eax
..B1.63:                        # Preds ..B1.3
                                # Execution count [7.20e-01]
        testl     %eax, %eax                                    #70.3
        je        ..B1.6        # Prob 28%                      #70.3
                                # LOE r12 r13 r14 r15
..B1.4:                         # Preds ..B1.63
                                # Execution count [5.18e-01]
        movl      $.L_2__STRING.2, %esi                         #70.3
        lea       (%rsp), %rdi                                  #70.3
..L21:                                                          #70.3
        movb      (%rdi), %dl                                   #70.3
        cmpb      (%rsi), %dl                                   #70.3
        jne       ..L23         # Prob 50%                      #70.3
        testb     %dl, %dl                                      #70.3
        je        ..L22         # Prob 50%                      #70.3
        movb      1(%rdi), %dl                                  #70.3
        cmpb      1(%rsi), %dl                                  #70.3
        jne       ..L23         # Prob 50%                      #70.3
        addq      $2, %rdi                                      #70.3
        addq      $2, %rsi                                      #70.3
        testb     %dl, %dl                                      #70.3
        jne       ..L21         # Prob 50%                      #70.3
..L22:                                                          #
        xorl      %eax, %eax                                    #70.3
        jmp       ..L24         # Prob 100%                     #70.3
..L23:                                                          #
        sbbl      %eax, %eax                                    #70.3
        orl       $1, %eax                                      #70.3
..L24:                                                          #
                                # LOE r12 r13 r14 r15 eax
..B1.64:                        # Preds ..B1.4
                                # Execution count [5.18e-01]
        testl     %eax, %eax                                    #70.3
        movq      $0x089173700, %rdx                            #70.3
        cmove     %rdx, %rbx                                    #70.3
        jmp       ..B1.7        # Prob 100%                     #70.3
                                # LOE rbx r12 r13 r14 r15
..B1.6:                         # Preds ..B1.63 ..B1.62
                                # Execution count [2.80e-01]
        movq      $0x083215600, %rbx                            #70.3
                                # LOE rbx r12 r13 r14 r15
..B1.7:                         # Preds ..B1.6 ..B1.64
                                # Execution count [1.00e+00]
        movl      $il0_peep_printf_format_0, %edi               #71.3
        call      puts                                          #71.3
                                # LOE rbx r12 r13 r14 r15
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.00e+00]
        vxorpd    %xmm0, %xmm0, %xmm0                           #72.3
        lea       (%rsp), %rsi                                  #72.3
        vcvtsi2sdq %rbx, %xmm0, %xmm0                           #72.3
        movl      $.L_2__STRING.5, %edi                         #72.3
        movl      $1, %eax                                      #72.3
        vmulsd    .L_2il0floatpacket.0(%rip), %xmm0, %xmm0      #72.3
..___tag_value_main.25:
#       printf(const char *__restrict__, ...)
        call      printf                                        #72.3
..___tag_value_main.26:
                                # LOE r12 r13 r14 r15
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.00e+00]
        movl      $il0_peep_printf_format_1, %edi               #73.3
        call      puts                                          #73.3
                                # LOE r12 r13 r14 r15
..B1.10:                        # Preds ..B1.9
                                # Execution count [1.00e+00]
        movl      $8, %eax                                      #77.5
        xorb      %dl, %dl                                      #74.3
        vpbroadcastd %eax, %ymm1                                #77.5
        movl      $20, %ebx                                     #74.3
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm10            #77.5
        vxorpd    %xmm11, %xmm11, %xmm11                        #77.5
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm9             #77.5
        vmovsd    .L_2il0floatpacket.4(%rip), %xmm8             #77.5
        vmovsd    .L_2il0floatpacket.11(%rip), %xmm7            #77.5
        vmovsd    .L_2il0floatpacket.5(%rip), %xmm6             #77.5
        vmovsd    .L_2il0floatpacket.6(%rip), %xmm5             #77.5
        vmovsd    .L_2il0floatpacket.7(%rip), %xmm4             #77.5
        vmovups   .L_2il0floatpacket.8(%rip), %zmm3             #77.17
        vmovups   .L_2il0floatpacket.9(%rip), %zmm2             #77.5
        vmovdqu   .L_2il0floatpacket.10(%rip), %ymm0            #77.5
        vmovdqu   %ymm1, 2048(%rsp)                             #74.3[spill]
        movb      %dl, 2080(%rsp)                               #74.3[spill]
                                # LOE ebx
..B1.11:                        # Preds ..B1.56 ..B1.10
                                # Execution count [1.60e+01]
        vxorpd    %xmm1, %xmm1, %xmm1                           #75.21
        vcvtsi2sd %ebx, %xmm1, %xmm1                            #75.21
        vzeroupper                                              #75.21
        vmovsd    .L_2il0floatpacket.1(%rip), %xmm0             #75.21
        call      pow                                           #75.21
                                # LOE ebx xmm0
..B1.66:                        # Preds ..B1.11
                                # Execution count [1.60e+01]
        vcvttsd2si %xmm0, %eax                                  #75.21
        movl      %eax, %r14d                                   #76.18
        movl      $64, %edi                                     #77.5
        sarl      $5, %r14d                                     #76.18
        shrl      $26, %r14d                                    #76.18
        addl      %eax, %r14d                                   #76.18
        sarl      $6, %r14d                                     #76.18
        movslq    %r14d, %r15                                   #77.11
        shll      $6, %r14d                                     #76.22
        movslq    %r14d, %r12                                   #77.5
        shlq      $3, %r12                                      #77.5
        movq      %r12, %rsi                                    #77.5
        shlq      $6, %r15                                      #76.22
..___tag_value_main.27:
#       aligned_alloc(size_t, size_t)
        call      aligned_alloc                                 #77.5
..___tag_value_main.28:
                                # LOE rax r12 r15 ebx r14d
..B1.65:                        # Preds ..B1.66
                                # Execution count [1.60e+01]
        movq      %rax, %r13                                    #77.5
                                # LOE r12 r13 r15 ebx r14d
..B1.12:                        # Preds ..B1.65
                                # Execution count [1.60e+01]
        movl      $64, %edi                                     #77.5
        movq      %r12, %rsi                                    #77.5
..___tag_value_main.29:
#       aligned_alloc(size_t, size_t)
        call      aligned_alloc                                 #77.5
..___tag_value_main.30:
                                # LOE rax r13 r15 ebx r14d
..B1.67:                        # Preds ..B1.12
                                # Execution count [1.60e+01]
        movq      %rax, 2096(%rsp)                              #77.5[spill]
                                # LOE r13 r15 ebx r14d
..B1.13:                        # Preds ..B1.67
                                # Execution count [1.60e+01]
        testq     %r15, %r15                                    #77.5
        jle       ..B1.31       # Prob 50%                      #77.5
                                # LOE r13 r15 ebx r14d
..B1.14:                        # Preds ..B1.13
                                # Execution count [1.44e+01]
        cmpq      $16, %r15                                     #77.5
        jl        ..B1.58       # Prob 10%                      #77.5
                                # LOE r13 r15 ebx r14d
..B1.15:                        # Preds ..B1.14
                                # Execution count [1.44e+01]
        movq      %r13, %r8                                     #77.5
        andq      $63, %r8                                      #77.5
        testq     $7, %r8                                       #77.5
        je        ..B1.17       # Prob 50%                      #77.5
                                # LOE r8 r13 r15 ebx r14d
..B1.16:                        # Preds ..B1.15
                                # Execution count [7.20e+00]
        xorl      %r8d, %r8d                                    #77.5
        jmp       ..B1.19       # Prob 100%                     #77.5
                                # LOE r8 r13 r15 ebx r14d
..B1.17:                        # Preds ..B1.15
                                # Execution count [7.20e+00]
        testq     %r8, %r8                                      #77.5
        je        ..B1.19       # Prob 50%                      #77.5
                                # LOE r8 r13 r15 ebx r14d
..B1.18:                        # Preds ..B1.17
                                # Execution count [0.00e+00]
        negq      %r8                                           #77.5
        addq      $64, %r8                                      #77.5
        shrq      $3, %r8                                       #77.5
        cmpq      %r8, %r15                                     #77.5
        cmovl     %r15, %r8                                     #77.5
                                # LOE r8 r13 r15 ebx r14d
..B1.19:                        # Preds ..B1.16 ..B1.18 ..B1.17
                                # Execution count [1.60e+01]
        movq      %r15, %rax                                    #77.5
        subq      %r8, %rax                                     #77.5
        andq      $15, %rax                                     #77.5
        negq      %rax                                          #77.5
        addq      %r15, %rax                                    #77.5
        cmpq      $1, %r8                                       #77.5
        jb        ..B1.23       # Prob 50%                      #77.5
                                # LOE rax r8 r13 r15 ebx r14d
..B1.20:                        # Preds ..B1.19
                                # Execution count [1.44e+01]
        vmovdqu   .L_2il0floatpacket.10(%rip), %ymm1            #77.5
        xorl      %esi, %esi                                    #77.5
        vmovdqu   2048(%rsp), %ymm3                             #77.5[spill]
        vmovups   .L_2il0floatpacket.9(%rip), %zmm4             #77.5
        vpbroadcastq %r8, %zmm0                                 #77.5
        xorl      %ecx, %ecx                                    #77.5
                                # LOE rax rcx r8 r13 r15 ebx esi r14d ymm1 ymm3 zmm0 zmm4
..B1.21:                        # Preds ..B1.21 ..B1.20
                                # Execution count [8.00e+01]
        vpmovsxdq %ymm1, %zmm2                                  #77.5
        addl      $8, %esi                                      #77.5
        vpaddd    %ymm3, %ymm1, %ymm1                           #77.5
        vpcmpgtq  %zmm2, %zmm0, %k1                             #77.5
        #vmovupd   %zmm4, (%rcx,%r13){%k1}                       #77.5
        addq      $64, %rcx                                     #77.5
        cmpq      %r8, %rsi                                     #77.5
        jb        ..B1.21       # Prob 82%                      #77.5
                                # LOE rax rcx r8 r13 r15 ebx esi r14d ymm1 ymm3 zmm0 zmm4
..B1.22:                        # Preds ..B1.21
                                # Execution count [1.44e+01]
        cmpq      %r8, %r15                                     #77.5
        je        ..B1.31       # Prob 10%                      #77.5
                                # LOE rax r8 r13 r15 ebx r14d
..B1.23:                        # Preds ..B1.19 ..B1.22
                                # Execution count [0.00e+00]
        lea       16(%r8), %rcx                                 #77.5
        cmpq      %rcx, %rax                                    #77.5
        jl        ..B1.27       # Prob 50%                      #77.5
                                # LOE rax r8 r13 r15 ebx r14d
..B1.24:                        # Preds ..B1.23
                                # Execution count [1.44e+01]
        vmovups   .L_2il0floatpacket.9(%rip), %zmm0             #77.5
        movl      %r8d, %ecx                                    #77.5
                                # LOE rax r8 r13 r15 ecx ebx r14d zmm0
..B1.25:                        # Preds ..B1.25 ..B1.24
                                # Execution count [8.00e+01]
        addl      $16, %ecx                                     #77.5
        vmovupd   %zmm0, (%r13,%r8,8)                           #77.5
        vmovupd   %zmm0, 64(%r13,%r8,8)                         #77.5
        addq      $16, %r8                                      #77.5
        cmpq      %rax, %rcx                                    #77.5
        jb        ..B1.25       # Prob 82%                      #77.5
                                # LOE rax r8 r13 r15 ecx ebx r14d zmm0
..B1.27:                        # Preds ..B1.25 ..B1.23 ..B1.58
                                # Execution count [1.60e+01]
        lea       1(%rax), %rcx                                 #77.5
        cmpq      %r15, %rcx                                    #77.5
        ja        ..B1.31       # Prob 50%                      #77.5
                                # LOE rax r13 r15 ebx r14d
..B1.28:                        # Preds ..B1.27
                                # Execution count [1.44e+01]
        movslq    %eax, %rcx                                    #77.5
        negq      %rax                                          #77.5
        addq      %r15, %rax                                    #77.5
        xorl      %r8d, %r8d                                    #77.5
        vmovdqu   .L_2il0floatpacket.10(%rip), %ymm1            #77.5
        vmovdqu   2048(%rsp), %ymm3                             #77.5[spill]
        vmovups   .L_2il0floatpacket.9(%rip), %zmm4             #77.5
        vpbroadcastq %rax, %zmm0                                #77.5
        lea       (%r13,%rcx,8), %rsi                           #77.5
        xorl      %ecx, %ecx                                    #77.5
                                # LOE rax rcx rsi r13 r15 ebx r8d r14d ymm1 ymm3 zmm0 zmm4
..B1.29:                        # Preds ..B1.29 ..B1.28
                                # Execution count [8.00e+01]
        vpmovsxdq %ymm1, %zmm2                                  #77.5
        addl      $8, %r8d                                      #77.5
        vpaddd    %ymm3, %ymm1, %ymm1                           #77.5
        vpcmpgtq  %zmm2, %zmm0, %k1                             #77.5
        #vmovupd   %zmm4, (%rcx,%rsi){%k1}                       #77.5
        addq      $64, %rcx                                     #77.5
        cmpq      %rax, %r8                                     #77.5
        jb        ..B1.29       # Prob 82%                      #77.5
                                # LOE rax rcx rsi r13 r15 ebx r8d r14d ymm1 ymm3 zmm0 zmm4
..B1.31:                        # Preds ..B1.29 ..B1.13 ..B1.22 ..B1.27
                                # Execution count [1.60e+01]
        vzeroupper                                              #77.5
        lea       2112(%rsp), %rdi                              #77.5
        movl      $1, %r12d                                     #77.5
        lea       2120(%rsp), %rsi                              #77.5
..___tag_value_main.31:
#       timing(double *, double *)
        call      timing                                        #77.5
..___tag_value_main.32:
                                # LOE r13 r15 ebx r12d r14d
..B1.32:                        # Preds ..B1.31
                                # Execution count [1.44e+01]
        xorl      %eax, %eax                                    #77.5
        movl      %ebx, 2088(%rsp)                              #77.5[spill]
        movl      %eax, %ebx                                    #77.5
        vxorpd    %xmm0, %xmm0, %xmm0                           #77.5
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.33:                        # Preds ..B1.32 ..B1.40 ..B1.46
                                # Execution count [4.44e+02]
        vcomisd   (%r13), %xmm0                                 #77.5
        jbe       ..B1.35       # Prob 78%                      #77.5
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.34:                        # Preds ..B1.33
                                # Execution count [9.78e+01]
        movq      %r13, %rdi                                    #77.5
        vzeroupper                                              #77.5
..___tag_value_main.33:
#       dummy(double *)
        call      dummy                                         #77.5
..___tag_value_main.34:
                                # LOE r13 r15 ebx r12d r14d
..B1.71:                        # Preds ..B1.34
                                # Execution count [9.78e+01]
        vxorpd    %xmm0, %xmm0, %xmm0                           #
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.35:                        # Preds ..B1.33 ..B1.71
                                # Execution count [4.44e+02]
        testq     %r15, %r15                                    #77.5
        jle       ..B1.40       # Prob 50%                      #77.5
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.36:                        # Preds ..B1.35
                                # Execution count [4.00e+02]
        cmpq      $16, %r15                                     #77.5
        jl        ..B1.40       # Prob 10%                      #77.5
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.37:                        # Preds ..B1.36
                                # Execution count [4.00e+02]
        vmovups   .L_2il0floatpacket.8(%rip), %zmm3             #77.5
        xorl      %ecx, %ecx                                    #77.5
                                # LOE rcx r13 r15 ebx r12d r14d xmm0 zmm3
        movl      $111, %ebx # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     100        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     103        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     144        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        # LLVM-MCA-BEGIN
..B1.38:                        # Preds ..B1.38 ..B1.37
                                # Execution count [2.22e+03]
        vaddpd    (%r13,%rcx,8), %zmm3, %zmm1                   #77.5
        vaddpd    64(%r13,%rcx,8), %zmm3, %zmm2                 #77.5
        vmovupd   %zmm1, (%r13,%rcx,8)                          #77.5
        vmovupd   %zmm2, 64(%r13,%rcx,8)                        #77.5
        addq      $16, %rcx                                     #77.5
        cmpq      %r15, %rcx                                    #77.5
        jb        ..B1.38       # Prob 82%                      #77.5
        # LLVM-MCA-END
        movl      $222, %ebx # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     100        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     103        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     144        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
                                # LOE rcx r13 r15 ebx r12d r14d xmm0 zmm3
..B1.40:                        # Preds ..B1.38 ..B1.35 ..B1.36
                                # Execution count [4.44e+02]
        incl      %ebx                                          #77.5
        cmpl      %r12d, %ebx                                   #77.5
        jb        ..B1.33       # Prob 82%                      #77.5
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.42:                        # Preds ..B1.40 ..B1.45
                                # Execution count [8.89e+01]: Infreq
        vzeroupper                                              #77.5
        lea       2128(%rsp), %rdi                              #77.5
        lea       2120(%rsp), %rsi                              #77.5
..___tag_value_main.35:
#       timing(double *, double *)
        call      timing                                        #77.5
..___tag_value_main.36:
                                # LOE r13 r15 r12d r14d
..B1.43:                        # Preds ..B1.42
                                # Execution count [8.89e+01]: Infreq
        vmovsd    2128(%rsp), %xmm1                             #77.5
        addl      %r12d, %r12d                                  #77.5
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #77.5
        vsubsd    2112(%rsp), %xmm1, %xmm1                      #77.5
        vcomisd   %xmm1, %xmm0                                  #77.5
        jbe       ..B1.47       # Prob 18%                      #77.5
                                # LOE r13 r15 r12d r14d xmm1
..B1.44:                        # Preds ..B1.43
                                # Execution count [7.29e+01]: Infreq
        lea       2112(%rsp), %rdi                              #77.5
        lea       2120(%rsp), %rsi                              #77.5
..___tag_value_main.37:
#       timing(double *, double *)
        call      timing                                        #77.5
..___tag_value_main.38:
                                # LOE r13 r15 r12d r14d
..B1.45:                        # Preds ..B1.44
                                # Execution count [7.29e+01]: Infreq
        xorl      %ebx, %ebx                                    #77.5
        testl     %r12d, %r12d                                  #77.5
        jle       ..B1.42       # Prob 10%                      #77.5
                                # LOE r13 r15 ebx r12d r14d
..B1.46:                        # Preds ..B1.45
                                # Execution count [6.56e+01]: Infreq
        .byte     15                                            #
        .byte     31                                            #
        .byte     0                                             #
        .byte     15                                            #
        .byte     31                                            #
        .byte     128                                           #
        .byte     0                                             #
        .byte     0                                             #
        .byte     0                                             #
        .byte     0                                             #
        vxorpd    %xmm0, %xmm0, %xmm0                           #
        jmp       ..B1.33       # Prob 100%                     #
                                # LOE r13 r15 ebx r12d r14d xmm0
..B1.47:                        # Preds ..B1.43
                                # Execution count [1.60e+01]: Infreq
        movl      %r12d, %eax                                   #77.5
        lea       1024(%rsp), %rdi                              #77.5
        shrl      $31, %eax                                     #77.5
        movl      $1024, %esi                                   #77.5
        addl      %eax, %r12d                                   #77.5
        movl      1064(%rdi), %ebx                              #[spill]
        sarl      $1, %r12d                                     #77.5
        vmovsd    %xmm1, 1080(%rdi)                             #77.5[spill]
..___tag_value_main.39:
#       gethostname(char *, size_t)
        call      gethostname                                   #77.5
..___tag_value_main.40:
                                # LOE r13 r15 ebx r12d r14d
..B1.48:                        # Preds ..B1.47
                                # Execution count [1.60e+01]: Infreq
        movl      $.L_2__STRING.0, %esi                         #77.5
        lea       1024(%rsp), %rdi                              #77.5
        vmovsd    1080(%rdi), %xmm1                             #[spill]
..L41:                                                          #77.5
        movb      (%rdi), %dl                                   #77.5
        cmpb      (%rsi), %dl                                   #77.5
        jne       ..L43         # Prob 50%                      #77.5
        testb     %dl, %dl                                      #77.5
        je        ..L42         # Prob 50%                      #77.5
        movb      1(%rdi), %dl                                  #77.5
        cmpb      1(%rsi), %dl                                  #77.5
        jne       ..L43         # Prob 50%                      #77.5
        addq      $2, %rdi                                      #77.5
        addq      $2, %rsi                                      #77.5
        testb     %dl, %dl                                      #77.5
        jne       ..L41         # Prob 50%                      #77.5
..L42:                                                          #
        xorl      %eax, %eax                                    #77.5
        jmp       ..L44         # Prob 100%                     #77.5
..L43:                                                          #
        sbbl      %eax, %eax                                    #77.5
        orl       $1, %eax                                      #77.5
..L44:                                                          #
                                # LOE r13 r15 eax ebx r12d r14d xmm1
..B1.68:                        # Preds ..B1.48
                                # Execution count [1.60e+01]: Infreq
        testl     %eax, %eax                                    #77.5
        je        ..B1.52       # Prob 28%                      #77.5
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.49:                        # Preds ..B1.68
                                # Execution count [1.15e+01]: Infreq
        movl      $.L_2__STRING.1, %esi                         #77.5
        lea       1024(%rsp), %rdi                              #77.5
..L45:                                                          #77.5
        movb      (%rdi), %dl                                   #77.5
        cmpb      (%rsi), %dl                                   #77.5
        jne       ..L47         # Prob 50%                      #77.5
        testb     %dl, %dl                                      #77.5
        je        ..L46         # Prob 50%                      #77.5
        movb      1(%rdi), %dl                                  #77.5
        cmpb      1(%rsi), %dl                                  #77.5
        jne       ..L47         # Prob 50%                      #77.5
        addq      $2, %rdi                                      #77.5
        addq      $2, %rsi                                      #77.5
        testb     %dl, %dl                                      #77.5
        jne       ..L45         # Prob 50%                      #77.5
..L46:                                                          #
        xorl      %eax, %eax                                    #77.5
        jmp       ..L48         # Prob 100%                     #77.5
..L47:                                                          #
        sbbl      %eax, %eax                                    #77.5
        orl       $1, %eax                                      #77.5
..L48:                                                          #
                                # LOE r13 r15 eax ebx r12d r14d xmm1
..B1.69:                        # Preds ..B1.49
                                # Execution count [1.15e+01]: Infreq
        testl     %eax, %eax                                    #77.5
        je        ..B1.52       # Prob 28%                      #77.5
                                # LOE r13 r15 ebx r12d r14d xmm1
..B1.50:                        # Preds ..B1.69
                                # Execution count [8.29e+00]: Infreq
        movl      $.L_2__STRING.2, %esi                         #77.5
        lea       1024(%rsp), %rdi                              #77.5
..L49:                                                          #77.5
        movb      (%rdi), %dl                                   #77.5
        cmpb      (%rsi), %dl                                   #77.5
        jne       ..L51         # Prob 50%                      #77.5
        testb     %dl, %dl                                      #77.5
        je        ..L50         # Prob 50%                      #77.5
        movb      1(%rdi), %dl                                  #77.5
        cmpb      1(%rsi), %dl                                  #77.5
        jne       ..L51         # Prob 50%                      #77.5
        addq      $2, %rdi                                      #77.5
        addq      $2, %rsi                                      #77.5
        testb     %dl, %dl                                      #77.5
        jne       ..L49         # Prob 50%                      #77.5
..L50:                                                          #
        xorl      %eax, %eax                                    #77.5
        jmp       ..L52         # Prob 100%                     #77.5
..L51:                                                          #
        sbbl      %eax, %eax                                    #77.5
        orl       $1, %eax                                      #77.5
..L52:                                                          #
                                # LOE r13 r15 eax ebx r12d r14d xmm1
..B1.70:                        # Preds ..B1.50
                                # Execution count [8.29e+00]: Infreq
        testl     %eax, %eax                                    #77.5
        movq      $0x089173700, %rcx                            #77.5
        cmove     %rcx, %rax                                    #77.5
        jmp       ..B1.53       # Prob 100%                     #77.5
                                # LOE rax r13 r15 ebx r12d r14d xmm1
..B1.52:                        # Preds ..B1.69 ..B1.68
                                # Execution count [4.48e+00]: Infreq
        movq      $0x083215600, %rax                            #77.5
                                # LOE rax r13 r15 ebx r12d r14d xmm1
..B1.53:                        # Preds ..B1.52 ..B1.70
                                # Execution count [1.60e+01]: Infreq
        movslq    %r12d, %rcx                                   #77.5
        vxorpd    %xmm15, %xmm15, %xmm15                        #77.5
        imulq     %r15, %rcx                                    #77.5
        vcvtsi2sdq %rcx, %xmm15, %xmm15                         #77.5
        vmovsd    .L_2il0floatpacket.11(%rip), %xmm5            #77.5
        vxorpd    %xmm10, %xmm10, %xmm10                        #77.5
        vdivsd    %xmm1, %xmm5, %xmm12                          #77.5
        vmulsd    .L_2il0floatpacket.5(%rip), %xmm15, %xmm16    #77.5
        vxorpd    %xmm18, %xmm18, %xmm18                        #77.5
        vcvtsi2sd %r14d, %xmm10, %xmm10                         #77.5
        vcvtsi2sdq %rax, %xmm18, %xmm18                         #77.5
        vdivsd    %xmm16, %xmm1, %xmm17                         #77.5
        vmulsd    .L_2il0floatpacket.4(%rip), %xmm10, %xmm6     #77.5
        vxorpd    %xmm14, %xmm14, %xmm14                        #77.5
        vcvtsi2sd %r12d, %xmm14, %xmm14                         #77.5
        vmulsd    .L_2il0floatpacket.6(%rip), %xmm10, %xmm8     #77.5
        vmulsd    .L_2il0floatpacket.7(%rip), %xmm10, %xmm11    #77.5
        vmulsd    %xmm12, %xmm6, %xmm7                          #77.5
        vmulsd    %xmm12, %xmm8, %xmm9                          #77.5
        vmulsd    %xmm12, %xmm11, %xmm13                        #77.5
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm10, %xmm0     #77.5
        vmulsd    %xmm14, %xmm7, %xmm2                          #77.5
        vmulsd    %xmm14, %xmm9, %xmm4                          #77.5
        vmulsd    %xmm14, %xmm13, %xmm5                         #77.5
        vmulsd    %xmm18, %xmm17, %xmm3                         #77.5
        movl      $.L_2__STRING.3, %edi                         #77.5
        movl      %r12d, %esi                                   #77.5
        movq      %r15, %rdx                                    #77.5
        movl      $6, %eax                                      #77.5
..___tag_value_main.53:
#       printf(const char *__restrict__, ...)
        call      printf                                        #77.5
..___tag_value_main.54:
                                # LOE r13 ebx
..B1.54:                        # Preds ..B1.53
                                # Execution count [1.60e+01]: Infreq
        movq      %r13, %rdi                                    #77.5
#       free(void *)
        call      free                                          #77.5
                                # LOE ebx
..B1.55:                        # Preds ..B1.54
                                # Execution count [1.60e+01]: Infreq
        movq      2096(%rsp), %rdi                              #77.5[spill]
#       free(void *)
        call      free                                          #77.5
                                # LOE ebx
..B1.56:                        # Preds ..B1.55
                                # Execution count [1.60e+01]: Infreq
        movb      2080(%rsp), %al                               #74.3[spill]
        incl      %ebx                                          #74.3
        incb      %al                                           #74.3
        movb      %al, 2080(%rsp)                               #74.3[spill]
        cmpb      $16, %al                                      #74.3
        jb        ..B1.11       # Prob 93%                      #74.3
                                # LOE ebx
..B1.57:                        # Preds ..B1.56
                                # Execution count [1.00e+00]: Infreq
        xorl      %eax, %eax                                    #79.10
        addq      $2136, %rsp                                   #79.10
	.cfi_restore 3
        popq      %rbx                                          #79.10
	.cfi_restore 15
        popq      %r15                                          #79.10
	.cfi_restore 14
        popq      %r14                                          #79.10
	.cfi_restore 13
        popq      %r13                                          #79.10
	.cfi_restore 12
        popq      %r12                                          #79.10
        movq      %rbp, %rsp                                    #79.10
        popq      %rbp                                          #79.10
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #79.10
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B1.58:                        # Preds ..B1.14
                                # Execution count [1.44e+00]: Infreq
        xorl      %eax, %eax                                    #77.5
        jmp       ..B1.27       # Prob 100%                     #77.5
        .align    16,0x90
                                # LOE rax r13 r15 ebx r14d
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
il0_peep_printf_format_0:
	.long	1279345491
	.long	1533157445
	.long	1025531241
	.long	706769696
	.long	1767596320
	.long	824192093
	.long	2036473910
	.long	1764713844
	.long	824192116
	.long	1869366816
	.long	1953050480
	.byte	0
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
il0_peep_printf_format_1:
	.long	1702521171
	.long	1112221728
	.long	694514809
	.long	538999840
	.long	1853190688
	.long	1701669236
	.long	2082480160
	.long	1179459616
	.long	795897708
	.long	2082480243
	.long	2036539424
	.long	541868847
	.long	538999840
	.long	1932477005
	.long	2082480160
	.long	1280122912
	.long	1932480597
	.long	1914731552
	.long	1634037861
	.long	545005684
	.long	1702521203
	.byte	0
	.data
# -- End  main
	.text
# -- Begin  getFreq
	.text
# mark_begin;
       .align    16,0x90
	.globl getFreq
# --- getFreq(char *, long *)
getFreq:
# parameter 1: %rdi
# parameter 2: %rsi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_getFreq.70:
..L71:
                                                         #11.1
        movq      %rsi, %r8                                     #11.1
        movl      $.L_2__STRING.0, %esi                         #12.7
        movq      %rdi, %rcx                                    #11.1
..L72:                                                          #12.7
        movb      (%rdi), %dl                                   #12.7
        cmpb      (%rsi), %dl                                   #12.7
        jne       ..L74         # Prob 50%                      #12.7
        testb     %dl, %dl                                      #12.7
        je        ..L73         # Prob 50%                      #12.7
        movb      1(%rdi), %dl                                  #12.7
        cmpb      1(%rsi), %dl                                  #12.7
        jne       ..L74         # Prob 50%                      #12.7
        addq      $2, %rdi                                      #12.7
        addq      $2, %rsi                                      #12.7
        testb     %dl, %dl                                      #12.7
        jne       ..L72         # Prob 50%                      #12.7
..L73:                                                          #
        xorl      %eax, %eax                                    #12.7
        jmp       ..L75         # Prob 100%                     #12.7
..L74:                                                          #
        sbbl      %eax, %eax                                    #12.7
        orl       $1, %eax                                      #12.7
..L75:                                                          #
                                # LOE rcx rbx rbp r8 r12 r13 r14 r15 eax
..B2.11:                        # Preds ..B2.1
                                # Execution count [1.00e+00]
        testl     %eax, %eax                                    #12.42
        je        ..B2.7        # Prob 28%                      #12.42
                                # LOE rcx rbx rbp r8 r12 r13 r14 r15
..B2.2:                         # Preds ..B2.11
                                # Execution count [7.20e-01]
        movq      %rcx, %rdi                                    #16.7
        movl      $.L_2__STRING.1, %esi                         #16.7
..L76:                                                          #16.7
        movb      (%rdi), %dl                                   #16.7
        cmpb      (%rsi), %dl                                   #16.7
        jne       ..L78         # Prob 50%                      #16.7
        testb     %dl, %dl                                      #16.7
        je        ..L77         # Prob 50%                      #16.7
        movb      1(%rdi), %dl                                  #16.7
        cmpb      1(%rsi), %dl                                  #16.7
        jne       ..L78         # Prob 50%                      #16.7
        addq      $2, %rdi                                      #16.7
        addq      $2, %rsi                                      #16.7
        testb     %dl, %dl                                      #16.7
        jne       ..L76         # Prob 50%                      #16.7
..L77:                                                          #
        xorl      %eax, %eax                                    #16.7
        jmp       ..L79         # Prob 100%                     #16.7
..L78:                                                          #
        sbbl      %eax, %eax                                    #16.7
        orl       $1, %eax                                      #16.7
..L79:                                                          #
                                # LOE rcx rbx rbp r8 r12 r13 r14 r15 eax
..B2.12:                        # Preds ..B2.2
                                # Execution count [7.20e-01]
        testl     %eax, %eax                                    #16.37
        je        ..B2.7        # Prob 28%                      #16.37
                                # LOE rcx rbx rbp r8 r12 r13 r14 r15
..B2.3:                         # Preds ..B2.12
                                # Execution count [5.18e-01]
        movq      %rcx, %rdi                                    #20.7
        movl      $.L_2__STRING.2, %esi                         #20.7
..L80:                                                          #20.7
        movb      (%rdi), %dl                                   #20.7
        cmpb      (%rsi), %dl                                   #20.7
        jne       ..L82         # Prob 50%                      #20.7
        testb     %dl, %dl                                      #20.7
        je        ..L81         # Prob 50%                      #20.7
        movb      1(%rdi), %dl                                  #20.7
        cmpb      1(%rsi), %dl                                  #20.7
        jne       ..L82         # Prob 50%                      #20.7
        addq      $2, %rdi                                      #20.7
        addq      $2, %rsi                                      #20.7
        testb     %dl, %dl                                      #20.7
        jne       ..L80         # Prob 50%                      #20.7
..L81:                                                          #
        xorl      %eax, %eax                                    #20.7
        jmp       ..L83         # Prob 100%                     #20.7
..L82:                                                          #
        sbbl      %eax, %eax                                    #20.7
        orl       $1, %eax                                      #20.7
..L83:                                                          #
                                # LOE rbx rbp r8 r12 r13 r14 r15 eax
..B2.13:                        # Preds ..B2.3
                                # Execution count [5.18e-01]
        testl     %eax, %eax                                    #20.38
        jne       ..B2.5        # Prob 50%                      #20.38
                                # LOE rbx rbp r8 r12 r13 r14 r15
..B2.4:                         # Preds ..B2.13
                                # Execution count [2.59e-01]
        movq      $0x089173700, %rax                            #21.8
        movq      %rax, (%r8)                                   #21.8
        xorl      %eax, %eax                                    #22.14
        ret                                                     #22.14
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B2.5:                         # Preds ..B2.13
                                # Execution count [2.59e-01]
        movl      $-1, %eax                                     #24.10
                                # LOE rbx rbp r12 r13 r14 r15 eax
..B2.6:                         # Preds ..B2.5
                                # Execution count [5.18e-01]
        ret                                                     #22.14
                                # LOE
..B2.7:                         # Preds ..B2.11 ..B2.12
                                # Execution count [2.02e-01]
        movq      $0x083215600, %rax                            #17.8
        movq      %rax, (%r8)                                   #17.8
        xorl      %eax, %eax                                    #18.14
        ret                                                     #18.14
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	getFreq,@function
	.size	getFreq,.-getFreq
	.data
# -- End  getFreq
	.text
# -- Begin  scale
	.text
# mark_begin;
       .align    16,0x90
	.globl scale
# --- scale(long, double)
scale:
# parameter 1: %rdi
# parameter 2: %xmm0
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_scale.85:
..L86:
                                                         #27.37
        pushq     %rbp                                          #27.37
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #27.37
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        andq      $-64, %rsp                                    #27.37
        pushq     %r13                                          #27.37
        pushq     %r14                                          #27.37
        pushq     %r15                                          #27.37
        pushq     %rbx                                          #27.37
        subq      $1120, %rsp                                   #27.37
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
        movq      %rdi, %r15                                    #27.37
        movl      $64, %edi                                     #30.7
        vmovsd    %xmm0, (%rsp)                                 #27.37[spill]
        lea       (,%r15,8), %rbx                               #30.30
        movq      %rbx, %rsi                                    #30.7
..___tag_value_scale.94:
#       aligned_alloc(size_t, size_t)
        call      aligned_alloc                                 #30.7
..___tag_value_scale.95:
                                # LOE rax rbx r12 r15
..B3.55:                        # Preds ..B3.1
                                # Execution count [1.00e+00]
        movq      %rax, %r13                                    #30.7
                                # LOE rbx r12 r13 r15
..B3.2:                         # Preds ..B3.55
                                # Execution count [1.00e+00]
        movl      $64, %edi                                     #31.7
        movq      %rbx, %rsi                                    #31.7
..___tag_value_scale.96:
#       aligned_alloc(size_t, size_t)
        call      aligned_alloc                                 #31.7
..___tag_value_scale.97:
                                # LOE rax r12 r13 r15
..B3.56:                        # Preds ..B3.2
                                # Execution count [1.00e+00]
        movq      %rax, %r14                                    #31.7
                                # LOE r12 r13 r14 r15
..B3.3:                         # Preds ..B3.56
                                # Execution count [1.00e+00]
        testq     %r15, %r15                                    #34.18
        jle       ..B3.21       # Prob 50%                      #34.18
                                # LOE r12 r13 r14 r15
..B3.4:                         # Preds ..B3.3
                                # Execution count [9.00e-01]
        cmpq      $16, %r15                                     #34.3
        jl        ..B3.52       # Prob 10%                      #34.3
                                # LOE r12 r13 r14 r15
..B3.5:                         # Preds ..B3.4
                                # Execution count [9.00e-01]
        movq      %r13, %rsi                                    #34.3
        andq      $63, %rsi                                     #34.3
        testq     $7, %rsi                                      #34.3
        je        ..B3.7        # Prob 50%                      #34.3
                                # LOE rsi r12 r13 r14 r15
..B3.6:                         # Preds ..B3.5
                                # Execution count [4.50e-01]
        xorl      %esi, %esi                                    #34.3
        jmp       ..B3.9        # Prob 100%                     #34.3
                                # LOE rsi r12 r13 r14 r15
..B3.7:                         # Preds ..B3.5
                                # Execution count [4.50e-01]
        testq     %rsi, %rsi                                    #34.3
        je        ..B3.9        # Prob 50%                      #34.3
                                # LOE rsi r12 r13 r14 r15
..B3.8:                         # Preds ..B3.7
                                # Execution count [0.00e+00]
        negq      %rsi                                          #34.3
        addq      $64, %rsi                                     #34.3
        shrq      $3, %rsi                                      #34.3
        cmpq      %rsi, %r15                                    #34.3
        cmovl     %r15, %rsi                                    #34.3
                                # LOE rsi r12 r13 r14 r15
..B3.9:                         # Preds ..B3.6 ..B3.8 ..B3.7
                                # Execution count [1.00e+00]
        movq      %r15, %rax                                    #34.3
        subq      %rsi, %rax                                    #34.3
        andq      $15, %rax                                     #34.3
        negq      %rax                                          #34.3
        addq      %r15, %rax                                    #34.3
        cmpq      $1, %rsi                                      #34.3
        jb        ..B3.13       # Prob 50%                      #34.3
                                # LOE rax rsi r12 r13 r14 r15
..B3.10:                        # Preds ..B3.9
                                # Execution count [9.00e-01]
        movl      $8, %ecx                                      #34.3
        xorl      %ebx, %ebx                                    #34.3
        vpbroadcastd %ecx, %ymm3                                #34.3
        xorl      %ecx, %ecx                                    #34.3
        vpbroadcastq %rsi, %zmm0                                #34.3
        vmovdqu   .L_2il0floatpacket.10(%rip), %ymm2            #34.3
        vmovups   .L_2il0floatpacket.9(%rip), %zmm1             #35.12
                                # LOE rax rcx rsi r12 r13 r14 r15 ebx ymm2 ymm3 zmm0 zmm1
..B3.11:                        # Preds ..B3.11 ..B3.10
                                # Execution count [5.00e+00]
        vpmovsxdq %ymm2, %zmm4                                  #34.3
        addl      $8, %ebx                                      #34.3
        vpaddd    %ymm3, %ymm2, %ymm2                           #34.3
        vpcmpgtq  %zmm4, %zmm0, %k1                             #34.3
        #vmovupd   %zmm1, (%rcx,%r13){%k1}                       #35.5
        addq      $64, %rcx                                     #34.3
        cmpq      %rsi, %rbx                                    #34.3
        jb        ..B3.11       # Prob 82%                      #34.3
                                # LOE rax rcx rsi r12 r13 r14 r15 ebx ymm2 ymm3 zmm0 zmm1
..B3.12:                        # Preds ..B3.11
                                # Execution count [9.00e-01]
        cmpq      %rsi, %r15                                    #34.3
        je        ..B3.21       # Prob 10%                      #34.3
                                # LOE rax rsi r12 r13 r14 r15
..B3.13:                        # Preds ..B3.9 ..B3.12
                                # Execution count [0.00e+00]
        lea       16(%rsi), %rcx                                #34.3
        cmpq      %rcx, %rax                                    #34.3
        jl        ..B3.17       # Prob 50%                      #34.3
                                # LOE rax rsi r12 r13 r14 r15
..B3.14:                        # Preds ..B3.13
                                # Execution count [9.00e-01]
        movslq    %esi, %rcx                                    #34.3
        movl      %esi, %ebx                                    #34.3
        vmovups   .L_2il0floatpacket.9(%rip), %zmm0             #35.12
                                # LOE rax rcx r12 r13 r14 r15 ebx zmm0
..B3.15:                        # Preds ..B3.15 ..B3.14
                                # Execution count [5.00e+00]
        addl      $16, %ebx                                     #34.3
        vmovupd   %zmm0, (%r13,%rcx,8)                          #35.5
        vmovupd   %zmm0, 64(%r13,%rcx,8)                        #35.5
        addq      $16, %rcx                                     #34.3
        cmpq      %rax, %rbx                                    #34.3
        jb        ..B3.15       # Prob 82%                      #34.3
                                # LOE rax rcx r12 r13 r14 r15 ebx zmm0
..B3.17:                        # Preds ..B3.15 ..B3.13 ..B3.52
                                # Execution count [1.00e+00]
        lea       1(%rax), %rcx                                 #34.3
        cmpq      %r15, %rcx                                    #34.3
        ja        ..B3.21       # Prob 50%                      #34.3
                                # LOE rax r12 r13 r14 r15
..B3.18:                        # Preds ..B3.17
                                # Execution count [9.00e-01]
        movslq    %eax, %rcx                                    #35.5
        negq      %rax                                          #34.3
        movl      $8, %esi                                      #34.3
        addq      %r15, %rax                                    #34.3
        vpbroadcastd %esi, %ymm3                                #34.3
        xorl      %esi, %esi                                    #34.3
        vpbroadcastq %rax, %zmm0                                #34.3
        vmovdqu   .L_2il0floatpacket.10(%rip), %ymm2            #34.3
        vmovups   .L_2il0floatpacket.9(%rip), %zmm1             #35.12
        lea       (%r13,%rcx,8), %rbx                           #35.5
        xorl      %ecx, %ecx                                    #34.3
                                # LOE rax rcx rbx r12 r13 r14 r15 esi ymm2 ymm3 zmm0 zmm1
..B3.19:                        # Preds ..B3.19 ..B3.18
                                # Execution count [5.00e+00]
        vpmovsxdq %ymm2, %zmm4                                  #34.3
        addl      $8, %esi                                      #34.3
        vpaddd    %ymm3, %ymm2, %ymm2                           #34.3
        vpcmpgtq  %zmm4, %zmm0, %k1                             #34.3
        #vmovupd   %zmm1, (%rcx,%rbx){%k1}                       #35.5
        addq      $64, %rcx                                     #34.3
        cmpq      %rax, %rsi                                    #34.3
        jb        ..B3.19       # Prob 82%                      #34.3
                                # LOE rax rcx rbx r12 r13 r14 r15 esi ymm2 ymm3 zmm0 zmm1
..B3.21:                        # Preds ..B3.3 ..B3.19 ..B3.12 ..B3.17
                                # Execution count [1.00e+00]
        vzeroupper                                              #41.5
        lea       1048(%rsp), %rdi                              #41.5
        movl      $1, %ebx                                      #39.14
        lea       1056(%rsp), %rsi                              #41.5
..___tag_value_scale.98:
#       timing(double *, double *)
        call      timing                                        #41.5
..___tag_value_scale.99:
                                # LOE r12 r13 r14 r15 ebx
..B3.22:                        # Preds ..B3.21
                                # Execution count [9.00e-01]
        vbroadcastsd (%rsp), %zmm3                              #27.6[spill]
        movq      %r15, %rdx                                    #47.7
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm4             #40.30
        vxorpd    %xmm0, %xmm0, %xmm0                           #43.17
        xorl      %eax, %eax                                    #42.5
        andq      $-16, %rdx                                    #47.7
        vpbroadcastq .L_2il0floatpacket.12(%rip), %zmm2         #47.7
        vmovdqu32 .L_2il0floatpacket.13(%rip), %zmm1            #47.7
        vmovups   %zmm3, 64(%rsp)                               #47.7[spill]
        movq      %r14, 1024(%rsp)                              #47.7[spill]
        movq      %rdx, %r14                                    #47.7
        movq      %r12, 1032(%rsp)                              #47.7[spill]
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
        movl      %eax, %r12d                                   #47.7
                                # LOE r13 r14 r15 ebx r12d xmm0
..B3.23:                        # Preds ..B3.22 ..B3.34 ..B3.40
                                # Execution count [2.78e+01]
        vcomisd   (%r13), %xmm0                                 #43.17
        jbe       ..B3.25       # Prob 78%                      #43.17
                                # LOE r13 r14 r15 ebx r12d xmm0
..B3.24:                        # Preds ..B3.23
                                # Execution count [6.11e+00]
        movq      %r13, %rdi                                    #43.20
        vzeroupper                                              #43.20
..___tag_value_scale.101:
#       dummy(double *)
        call      dummy                                         #43.20
..___tag_value_scale.102:
                                # LOE r13 r14 r15 ebx r12d
..B3.62:                        # Preds ..B3.24
                                # Execution count [6.11e+00]
        vxorpd    %xmm0, %xmm0, %xmm0                           #
                                # LOE r13 r14 r15 ebx r12d xmm0
..B3.25:                        # Preds ..B3.62 ..B3.23
                                # Execution count [2.78e+01]
        testq     %r15, %r15                                    #47.35
        jle       ..B3.34       # Prob 50%                      #47.35
                                # LOE r13 r14 r15 ebx r12d xmm0
..B3.26:                        # Preds ..B3.25
                                # Execution count [2.50e+01]
        cmpq      $16, %r15                                     #47.7
        jl        ..B3.51       # Prob 10%                      #47.7
                                # LOE r13 r14 r15 ebx r12d xmm0
..B3.27:                        # Preds ..B3.26
                                # Execution count [2.50e+01]
        vmovups   64(%rsp), %zmm3                               #47.7[spill]
        movq      %r14, %r8                                     #47.7
        xorl      %ecx, %ecx                                    #47.7
                                # LOE rcx r8 r13 r14 r15 ebx r12d xmm0 zmm3
..B3.28:                        # Preds ..B3.28 ..B3.27
                                # Execution count [1.39e+02]
        vaddpd    (%r13,%rcx,8), %zmm3, %zmm1                   #48.24
        vaddpd    64(%r13,%rcx,8), %zmm3, %zmm2                 #48.24
        vmovupd   %zmm1, (%r13,%rcx,8)                          #48.9
        vmovupd   %zmm2, 64(%r13,%rcx,8)                        #48.9
        addq      $16, %rcx                                     #47.7
        cmpq      %r14, %rcx                                    #47.7
        jb        ..B3.28       # Prob 82%                      #47.7
                                # LOE rcx r8 r13 r14 r15 ebx r12d xmm0 zmm3
..B3.30:                        # Preds ..B3.28 ..B3.51
                                # Execution count [2.78e+01]
        lea       1(%r8), %rcx                                  #47.7
        cmpq      %r15, %rcx                                    #47.7
        ja        ..B3.34       # Prob 50%                      #47.7
                                # LOE r8 r13 r14 r15 ebx r12d xmm0
..B3.31:                        # Preds ..B3.30
                                # Execution count [2.50e+01]
        vmovdqu32 .L_2il0floatpacket.13(%rip), %zmm2            #47.7
        lea       (%r13,%r8,8), %rcx                            #48.24
        vmovups   64(%rsp), %zmm5                               #47.7[spill]
        vpbroadcastq .L_2il0floatpacket.12(%rip), %zmm4         #47.7
        negq      %r8                                           #47.7
        xorl      %r9d, %r9d                                    #47.7
        addq      %r15, %r8                                     #47.7
        vpbroadcastq %r8, %zmm1                                 #47.7
                                # LOE rcx r8 r9 r13 r14 r15 ebx r12d xmm0 zmm1 zmm2 zmm4 zmm5
..B3.32:                        # Preds ..B3.32 ..B3.31
                                # Execution count [1.39e+02]
        vpcmpgtq  %zmm2, %zmm1, %k1                             #47.7
        addq      $8, %r9                                       #47.7
        vaddpd    (%rcx), %zmm5, %zmm3                          #48.24
        vpaddq    %zmm4, %zmm2, %zmm2                           #47.7
        #vmovupd   %zmm3, (%rcx){%k1}                            #48.9
        addq      $64, %rcx                                     #47.7
        cmpq      %r8, %r9                                      #47.7
        jb        ..B3.32       # Prob 82%                      #47.7
                                # LOE rcx r8 r9 r13 r14 r15 ebx r12d xmm0 zmm1 zmm2 zmm4 zmm5
..B3.34:                        # Preds ..B3.32 ..B3.25 ..B3.30
                                # Execution count [2.78e+01]
        incl      %r12d                                         #42.5
        cmpl      %ebx, %r12d                                   #42.5
        jb        ..B3.23       # Prob 82%                      #42.5
                                # LOE r13 r14 r15 ebx r12d xmm0
..B3.36:                        # Preds ..B3.34 ..B3.39
                                # Execution count [5.56e+00]: Infreq
        vzeroupper                                              #51.5
        lea       1064(%rsp), %rdi                              #51.5
        lea       1056(%rsp), %rsi                              #51.5
..___tag_value_scale.103:
#       timing(double *, double *)
        call      timing                                        #51.5
..___tag_value_scale.104:
                                # LOE r13 r14 r15 ebx
..B3.37:                        # Preds ..B3.36
                                # Execution count [5.56e+00]: Infreq
        vmovsd    1064(%rsp), %xmm1                             #52.15
        addl      %ebx, %ebx                                    #40.34
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #40.30
        vsubsd    1048(%rsp), %xmm1, %xmm1                      #52.19
        vcomisd   %xmm1, %xmm0                                  #40.30
        jbe       ..B3.41       # Prob 18%                      #40.30
                                # LOE r13 r14 r15 ebx xmm1
..B3.38:                        # Preds ..B3.37
                                # Execution count [4.56e+00]: Infreq
        lea       1048(%rsp), %rdi                              #41.5
        lea       1056(%rsp), %rsi                              #41.5
..___tag_value_scale.105:
#       timing(double *, double *)
        call      timing                                        #41.5
..___tag_value_scale.106:
                                # LOE r13 r14 r15 ebx
..B3.39:                        # Preds ..B3.38
                                # Execution count [4.56e+00]: Infreq
        xorl      %r12d, %r12d                                  #42.5
        testl     %ebx, %ebx                                    #42.20
        jle       ..B3.36       # Prob 10%                      #42.20
                                # LOE r13 r14 r15 ebx r12d
..B3.40:                        # Preds ..B3.39
                                # Execution count [4.10e+00]: Infreq
        .byte     15                                            #
        .byte     31                                            #
        .byte     0                                             #
        .byte     15                                            #
        .byte     31                                            #
        .byte     128                                           #
        .byte     0                                             #
        .byte     0                                             #
        .byte     0                                             #
        .byte     0                                             #
        vxorpd    %xmm0, %xmm0, %xmm0                           #
        jmp       ..B3.23       # Prob 100%                     #
                                # LOE r13 r14 r15 ebx r12d xmm0
..B3.41:                        # Preds ..B3.37
                                # Execution count [1.00e+00]: Infreq
        movl      %ebx, %eax                                    #54.3
        lea       (%rsp), %rdi                                  #56.3
        shrl      $31, %eax                                     #54.3
        movl      $1024, %esi                                   #56.3
        addl      %eax, %ebx                                    #54.3
        movq      1024(%rdi), %r14                              #[spill]
        movq      1032(%rsp), %r12                              #[spill]
	.cfi_restore 12
        sarl      $1, %ebx                                      #54.3
        vmovsd    %xmm1, 1040(%rdi)                             #56.3[spill]
..___tag_value_scale.108:
#       gethostname(char *, size_t)
        call      gethostname                                   #56.3
..___tag_value_scale.109:
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
                                # LOE r12 r13 r14 r15 ebx
..B3.42:                        # Preds ..B3.41
                                # Execution count [1.00e+00]: Infreq
        movl      $.L_2__STRING.0, %esi                         #58.12
        lea       (%rsp), %rdi                                  #58.12
        vmovsd    1040(%rdi), %xmm1                             #[spill]
..L111:                                                         #58.12
        movb      (%rdi), %dl                                   #58.12
        cmpb      (%rsi), %dl                                   #58.12
        jne       ..L113        # Prob 50%                      #58.12
        testb     %dl, %dl                                      #58.12
        je        ..L112        # Prob 50%                      #58.12
        movb      1(%rdi), %dl                                  #58.12
        cmpb      1(%rsi), %dl                                  #58.12
        jne       ..L113        # Prob 50%                      #58.12
        addq      $2, %rdi                                      #58.12
        addq      $2, %rsi                                      #58.12
        testb     %dl, %dl                                      #58.12
        jne       ..L111        # Prob 50%                      #58.12
..L112:                                                         #
        xorl      %eax, %eax                                    #58.12
        jmp       ..L114        # Prob 100%                     #58.12
..L113:                                                         #
        sbbl      %eax, %eax                                    #58.12
        orl       $1, %eax                                      #58.12
..L114:                                                         #
                                # LOE r12 r13 r14 r15 eax ebx xmm1
..B3.57:                        # Preds ..B3.42
                                # Execution count [1.00e+00]: Infreq
        testl     %eax, %eax                                    #58.12
        je        ..B3.46       # Prob 28%                      #58.12
                                # LOE r12 r13 r14 r15 ebx xmm1
..B3.43:                        # Preds ..B3.57
                                # Execution count [7.20e-01]: Infreq
        movl      $.L_2__STRING.1, %esi                         #58.12
        lea       (%rsp), %rdi                                  #58.12
..L115:                                                         #58.12
        movb      (%rdi), %dl                                   #58.12
        cmpb      (%rsi), %dl                                   #58.12
        jne       ..L117        # Prob 50%                      #58.12
        testb     %dl, %dl                                      #58.12
        je        ..L116        # Prob 50%                      #58.12
        movb      1(%rdi), %dl                                  #58.12
        cmpb      1(%rsi), %dl                                  #58.12
        jne       ..L117        # Prob 50%                      #58.12
        addq      $2, %rdi                                      #58.12
        addq      $2, %rsi                                      #58.12
        testb     %dl, %dl                                      #58.12
        jne       ..L115        # Prob 50%                      #58.12
..L116:                                                         #
        xorl      %eax, %eax                                    #58.12
        jmp       ..L118        # Prob 100%                     #58.12
..L117:                                                         #
        sbbl      %eax, %eax                                    #58.12
        orl       $1, %eax                                      #58.12
..L118:                                                         #
                                # LOE r12 r13 r14 r15 eax ebx xmm1
..B3.58:                        # Preds ..B3.43
                                # Execution count [7.20e-01]: Infreq
        testl     %eax, %eax                                    #58.12
        je        ..B3.46       # Prob 28%                      #58.12
                                # LOE r12 r13 r14 r15 ebx xmm1
..B3.44:                        # Preds ..B3.58
                                # Execution count [5.18e-01]: Infreq
        movl      $.L_2__STRING.2, %esi                         #58.12
        lea       (%rsp), %rdi                                  #58.12
..L119:                                                         #58.12
        movb      (%rdi), %dl                                   #58.12
        cmpb      (%rsi), %dl                                   #58.12
        jne       ..L121        # Prob 50%                      #58.12
        testb     %dl, %dl                                      #58.12
        je        ..L120        # Prob 50%                      #58.12
        movb      1(%rdi), %dl                                  #58.12
        cmpb      1(%rsi), %dl                                  #58.12
        jne       ..L121        # Prob 50%                      #58.12
        addq      $2, %rdi                                      #58.12
        addq      $2, %rsi                                      #58.12
        testb     %dl, %dl                                      #58.12
        jne       ..L119        # Prob 50%                      #58.12
..L120:                                                         #
        xorl      %eax, %eax                                    #58.12
        jmp       ..L122        # Prob 100%                     #58.12
..L121:                                                         #
        sbbl      %eax, %eax                                    #58.12
        orl       $1, %eax                                      #58.12
..L122:                                                         #
                                # LOE r12 r13 r14 r15 eax ebx xmm1
..B3.59:                        # Preds ..B3.44
                                # Execution count [5.18e-01]: Infreq
        testl     %eax, %eax                                    #58.12
        movq      $0x089173700, %rcx                            #58.12
        cmove     %rcx, %r8                                     #58.12
        jmp       ..B3.47       # Prob 100%                     #58.12
                                # LOE r8 r12 r13 r14 r15 ebx xmm1
..B3.46:                        # Preds ..B3.58 ..B3.57
                                # Execution count [2.80e-01]: Infreq
        movq      $0x083215600, %r8                             #58.12
                                # LOE r8 r12 r13 r14 r15 ebx xmm1
..B3.47:                        # Preds ..B3.46 ..B3.59
                                # Execution count [1.00e+00]: Infreq
        movslq    %ebx, %rcx                                    #59.3
        vxorpd    %xmm8, %xmm8, %xmm8                           #59.3
        imulq     %r15, %rcx                                    #59.3
        vcvtsi2sdq %rcx, %xmm8, %xmm8                           #59.3
        vmovsd    .L_2il0floatpacket.11(%rip), %xmm5            #59.3
        vxorpd    %xmm14, %xmm14, %xmm14                        #59.85
        vdivsd    %xmm1, %xmm5, %xmm16                          #59.301
        vmulsd    .L_2il0floatpacket.5(%rip), %xmm8, %xmm9      #59.3
        vxorpd    %xmm18, %xmm18, %xmm18                        #59.147
        vcvtsi2sdq %r15, %xmm14, %xmm14                         #59.85
        vcvtsi2sd %ebx, %xmm18, %xmm18                          #59.147
        vdivsd    %xmm9, %xmm1, %xmm10                          #59.3
        vmulsd    .L_2il0floatpacket.4(%rip), %xmm14, %xmm6     #59.3
        vxorpd    %xmm11, %xmm11, %xmm11                        #59.3
        vcvtsi2sdq %r8, %xmm11, %xmm11                          #59.3
        vmulsd    .L_2il0floatpacket.6(%rip), %xmm14, %xmm12    #59.3
        vmulsd    .L_2il0floatpacket.7(%rip), %xmm14, %xmm15    #59.3
        vmulsd    %xmm16, %xmm6, %xmm7                          #59.3
        vmulsd    %xmm16, %xmm12, %xmm13                        #59.3
        vmulsd    %xmm16, %xmm15, %xmm17                        #59.3
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm14, %xmm0     #59.3
        vmulsd    %xmm18, %xmm7, %xmm2                          #59.3
        vmulsd    %xmm11, %xmm10, %xmm3                         #59.3
        vmulsd    %xmm18, %xmm13, %xmm4                         #59.3
        vmulsd    %xmm18, %xmm17, %xmm5                         #59.3
        movl      $.L_2__STRING.3, %edi                         #59.3
        movl      %ebx, %esi                                    #59.3
        movq      %r15, %rdx                                    #59.3
        movl      $6, %eax                                      #59.3
..___tag_value_scale.123:
#       printf(const char *__restrict__, ...)
        call      printf                                        #59.3
..___tag_value_scale.124:
                                # LOE r12 r13 r14
..B3.48:                        # Preds ..B3.47
                                # Execution count [1.00e+00]: Infreq
        movq      %r13, %rdi                                    #61.3
#       free(void *)
        call      free                                          #61.3
                                # LOE r12 r14
..B3.49:                        # Preds ..B3.48
                                # Execution count [1.00e+00]: Infreq
        movq      %r14, %rdi                                    #61.12
#       free(void *)
        call      free                                          #61.12
                                # LOE r12
..B3.50:                        # Preds ..B3.49
                                # Execution count [1.00e+00]: Infreq
        addq      $1120, %rsp                                   #62.1
	.cfi_restore 3
        popq      %rbx                                          #62.1
	.cfi_restore 15
        popq      %r15                                          #62.1
	.cfi_restore 14
        popq      %r14                                          #62.1
	.cfi_restore 13
        popq      %r13                                          #62.1
        movq      %rbp, %rsp                                    #62.1
        popq      %rbp                                          #62.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
        ret                                                     #62.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0xc0, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
                                # LOE
..B3.51:                        # Preds ..B3.26
                                # Execution count [2.50e+00]: Infreq
        xorl      %r8d, %r8d                                    #47.7
        jmp       ..B3.30       # Prob 100%                     #47.7
	.cfi_restore 12
                                # LOE r8 r13 r14 r15 ebx r12d xmm0
..B3.52:                        # Preds ..B3.4
                                # Execution count [9.00e-02]: Infreq
        xorl      %eax, %eax                                    #34.3
        jmp       ..B3.17       # Prob 100%                     #34.3
        .align    16,0x90
                                # LOE rax r12 r13 r14 r15
	.cfi_endproc
# mark_end;
	.type	scale,@function
	.size	scale,.-scale
	.data
# -- End  scale
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.8:
	.long	0x3a7daa50,0x3ff3b31e,0x3a7daa50,0x3ff3b31e,0x3a7daa50,0x3ff3b31e,0x3a7daa50,0x3ff3b31e,0x3a7daa50,0x3ff3b31e,0x3a7daa50,0x3ff3b31e,0x3a7daa50,0x3ff3b31e,0x3a7daa50,0x3ff3b31e
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,64
	.align 64
.L_2il0floatpacket.9:
	.long	0x71b56e7e,0x3e80867a,0x71b56e7e,0x3e80867a,0x71b56e7e,0x3e80867a,0x71b56e7e,0x3e80867a,0x71b56e7e,0x3e80867a,0x71b56e7e,0x3e80867a,0x71b56e7e,0x3e80867a,0x71b56e7e,0x3e80867a
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,64
	.align 64
.L_2il0floatpacket.13:
	.long	0x00000000,0x00000000,0x00000001,0x00000000,0x00000002,0x00000000,0x00000003,0x00000000,0x00000004,0x00000000,0x00000005,0x00000000,0x00000006,0x00000000,0x00000007,0x00000000
	.type	.L_2il0floatpacket.13,@object
	.size	.L_2il0floatpacket.13,64
	.align 32
.L_2il0floatpacket.10:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,32
	.align 8
.L_2il0floatpacket.0:
	.long	0xe826d695,0x3e112e0b
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,8
	.align 8
.L_2il0floatpacket.1:
	.long	0xcccccccd,0x3ff4cccc
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.align 8
.L_2il0floatpacket.2:
	.long	0x9999999a,0x3fc99999
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0xd2f1a9fc,0x3f80624d
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
	.align 8
.L_2il0floatpacket.4:
	.long	0xa0b5ed8d,0x3ee0c6f7
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 8
.L_2il0floatpacket.5:
	.long	0x00000000,0x3fc00000
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.6:
	.long	0x00000000,0x3f000000
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,8
	.align 8
.L_2il0floatpacket.7:
	.long	0xa0b5ed8d,0x3eb0c6f7
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,8
	.align 8
.L_2il0floatpacket.11:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,8
	.align 8
.L_2il0floatpacket.12:
	.long	0x00000008,0x00000000
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.0:
	.long	1668505955
	.long	1701536108
	.long	3305587
	.type	.L_2__STRING.0,@object
	.size	.L_2__STRING.0,12
	.align 4
.L_2__STRING.1:
	.long	1836212599
	.word	28789
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,7
	.space 1, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.long	1819304302
	.long	3240805
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,8
	.align 4
.L_2__STRING.3:
	.long	775041317
	.long	2082498097
	.long	825304352
	.long	543569966
	.long	958734460
	.long	543568686
	.long	925180028
	.long	543568430
	.long	925180028
	.long	543568174
	.long	925180028
	.long	543568174
	.long	908402812
	.long	545005668
	.long	1684812837
	.word	2592
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,63
	.section .rodata.str1.32, "aMS",@progbits,1
	.space 11, 0x00 	# pad
	.align 32
.L_2__STRING.5:
	.long	1667590211
	.long	1735289195
	.long	1919903264
	.long	779298080
	.long	1701987872
	.long	1852142961
	.long	706771299
	.long	1953723757
	.long	1700929578
	.long	1952805664
	.long	544175136
	.long	841888805
	.long	1212620902
	.long	1868963962
	.long	1635131506
	.long	543451500
	.long	1127184739
	.long	667212
	.type	.L_2__STRING.5,@object
	.size	.L_2__STRING.5,72
	.data
	.section .note.GNU-stack, ""
#// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
# End
