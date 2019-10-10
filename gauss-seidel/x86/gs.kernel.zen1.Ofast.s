# mark_description "Intel(R) Fortran Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.2.187 Build 2019";
# mark_description "0117";
# mark_description "-funroll-loops -mavx2 -mfma -Ofast -S -o gs.s.zen1.Ofast.s";
	.file "gs_xxx.f90"
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r15 r14d xmm0 xmm1
        movl      $111, %ebx # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     100        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     103        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     144        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
..B1.75:                        # Preds ..B1.75 ..B1.74
                                # Execution count [9.36e+01]
        vmovsd    8(%r12,%r11), %xmm2                           #55.35
        incq      %r15                                          #54.9
        vaddsd    16(%r12,%r13), %xmm2, %xmm3                   #55.12
        vaddsd    8(%r12,%r10), %xmm3, %xmm4                    #55.12
        vaddsd    %xmm1, %xmm4, %xmm1                           #55.12
        vmulsd    %xmm1, %xmm0, %xmm5                           #55.12
        vmovsd    %xmm5, 8(%r12,%r13)                           #55.12
        vaddsd    16(%r12,%r11), %xmm5, %xmm6                   #55.48
        vaddsd    24(%r12,%r13), %xmm6, %xmm7                   #55.63
        vaddsd    16(%r12,%r10), %xmm7, %xmm8                   #55.79
        vmulsd    %xmm8, %xmm0, %xmm9                           #55.12
        vmovsd    %xmm9, 16(%r12,%r13)                          #55.12
        vaddsd    24(%r12,%r11), %xmm9, %xmm10                  #55.48
        vaddsd    32(%r12,%r13), %xmm10, %xmm11                 #55.63
        vaddsd    24(%r12,%r10), %xmm11, %xmm12                 #55.79
        vmulsd    %xmm12, %xmm0, %xmm13                         #55.12
        vmovsd    %xmm13, 24(%r12,%r13)                         #55.12
        vaddsd    32(%r12,%r11), %xmm13, %xmm14                 #55.48
        vaddsd    40(%r12,%r13), %xmm14, %xmm15                 #55.63
        vaddsd    32(%r12,%r10), %xmm15, %xmm1                  #55.79
        vmulsd    %xmm1, %xmm0, %xmm1                           #55.12
        vmovsd    %xmm1, 32(%r12,%r13)                          #55.12
        addq      $32, %r12                                     #54.9
        cmpq      %rbx, %r15                                    #54.9
        jb        ..B1.75       # Prob 28%                      #54.9
        movl      $222, %ebx # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     100        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     103        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
        .byte     144        # INSERTED BY KERNCRAFT IACA MARKER UTILITY
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r15 r14d xmm0 xmm1
