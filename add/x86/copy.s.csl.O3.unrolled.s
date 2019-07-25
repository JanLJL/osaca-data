	.file	"copy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"casclakesp2"
.LC1:
	.string	"warmup"
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
	je	.L7
	movl	$.LC1, %edi
	movl	$7, %ecx
	movq	%rdx, %rsi
	repz cmpsb
	seta	%r9b
	sbbb	$0, %r9b
	movsbl	%r9b, %eax
	testl	%eax, %eax
	jne	.L4
	movl	$2200000000, %r10d
	movq	%r10, (%r8)
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$2500000000, %r11d
	movq	%r11, (%r8)
	ret
	.p2align 4,,10
	.p2align 3
.L4:
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
	.globl	copy
	.type	copy, @function
copy:
.LFB25:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leaq	16(%rsp), %r13
	.cfi_def_cfa 13, 0
	andq	$-32, %rsp
	pushq	-8(%r13)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	pushq	%r14
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	leaq	0(,%rdi,8), %r14
	movq	%r14, %rsi
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	pushq	%r12
	pushq	%rbx
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rdi, %rbx
	movl	$64, %edi
	subq	$1096, %rsp
	call	aligned_alloc
	movq	%r14, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movq	%r14, %rsi
	movl	$64, %edi
	movq	%rax, %r13
	call	aligned_alloc
	movq	%rax, %r14
	leaq	-1(%rbx), %rax
	movq	%rax, -1112(%rbp)
	testq	%rbx, %rbx
	jle	.L14
	cmpq	$2, %rax
	jbe	.L29
	movq	%rbx, %rcx
	shrq	$2, %rcx
	salq	$5, %rcx
	leaq	-32(%rcx), %rdx
	shrq	$5, %rdx
	incq	%rdx
	vmovapd	.LC4(%rip), %ymm1
	vmovapd	.LC5(%rip), %ymm0
	xorl	%esi, %esi
	andl	$7, %edx
	je	.L12
	cmpq	$1, %rdx
	je	.L79
	cmpq	$2, %rdx
	je	.L80
	cmpq	$3, %rdx
	je	.L81
	cmpq	$4, %rdx
	je	.L82
	cmpq	$5, %rdx
	je	.L83
	cmpq	$6, %rdx
	jne	.L112
.L84:
	vmovapd	%ymm1, 0(%r13,%rsi)
	vmovapd	%ymm0, (%r14,%rsi)
	addq	$32, %rsi
.L83:
	vmovapd	%ymm1, 0(%r13,%rsi)
	vmovapd	%ymm0, (%r14,%rsi)
	addq	$32, %rsi
.L82:
	vmovapd	%ymm1, 0(%r13,%rsi)
	vmovapd	%ymm0, (%r14,%rsi)
	addq	$32, %rsi
.L81:
	vmovapd	%ymm1, 0(%r13,%rsi)
	vmovapd	%ymm0, (%r14,%rsi)
	addq	$32, %rsi
.L80:
	vmovapd	%ymm1, 0(%r13,%rsi)
	vmovapd	%ymm0, (%r14,%rsi)
	addq	$32, %rsi
.L79:
	vmovapd	%ymm1, 0(%r13,%rsi)
	vmovapd	%ymm0, (%r14,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	je	.L109
.L12:
	vmovapd	%ymm1, 0(%r13,%rsi)
	vmovapd	%ymm0, (%r14,%rsi)
	vmovapd	%ymm1, 32(%r13,%rsi)
	vmovapd	%ymm0, 32(%r14,%rsi)
	vmovapd	%ymm1, 64(%r13,%rsi)
	vmovapd	%ymm0, 64(%r14,%rsi)
	vmovapd	%ymm1, 96(%r13,%rsi)
	vmovapd	%ymm0, 96(%r14,%rsi)
	vmovapd	%ymm1, 128(%r13,%rsi)
	vmovapd	%ymm0, 128(%r14,%rsi)
	vmovapd	%ymm1, 160(%r13,%rsi)
	vmovapd	%ymm0, 160(%r14,%rsi)
	vmovapd	%ymm1, 192(%r13,%rsi)
	vmovapd	%ymm0, 192(%r14,%rsi)
	vmovapd	%ymm1, 224(%r13,%rsi)
	vmovapd	%ymm0, 224(%r14,%rsi)
	addq	$256, %rsi
	cmpq	%rsi, %rcx
	jne	.L12
.L109:
	movq	%rbx, %rdi
	andq	$-4, %rdi
	movl	%edi, %eax
	cmpq	%rdi, %rbx
	je	.L113
	vzeroupper
.L11:
	vmovsd	.LC6(%rip), %xmm2
	vmovsd	.LC7(%rip), %xmm3
	leal	1(%rax), %r9d
	movslq	%eax, %r8
	movslq	%r9d, %r10
	vmovsd	%xmm2, 0(%r13,%r8,8)
	vmovsd	%xmm3, (%r14,%r8,8)
	cmpq	%r10, %rbx
	jle	.L14
	addl	$2, %eax
	cltq
	vmovsd	%xmm2, 0(%r13,%r10,8)
	vmovsd	%xmm3, (%r14,%r10,8)
	cmpq	%rax, %rbx
	jle	.L14
	vmovsd	%xmm2, 0(%r13,%rax,8)
	vmovsd	%xmm3, (%r14,%rax,8)
.L14:
	movq	%rbx, %r15
	shrq	$2, %r15
	movq	%rbx, %r9
	salq	$5, %r15
	andq	$-4, %r9
	movl	$1, %r10d
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	-1096(%rbp), %rdi
	leaq	-1080(%rbp), %rsi
	movq	%r15, -1120(%rbp)
	movl	%r10d, -1132(%rbp)
	movq	%r9, -1128(%rbp)
	call	timing
	movl	-1132(%rbp), %r11d
	movq	-1128(%rbp), %rdi
	movq	-1120(%rbp), %rcx
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L19:
	vxorpd	%xmm5, %xmm5, %xmm5
	vcomisd	(%r12), %xmm5
	ja	.L114
.L16:
	testq	%rbx, %rbx
	jle	.L24
	xorl	%eax, %eax
	cmpq	$2, -1112(%rbp)
	jbe	.L21
	leaq	-32(%rcx), %rdx
	shrq	$5, %rdx
	incq	%rdx
	andl	$7, %edx
	je	.L22
	cmpq	$1, %rdx
	je	.L85
	cmpq	$2, %rdx
	je	.L86
	cmpq	$3, %rdx
	je	.L87
	cmpq	$4, %rdx
	je	.L88
	cmpq	$5, %rdx
	je	.L89
	cmpq	$6, %rdx
	je	.L90
	vmovapd	0(%r13), %ymm4
	movl	$32, %eax
	vaddpd	(%r14), %ymm4, %ymm6
	vmovapd	%ymm6, (%r12)
.L90:
	vmovapd	0(%r13,%rax), %ymm7
	vaddpd	(%r14,%rax), %ymm7, %ymm8
	vmovapd	%ymm8, (%r12,%rax)
	addq	$32, %rax
.L89:
	vmovapd	0(%r13,%rax), %ymm9
	vaddpd	(%r14,%rax), %ymm9, %ymm10
	vmovapd	%ymm10, (%r12,%rax)
	addq	$32, %rax
.L88:
	vmovapd	0(%r13,%rax), %ymm11
	vaddpd	(%r14,%rax), %ymm11, %ymm12
	vmovapd	%ymm12, (%r12,%rax)
	addq	$32, %rax
.L87:
	vmovapd	0(%r13,%rax), %ymm13
	vaddpd	(%r14,%rax), %ymm13, %ymm14
	vmovapd	%ymm14, (%r12,%rax)
	addq	$32, %rax
.L86:
	vmovapd	0(%r13,%rax), %ymm15
	vaddpd	(%r14,%rax), %ymm15, %ymm1
	vmovapd	%ymm1, (%r12,%rax)
	addq	$32, %rax
.L85:
	vmovapd	0(%r13,%rax), %ymm0
	vaddpd	(%r14,%rax), %ymm0, %ymm2
	vmovapd	%ymm2, (%r12,%rax)
	addq	$32, %rax
	cmpq	%rax, %rcx
	je	.L108
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L22:
	vmovapd	0(%r13,%rax), %ymm3
	vmovapd	32(%r13,%rax), %ymm4
	vmovapd	64(%r13,%rax), %ymm7
	vmovapd	96(%r13,%rax), %ymm9
	vmovapd	128(%r13,%rax), %ymm11
	vmovapd	160(%r13,%rax), %ymm13
	vmovapd	192(%r13,%rax), %ymm15
	vmovapd	224(%r13,%rax), %ymm0
	vaddpd	(%r14,%rax), %ymm3, %ymm5
	vaddpd	32(%r14,%rax), %ymm4, %ymm6
	vaddpd	64(%r14,%rax), %ymm7, %ymm8
	vaddpd	96(%r14,%rax), %ymm9, %ymm10
	vaddpd	128(%r14,%rax), %ymm11, %ymm12
	vaddpd	160(%r14,%rax), %ymm13, %ymm14
	vaddpd	192(%r14,%rax), %ymm15, %ymm1
	vaddpd	224(%r14,%rax), %ymm0, %ymm2
	vmovapd	%ymm5, (%r12,%rax)
	vmovapd	%ymm6, 32(%r12,%rax)
	vmovapd	%ymm8, 64(%r12,%rax)
	vmovapd	%ymm10, 96(%r12,%rax)
	vmovapd	%ymm12, 128(%r12,%rax)
	vmovapd	%ymm14, 160(%r12,%rax)
	vmovapd	%ymm1, 192(%r12,%rax)
	vmovapd	%ymm2, 224(%r12,%rax)
	addq	$256, %rax
	cmpq	%rax, %rcx
	jne	.L22
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L108:
	cmpq	%rdi, %rbx
	je	.L24
	movq	%rdi, %rax
.L21:
	vmovsd	0(%r13,%rax,8), %xmm3
	leaq	1(%rax), %rsi
	vaddsd	(%r14,%rax,8), %xmm3, %xmm5
	leaq	0(,%rax,8), %r8
	vmovsd	%xmm5, (%r12,%rax,8)
	cmpq	%rbx, %rsi
	jge	.L24
	vmovsd	8(%r14,%r8), %xmm4
	addq	$2, %rax
	vaddsd	8(%r13,%r8), %xmm4, %xmm6
	vmovsd	%xmm6, 8(%r12,%r8)
	cmpq	%rax, %rbx
	jle	.L24
	vmovsd	16(%r14,%r8), %xmm7
	vaddsd	16(%r13,%r8), %xmm7, %xmm8
	vmovsd	%xmm8, 16(%r12,%r8)
.L24:
	incl	%r15d
	cmpl	%r11d, %r15d
	jne	.L19
	movq	%rdi, -1128(%rbp)
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	movq	%rcx, -1120(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm9
	vmovsd	.LC9(%rip), %xmm11
	vsubsd	-1096(%rbp), %xmm9, %xmm10
	leal	(%r15,%r15), %r10d
	movq	-1128(%rbp), %r9
	vcomisd	%xmm10, %xmm11
	movq	-1120(%rbp), %r15
	ja	.L10
	sarl	%r10d
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm10, -1112(%rbp)
	movl	%r10d, %r15d
	call	gethostname
	movabsq	$7308041938491629923, %r11
	cmpq	%r11, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L115
.L26:
	vmovsd	.LC3(%rip), %xmm12
.L28:
	vxorps	%xmm13, %xmm13, %xmm13
	vcvtsi2sdq	%rbx, %xmm13, %xmm4
	vcvtsi2sdl	%r15d, %xmm13, %xmm14
	vmovsd	.LC11(%rip), %xmm8
	movslq	%r15d, %rdi
	vmulsd	.LC10(%rip), %xmm4, %xmm6
	vmulsd	%xmm4, %xmm14, %xmm0
	vmulsd	.LC12(%rip), %xmm14, %xmm3
	imulq	%rbx, %rdi
	vmulsd	%xmm12, %xmm1, %xmm12
	vmulsd	%xmm6, %xmm14, %xmm14
	vdivsd	%xmm1, %xmm0, %xmm2
	vmulsd	%xmm4, %xmm3, %xmm7
	vcvtsi2sdq	%rdi, %xmm13, %xmm13
	vmovsd	.LC13(%rip), %xmm9
	movq	%rbx, %rdx
	movl	%r15d, %esi
	vmulsd	.LC14(%rip), %xmm13, %xmm15
	movl	$.LC16, %edi
	movl	$6, %eax
	vdivsd	%xmm1, %xmm7, %xmm10
	vdivsd	%xmm8, %xmm2, %xmm5
	vmulsd	.LC15(%rip), %xmm14, %xmm2
	vmulsd	%xmm9, %xmm10, %xmm11
	vmulsd	%xmm9, %xmm11, %xmm4
	vdivsd	%xmm8, %xmm6, %xmm0
	vdivsd	%xmm8, %xmm5, %xmm5
	vdivsd	%xmm15, %xmm12, %xmm3
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	addq	$1096, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	movq	%r14, %rdi
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%r13), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	free
	.p2align 4,,10
	.p2align 3
.L114:
	.cfi_restore_state
	movq	%rdi, -1128(%rbp)
	movq	%r12, %rdi
	movl	%r11d, -1132(%rbp)
	movq	%rcx, -1120(%rbp)
	vzeroupper
	call	dummy
	movl	-1132(%rbp), %r11d
	movq	-1128(%rbp), %rdi
	movq	-1120(%rbp), %rcx
	jmp	.L16
.L115:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm12
	jne	.L26
	jmp	.L28
.L113:
	vzeroupper
	jmp	.L14
.L112:
	vmovapd	%ymm1, 0(%r13)
	vmovapd	%ymm0, (%r14)
	movl	$32, %esi
	jmp	.L84
.L29:
	xorl	%eax, %eax
	jmp	.L11
	.cfi_endproc
.LFE25:
	.size	copy, .-copy
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"COPY a[i] = b[i] + c[i], 8 byte/it, 0 Flop/it"
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
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	8(%rsp), %xmm3, %xmm0
	leaq	16(%rsp), %rsi
	movl	$.LC19, %edi
	movl	$1, %eax
	vdivsd	.LC18(%rip), %xmm0, %xmm0
	call	printf
	movl	$.LC20, %edi
	call	puts
	movl	$20, %eax
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	movq	.LC21(%rip), %rdx
	vmovq	%rdx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %edi
	andl	$-64, %edi
	movslq	%edi, %rdi
	call	copy
.L117:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	movq	.LC21(%rip), %rcx
	vmovq	%rcx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %esi
	andl	$-64, %esi
	movslq	%esi, %rdi
	call	copy
	leal	1(%rbx), %r8d
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdl	%r8d, %xmm4, %xmm1
	movq	.LC21(%rip), %r9
	vmovq	%r9, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r10d
	andl	$-64, %r10d
	movslq	%r10d, %rdi
	call	copy
	leal	2(%rbx), %r11d
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%r11d, %xmm5, %xmm1
	movq	.LC21(%rip), %rax
	vmovq	%rax, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %edx
	andl	$-64, %edx
	movslq	%edx, %rdi
	call	copy
	vxorpd	%xmm6, %xmm6, %xmm6
	leal	3(%rbx), %edi
	vcvtsi2sdl	%edi, %xmm6, %xmm1
	movq	.LC21(%rip), %rcx
	vmovq	%rcx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %esi
	andl	$-64, %esi
	movslq	%esi, %rdi
	call	copy
	leal	4(%rbx), %r8d
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%r8d, %xmm7, %xmm1
	movq	.LC21(%rip), %r9
	addl	$5, %ebx
	vmovq	%r9, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r10d
	andl	$-64, %r10d
	movslq	%r10d, %rdi
	call	copy
	cmpl	$36, %ebx
	jne	.L117
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
.LC2:
	.long	536870912
	.long	1105371231
	.align 8
.LC3:
	.long	3221225472
	.long	1105224746
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC4:
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.align 32
.LC5:
	.long	1524087310
	.long	1055485069
	.long	1524087310
	.long	1055485069
	.long	1524087310
	.long	1055485069
	.long	1524087310
	.long	1055485069
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	1907715710
	.long	1048610426
	.align 8
.LC7:
	.long	1524087310
	.long	1055485069
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
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
