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
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.L9
	movl	$.LC2, %edi
	movl	$8, %ecx
	movq	%rdx, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L5
	movl	$2300000000, %edx
	movq	%rdx, (%r8)
	ret
	.p2align 4
	.p2align 3
.L9:
	movl	$2200000000, %ecx
	movq	%rcx, (%r8)
	ret
	.p2align 4
	.p2align 3
.L8:
	movl	$2500000000, %edx
	movq	%rdx, (%r8)
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
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	0(,%rdi,8), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%r12, %rsi
	movq	%rdi, %rbx
	subq	$1080, %rsp
	.cfi_def_cfa_offset 1136
	movl	$64, %edi
	vmovsd	%xmm0, (%rsp)
	call	aligned_alloc
	movq	%r12, %rsi
	movl	$64, %edi
	movq	%rax, %rbp
	call	aligned_alloc
	testq	%rbx, %rbx
	vmovsd	(%rsp), %xmm2
	movq	%rax, %r12
	jle	.L16
	cmpq	$1, %rbx
	je	.L33
	vmovaps	.LC6(%rip), %xmm0
	movq	%rbx, %rcx
	movq	%rbp, %rax
	shrq	%rcx
	salq	$4, %rcx
	addq	%rbp, %rcx
.L14:
	vmovaps	%xmm0, (%rax)
	addq	$16, %rax
	cmpq	%rax, %rcx
	jne	.L14
	movq	%rbx, %rcx
	andq	$-2, %rcx
	movslq	%ecx, %rax
	cmpq	%rcx, %rbx
	je	.L16
.L13:
	movq	.LC7(%rip), %rdx
	movq	%rdx, 0(%rbp,%rax,8)
.L16:
	movq	%rbx, %r14
	movq	%rbx, %r13
	movl	$1, (%rsp)
	shrq	%r14
	andq	$-2, %r13
	salq	$4, %r14
	.p2align 4
	.p2align 3
.L12:
	leaq	40(%rsp), %rsi
	leaq	24(%rsp), %rdi
	vmovsd	%xmm2, 8(%rsp)
	xorl	%r15d, %r15d
	call	timing
	vmovsd	8(%rsp), %xmm2
	.p2align 4
	.p2align 3
.L21:
	vxorpd	%xmm7, %xmm7, %xmm7
	vcomisd	0(%rbp), %xmm7
	ja	.L44
.L18:
	testq	%rbx, %rbx
	jle	.L26
	cmpq	$1, %rbx
	je	.L34
	vmovddup	%xmm2, %xmm1
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L24:
	vmulpd	0(%rbp,%rax), %xmm1, %xmm0
	vmovaps	%xmm0, (%r12,%rax)
	addq	$16, %rax
	cmpq	%r14, %rax
	jne	.L24
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
	movq	%r13, %rax
	cmpq	%r13, %rbx
	je	.L26
.L23:
	vmulsd	0(%rbp,%rax,8), %xmm2, %xmm0
	vmovsd	%xmm0, (%r12,%rax,8)
.L26:
	incl	%r15d
	cmpl	%r15d, (%rsp)
	jne	.L21
	leaq	40(%rsp), %rsi
	leaq	32(%rsp), %rdi
	vmovsd	%xmm2, 8(%rsp)
	call	timing
	vmovsd	32(%rsp), %xmm1
	vmovsd	.LC9(%rip), %xmm6
	vsubsd	24(%rsp), %xmm1, %xmm1
	vmovsd	8(%rsp), %xmm2
	sall	(%rsp)
	vcomisd	%xmm1, %xmm6
	ja	.L12
	movl	(%rsp), %r13d
	movl	$1024, %esi
	leaq	48(%rsp), %rdi
	vmovsd	%xmm1, 8(%rsp)
	call	gethostname
	movabsq	$7308041938491629923, %rax
	vmovsd	8(%rsp), %xmm1
	sarl	%r13d
	cmpq	%rax, 48(%rsp)
	je	.L45
	cmpl	$1836212599, 48(%rsp)
	je	.L46
.L31:
	vmovsd	.LC5(%rip), %xmm6
.L30:
	vxorps	%xmm2, %xmm2, %xmm2
	vmovsd	.LC11(%rip), %xmm8
	vmovsd	.LC13(%rip), %xmm9
	movslq	%r13d, %rax
	vcvtsi2sdq	%rbx, %xmm2, %xmm3
	vcvtsi2sdl	%r13d, %xmm2, %xmm0
	vmulsd	.LC10(%rip), %xmm3, %xmm7
	vmovaps	%xmm3, %xmm4
	vmulsd	%xmm3, %xmm0, %xmm5
	imulq	%rbx, %rax
	movq	%rbx, %rdx
	movl	%r13d, %esi
	movl	$.LC16, %edi
	vmulsd	.LC12(%rip), %xmm0, %xmm3
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	movl	$6, %eax
	vdivsd	%xmm1, %xmm5, %xmm5
	vmulsd	%xmm6, %xmm1, %xmm6
	vmulsd	%xmm7, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm3, %xmm3
	vdivsd	%xmm8, %xmm5, %xmm5
	vdivsd	%xmm1, %xmm3, %xmm3
	vmulsd	%xmm9, %xmm3, %xmm4
	vmulsd	.LC14(%rip), %xmm2, %xmm3
	vdivsd	%xmm8, %xmm5, %xmm5
	vmulsd	.LC15(%rip), %xmm0, %xmm2
	vmulsd	%xmm9, %xmm4, %xmm4
	vdivsd	%xmm8, %xmm7, %xmm0
	vdivsd	%xmm3, %xmm6, %xmm3
	vdivsd	%xmm1, %xmm2, %xmm2
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
.L44:
	.cfi_restore_state
	movq	%rbp, %rdi
	vmovsd	%xmm2, 8(%rsp)
	call	dummy
	vmovsd	8(%rsp), %xmm2
	jmp	.L18
	.p2align 4
	.p2align 3
.L34:
	xorl	%eax, %eax
	jmp	.L23
.L45:
	cmpl	$3305587, 56(%rsp)
	vmovsd	.LC3(%rip), %xmm6
	je	.L30
	cmpl	$1836212599, 48(%rsp)
	jne	.L31
.L46:
	cmpw	$28789, 52(%rsp)
	jne	.L31
	cmpb	$0, 54(%rsp)
	vmovsd	.LC4(%rip), %xmm6
	je	.L30
	jmp	.L31
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
	movl	$20, %ebx
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
	.p2align 4
	.p2align 3
.L48:
	movq	.LC21(%rip), %rax
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	incl	%ebx
	vmovq	%rax, %xmm0
	call	pow
	movq	.LC22(%rip), %rax
	vcvttsd2sil	%xmm0, %edi
	andl	$-64, %edi
	movslq	%edi, %rdi
	vmovq	%rax, %xmm0
	call	scale
	cmpl	$36, %ebx
	jne	.L48
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
