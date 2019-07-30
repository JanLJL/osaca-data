	.file	"scale.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"casclakesp2"
.LC1:
	.string	"warmup"
.LC2:
	.string	"naples1"
	.text
	.p2align 4
	.globl	getFreq
	.type	getFreq, @function
getFreq:
.LFB24:
	.cfi_startproc
	movq	%rdi, %rdx
	movq	%rsi, %r8
	movl	$.LC0, %edi
	movl	$12, %ecx
	movq	%rdx, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.L8
	movl	$.LC1, %edi
	movl	$7, %ecx
	movq	%rdx, %rsi
	repz cmpsb
	seta	%r9b
	sbbb	$0, %r9b
	movsbl	%r9b, %eax
	testl	%eax, %eax
	je	.L9
	movl	$.LC2, %edi
	movl	$8, %ecx
	movq	%rdx, %rsi
	repz cmpsb
	seta	%r10b
	sbbb	$0, %r10b
	movsbl	%r10b, %eax
	testl	%eax, %eax
	jne	.L5
	movl	$2300000000, %r11d
	movq	%r11, (%r8)
	ret
	.p2align 4
	.p2align 3
.L9:
	movl	$2200000000, %edx
	movq	%rdx, (%r8)
	ret
	.p2align 4
	.p2align 3
.L8:
	movl	$2500000000, %r9d
	movq	%r9, (%r8)
	ret
	.p2align 4
	.p2align 3
.L5:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	getFreq, .-getFreq
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC16:
	.string	"%12.1f | %11.8f | %9.3f | %7.2f | %7.1f | %7.1f | %6d | %4ld \n"
	.text
	.p2align 4
	.globl	scale
	.type	scale, @function
scale:
.LFB25:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	0(,%rdi,8), %r12
	movl	$64, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r12, %rsi
	subq	$1080, %rsp
	.cfi_def_cfa_offset 1136
	vmovsd	%xmm0, (%rsp)
	call	aligned_alloc
	movq	%r12, %rsi
	movl	$64, %edi
	movq	%rax, %rbp
	call	aligned_alloc
	testq	%r15, %r15
	vmovsd	(%rsp), %xmm6
	movq	%rax, %r12
	jle	.L16
	cmpq	$1, %r15
	je	.L33
	movq	%r15, %rdx
	vmovaps	.LC6(%rip), %xmm0
	movq	%rbp, %rbx
	shrq	%rdx
	salq	$4, %rdx
	leaq	(%rdx,%rbp), %rcx
	subq	$16, %rdx
	shrq	$4, %rdx
	incq	%rdx
	andl	$7, %edx
	je	.L14
	cmpq	$1, %rdx
	je	.L84
	cmpq	$2, %rdx
	je	.L85
	cmpq	$3, %rdx
	je	.L86
	cmpq	$4, %rdx
	je	.L87
	cmpq	$5, %rdx
	je	.L88
	cmpq	$6, %rdx
	jne	.L116
.L89:
	vmovaps	%xmm0, (%rbx)
	addq	$16, %rbx
.L88:
	vmovaps	%xmm0, (%rbx)
	addq	$16, %rbx
.L87:
	vmovaps	%xmm0, (%rbx)
	addq	$16, %rbx
.L86:
	vmovaps	%xmm0, (%rbx)
	addq	$16, %rbx
.L85:
	vmovaps	%xmm0, (%rbx)
	addq	$16, %rbx
.L84:
	vmovaps	%xmm0, (%rbx)
	addq	$16, %rbx
	cmpq	%rbx, %rcx
	je	.L114
.L14:
	vmovaps	%xmm0, (%rbx)
	vmovaps	%xmm0, 16(%rbx)
	subq	$-128, %rbx
	vmovaps	%xmm0, -96(%rbx)
	vmovaps	%xmm0, -80(%rbx)
	vmovaps	%xmm0, -64(%rbx)
	vmovaps	%xmm0, -48(%rbx)
	vmovaps	%xmm0, -32(%rbx)
	vmovaps	%xmm0, -16(%rbx)
	cmpq	%rbx, %rcx
	jne	.L14
.L114:
	movq	%r15, %rsi
	andq	$-2, %rsi
	movslq	%esi, %rax
	cmpq	%rsi, %r15
	je	.L16
.L13:
	movq	.LC7(%rip), %rdi
	movq	%rdi, 0(%rbp,%rax,8)
.L16:
	movq	%r15, %r13
	movq	%r15, %rbx
	movl	$1, (%rsp)
	shrq	%r13
	andq	$-2, %rbx
	salq	$4, %r13
	.p2align 4
	.p2align 3
.L12:
	leaq	40(%rsp), %rsi
	leaq	24(%rsp), %rdi
	vmovsd	%xmm6, 8(%rsp)
	xorl	%r14d, %r14d
	call	timing
	vmovsd	8(%rsp), %xmm2
	.p2align 4
	.p2align 3
.L21:
	vxorpd	%xmm7, %xmm7, %xmm7
	vcomisd	0(%rbp), %xmm7
	ja	.L117
.L18:
	testq	%r15, %r15
	jle	.L26
	cmpq	$1, %r15
	je	.L34
	leaq	-16(%r13), %r9
	xorl	%r10d, %r10d
	vmovddup	%xmm2, %xmm3
	shrq	$4, %r9
	incq	%r9
	andl	$7, %r9d
	je	.L24
	cmpq	$1, %r9
	je	.L90
	cmpq	$2, %r9
	je	.L91
	cmpq	$3, %r9
	je	.L92
	cmpq	$4, %r9
	je	.L93
	cmpq	$5, %r9
	je	.L94
	cmpq	$6, %r9
	je	.L95
	vmulpd	0(%rbp), %xmm3, %xmm1
	movl	$16, %r10d
	vmovaps	%xmm1, (%r12)
.L95:
	vmulpd	0(%rbp,%r10), %xmm3, %xmm4
	vmovaps	%xmm4, (%r12,%r10)
	addq	$16, %r10
.L94:
	vmulpd	0(%rbp,%r10), %xmm3, %xmm5
	vmovaps	%xmm5, (%r12,%r10)
	addq	$16, %r10
.L93:
	vmulpd	0(%rbp,%r10), %xmm3, %xmm6
	vmovaps	%xmm6, (%r12,%r10)
	addq	$16, %r10
.L92:
	vmulpd	0(%rbp,%r10), %xmm3, %xmm8
	vmovaps	%xmm8, (%r12,%r10)
	addq	$16, %r10
.L91:
	vmulpd	0(%rbp,%r10), %xmm3, %xmm9
	vmovaps	%xmm9, (%r12,%r10)
	addq	$16, %r10
.L90:
	vmulpd	0(%rbp,%r10), %xmm3, %xmm10
	vmovaps	%xmm10, (%r12,%r10)
	addq	$16, %r10
	cmpq	%r13, %r10
	je	.L113
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
    # LLVM-MCA-BEGIN
.L24:
	vmulpd	0(%rbp,%r10), %xmm3, %xmm11
	vmulpd	16(%rbp,%r10), %xmm3, %xmm12
	vmulpd	32(%rbp,%r10), %xmm3, %xmm13
	vmulpd	48(%rbp,%r10), %xmm3, %xmm14
	vmulpd	64(%rbp,%r10), %xmm3, %xmm15
	vmulpd	80(%rbp,%r10), %xmm3, %xmm0
	vmovaps	%xmm11, (%r12,%r10)
	vmovaps	%xmm12, 16(%r12,%r10)
	vmulpd	96(%rbp,%r10), %xmm3, %xmm7
	vmulpd	112(%rbp,%r10), %xmm3, %xmm1
	vmovaps	%xmm13, 32(%r12,%r10)
	vmovaps	%xmm14, 48(%r12,%r10)
	vmovaps	%xmm15, 64(%r12,%r10)
	vmovaps	%xmm0, 80(%r12,%r10)
	vmovaps	%xmm7, 96(%r12,%r10)
	vmovaps	%xmm1, 112(%r12,%r10)
	subq	$-128, %r10
	cmpq	%r13, %r10
	jne	.L24
    # LLVM-MCA-END
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L113:
	movq	%rbx, %r8
	cmpq	%rbx, %r15
	je	.L26
.L23:
	vmulsd	0(%rbp,%r8,8), %xmm2, %xmm3
	vmovsd	%xmm3, (%r12,%r8,8)
.L26:
	incl	%r14d
	cmpl	%r14d, (%rsp)
	jne	.L21
	leaq	40(%rsp), %rsi
	leaq	32(%rsp), %rdi
	vmovsd	%xmm2, 8(%rsp)
	call	timing
	vmovsd	32(%rsp), %xmm2
	vmovsd	.LC9(%rip), %xmm5
	vsubsd	24(%rsp), %xmm2, %xmm4
	vmovsd	8(%rsp), %xmm6
	sall	(%rsp)
	vcomisd	%xmm4, %xmm5
	ja	.L12
	movl	(%rsp), %r13d
	movl	$1024, %esi
	leaq	48(%rsp), %rdi
	vmovsd	%xmm4, 8(%rsp)
	call	gethostname
	movabsq	$7308041938491629923, %r11
	vmovsd	8(%rsp), %xmm1
	sarl	%r13d
	cmpq	%r11, 48(%rsp)
	je	.L118
	cmpl	$1836212599, 48(%rsp)
	je	.L119
.L31:
	vmovsd	.LC5(%rip), %xmm10
.L30:
	vxorps	%xmm11, %xmm11, %xmm11
	vmovsd	.LC11(%rip), %xmm15
	movslq	%r13d, %rax
	vmovsd	.LC13(%rip), %xmm9
	vcvtsi2sdq	%r15, %xmm11, %xmm4
	vcvtsi2sdl	%r13d, %xmm11, %xmm12
	vmulsd	.LC12(%rip), %xmm12, %xmm0
	vmulsd	.LC10(%rip), %xmm4, %xmm13
	imulq	%r15, %rax
	movq	%r15, %rdx
	movl	%r13d, %esi
	movl	$.LC16, %edi
	vcvtsi2sdq	%rax, %xmm11, %xmm5
	movl	$6, %eax
	vmulsd	%xmm4, %xmm12, %xmm8
	vmulsd	%xmm10, %xmm1, %xmm6
	vmulsd	.LC14(%rip), %xmm5, %xmm10
	vdivsd	%xmm1, %xmm8, %xmm14
	vmulsd	%xmm4, %xmm0, %xmm3
	vmulsd	%xmm13, %xmm12, %xmm11
	vmulsd	.LC15(%rip), %xmm11, %xmm12
	vdivsd	%xmm1, %xmm3, %xmm2
	vdivsd	%xmm15, %xmm14, %xmm7
	vmulsd	%xmm9, %xmm2, %xmm4
	vmulsd	%xmm9, %xmm4, %xmm4
	vdivsd	%xmm15, %xmm13, %xmm0
	vdivsd	%xmm15, %xmm7, %xmm5
	vdivsd	%xmm10, %xmm6, %xmm3
	vdivsd	%xmm1, %xmm12, %xmm2
	call	printf
	movq	%rbp, %rdi
	call	free
	addq	$1080, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free
	.p2align 4
	.p2align 3
.L117:
	.cfi_restore_state
	movq	%rbp, %rdi
	vmovsd	%xmm2, 8(%rsp)
	call	dummy
	vmovsd	8(%rsp), %xmm2
	jmp	.L18
	.p2align 4
	.p2align 3
.L34:
	xorl	%r8d, %r8d
	jmp	.L23
.L118:
	cmpl	$3305587, 56(%rsp)
	vmovsd	.LC3(%rip), %xmm10
	je	.L30
	cmpl	$1836212599, 48(%rsp)
	jne	.L31
.L119:
	cmpw	$28789, 52(%rsp)
	jne	.L31
	cmpb	$0, 54(%rsp)
	vmovsd	.LC4(%rip), %xmm10
	je	.L30
	jmp	.L31
.L116:
	vmovaps	%xmm0, 0(%rbp)
	leaq	16(%rbp), %rbx
	jmp	.L89
.L33:
	xorl	%eax, %eax
	jmp	.L13
	.cfi_endproc
.LFE25:
	.size	scale, .-scale
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"SCALE b[i] = s * a[i], 16 byte/it, 1 Flop/it"
	.align 8
.LC19:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
	.align 8
.LC20:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB26:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$1024, %esi
	movl	$21, %ebx
	subq	$1040, %rsp
	.cfi_def_cfa_offset 1056
	leaq	16(%rsp), %rdi
	call	gethostname
	leaq	8(%rsp), %rsi
	leaq	16(%rsp), %rdi
	call	getFreq
	movl	$.LC17, %edi
	call	puts
	vxorps	%xmm3, %xmm3, %xmm3
	leaq	16(%rsp), %rsi
	movl	$.LC19, %edi
	vcvtsi2sdq	8(%rsp), %xmm3, %xmm0
	vdivsd	.LC18(%rip), %xmm0, %xmm0
	movl	$1, %eax
	call	printf
	movl	$.LC20, %edi
	call	puts
	movq	.LC21(%rip), %rdx
	movl	$20, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	vmovq	%rdx, %xmm0
	call	pow
	movq	.LC22(%rip), %rcx
	vcvttsd2sil	%xmm0, %edi
	andl	$-64, %edi
	movslq	%edi, %rdi
	vmovq	%rcx, %xmm0
	call	scale
.L121:
	movq	.LC21(%rip), %rsi
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	vmovq	%rsi, %xmm0
	call	pow
	movq	.LC22(%rip), %r9
	vcvttsd2sil	%xmm0, %r8d
	andl	$-64, %r8d
	movslq	%r8d, %rdi
	vmovq	%r9, %xmm0
	call	scale
	movq	.LC21(%rip), %r11
	vxorps	%xmm4, %xmm4, %xmm4
	leal	1(%rbx), %r10d
	vcvtsi2sdl	%r10d, %xmm4, %xmm1
	vmovq	%r11, %xmm0
	call	pow
	movq	.LC22(%rip), %rdx
	vcvttsd2sil	%xmm0, %eax
	andl	$-64, %eax
	movslq	%eax, %rdi
	vmovq	%rdx, %xmm0
	call	scale
	movq	.LC21(%rip), %rcx
	vxorps	%xmm5, %xmm5, %xmm5
	leal	2(%rbx), %edi
	vcvtsi2sdl	%edi, %xmm5, %xmm1
	vmovq	%rcx, %xmm0
	call	pow
	movq	.LC22(%rip), %r8
	vcvttsd2sil	%xmm0, %esi
	andl	$-64, %esi
	movslq	%esi, %rdi
	vmovq	%r8, %xmm0
	call	scale
	movq	.LC21(%rip), %r10
	leal	3(%rbx), %r9d
	vxorps	%xmm6, %xmm6, %xmm6
	vcvtsi2sdl	%r9d, %xmm6, %xmm1
	vmovq	%r10, %xmm0
	call	pow
	movq	.LC22(%rip), %rax
	vcvttsd2sil	%xmm0, %r11d
	andl	$-64, %r11d
	movslq	%r11d, %rdi
	vmovq	%rax, %xmm0
	call	scale
	movq	.LC21(%rip), %rdi
	leal	4(%rbx), %edx
	vxorps	%xmm7, %xmm7, %xmm7
	addl	$5, %ebx
	vcvtsi2sdl	%edx, %xmm7, %xmm1
	vmovq	%rdi, %xmm0
	call	pow
	movq	.LC22(%rip), %rsi
	vcvttsd2sil	%xmm0, %ecx
	andl	$-64, %ecx
	movslq	%ecx, %rdi
	vmovq	%rsi, %xmm0
	call	scale
	cmpl	$36, %ebx
	jne	.L121
	addq	$1040, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	536870912
	.long	1105371231
	.align 8
.LC4:
	.long	3221225472
	.long	1105224746
	.align 8
.LC5:
	.long	3758096384
	.long	1105273574
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	1907715710
	.long	1048610426
	.align 8
.LC9:
	.long	2576980378
	.long	1070176665
	.align 8
.LC10:
	.long	0
	.long	1075838976
	.align 8
.LC11:
	.long	0
	.long	1083129856
	.align 8
.LC12:
	.long	0
	.long	1077936128
	.align 8
.LC13:
	.long	0
	.long	1062207488
	.align 8
.LC14:
	.long	0
	.long	1069547520
	.align 8
.LC15:
	.long	2696277389
	.long	1051772663
	.align 8
.LC18:
	.long	0
	.long	1104006501
	.align 8
.LC21:
	.long	3435973837
	.long	1073007820
	.align 8
.LC22:
	.long	981314128
	.long	1072935710
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
