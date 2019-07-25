	.file	"scale.c"
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
.LC14:
	.string	"%12.1f | %11.8f | %9.3f | %7.2f | %7.1f | %7.1f | %6d | %4ld \n"
	.text
	.p2align 4
	.globl	scale
	.type	scale, @function
scale:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movq	%rdi, %r15
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	pushq	%rbx
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	leaq	0(,%rdi,8), %rbx
	movq	%rbx, %rsi
	subq	$1096, %rsp
	movl	$64, %edi
	vmovsd	%xmm0, -1112(%rbp)
	call	aligned_alloc
	movq	%rbx, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movq	%rax, %r13
	testq	%r15, %r15
	leaq	-1(%r15), %rax
	vmovsd	-1112(%rbp), %xmm10
	movq	%rax, -1112(%rbp)
	jle	.L14
	cmpq	$2, %rax
	jbe	.L29
	movq	%r15, %rdx
	shrq	$2, %rdx
	salq	$5, %rdx
	leaq	(%rdx,%r12), %rcx
	subq	$32, %rdx
	shrq	$5, %rdx
	incq	%rdx
	vmovapd	.LC4(%rip), %ymm0
	movq	%r12, %rsi
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
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L83:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L82:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L81:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L80:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L79:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
	cmpq	%rcx, %rsi
	je	.L109
.L12:
	vmovapd	%ymm0, (%rsi)
	vmovapd	%ymm0, 32(%rsi)
	vmovapd	%ymm0, 64(%rsi)
	vmovapd	%ymm0, 96(%rsi)
	vmovapd	%ymm0, 128(%rsi)
	vmovapd	%ymm0, 160(%rsi)
	vmovapd	%ymm0, 192(%rsi)
	vmovapd	%ymm0, 224(%rsi)
	addq	$256, %rsi
	cmpq	%rcx, %rsi
	jne	.L12
.L109:
	movq	%r15, %rdi
	andq	$-4, %rdi
	movl	%edi, %eax
	cmpq	%rdi, %r15
	je	.L113
	vzeroupper
.L11:
	vmovsd	.LC5(%rip), %xmm1
	leal	1(%rax), %r9d
	movslq	%eax, %r8
	movslq	%r9d, %r10
	vmovsd	%xmm1, (%r12,%r8,8)
	cmpq	%r10, %r15
	jle	.L14
	addl	$2, %eax
	cltq
	vmovsd	%xmm1, (%r12,%r10,8)
	cmpq	%rax, %r15
	jle	.L14
	vmovsd	%xmm1, (%r12,%rax,8)
.L14:
	movq	%r15, %r10
	shrq	$2, %r10
	movq	%r15, %rbx
	salq	$5, %r10
	andq	$-4, %rbx
	movl	$1, %r9d
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	movl	%r9d, -1128(%rbp)
	movq	%r10, -1120(%rbp)
	vmovsd	%xmm10, -1136(%rbp)
	call	timing
	vmovsd	-1136(%rbp), %xmm2
	movl	-1128(%rbp), %r11d
	movq	-1120(%rbp), %rcx
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L19:
	vxorpd	%xmm5, %xmm5, %xmm5
	vcomisd	(%r12), %xmm5
	ja	.L114
.L16:
	testq	%r15, %r15
	jle	.L24
	cmpq	$2, -1112(%rbp)
	jbe	.L30
	leaq	-32(%rcx), %rdx
	shrq	$5, %rdx
	incq	%rdx
	vbroadcastsd	%xmm2, %ymm3
	xorl	%esi, %esi
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
	vmulpd	(%r12), %ymm3, %ymm4
	movl	$32, %esi
	vmovapd	%ymm4, 0(%r13)
.L90:
	vmulpd	(%r12,%rsi), %ymm3, %ymm6
	vmovapd	%ymm6, 0(%r13,%rsi)
	addq	$32, %rsi
.L89:
	vmulpd	(%r12,%rsi), %ymm3, %ymm7
	vmovapd	%ymm7, 0(%r13,%rsi)
	addq	$32, %rsi
.L88:
	vmulpd	(%r12,%rsi), %ymm3, %ymm8
	vmovapd	%ymm8, 0(%r13,%rsi)
	addq	$32, %rsi
.L87:
	vmulpd	(%r12,%rsi), %ymm3, %ymm9
	vmovapd	%ymm9, 0(%r13,%rsi)
	addq	$32, %rsi
.L86:
	vmulpd	(%r12,%rsi), %ymm3, %ymm10
	vmovapd	%ymm10, 0(%r13,%rsi)
	addq	$32, %rsi
.L85:
	vmulpd	(%r12,%rsi), %ymm3, %ymm11
	vmovapd	%ymm11, 0(%r13,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	je	.L108
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L22:
	vmulpd	(%r12,%rsi), %ymm3, %ymm12
	vmulpd	32(%r12,%rsi), %ymm3, %ymm13
	vmulpd	64(%r12,%rsi), %ymm3, %ymm14
	vmulpd	96(%r12,%rsi), %ymm3, %ymm15
	vmulpd	128(%r12,%rsi), %ymm3, %ymm0
	vmulpd	160(%r12,%rsi), %ymm3, %ymm1
	vmulpd	192(%r12,%rsi), %ymm3, %ymm5
	vmulpd	224(%r12,%rsi), %ymm3, %ymm4
	vmovapd	%ymm12, 0(%r13,%rsi)
	vmovapd	%ymm13, 32(%r13,%rsi)
	vmovapd	%ymm14, 64(%r13,%rsi)
	vmovapd	%ymm15, 96(%r13,%rsi)
	vmovapd	%ymm0, 128(%r13,%rsi)
	vmovapd	%ymm1, 160(%r13,%rsi)
	vmovapd	%ymm5, 192(%r13,%rsi)
	vmovapd	%ymm4, 224(%r13,%rsi)
	addq	$256, %rsi
	cmpq	%rsi, %rcx
	jne	.L22
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L108:
	movq	%rbx, %rdi
	cmpq	%rbx, %r15
	je	.L24
.L21:
	vmulsd	(%r12,%rdi,8), %xmm2, %xmm3
	leaq	1(%rdi), %r8
	leaq	0(,%rdi,8), %rax
	vmovsd	%xmm3, 0(%r13,%rdi,8)
	cmpq	%r15, %r8
	jge	.L24
	vmulsd	8(%r12,%rax), %xmm2, %xmm6
	addq	$2, %rdi
	vmovsd	%xmm6, 8(%r13,%rax)
	cmpq	%r15, %rdi
	jge	.L24
	vmulsd	16(%r12,%rax), %xmm2, %xmm7
	vmovsd	%xmm7, 16(%r13,%rax)
.L24:
	incl	%r14d
	cmpl	%r11d, %r14d
	jne	.L19
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	movq	%rcx, -1120(%rbp)
	vmovsd	%xmm2, -1128(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm2
	vmovsd	.LC7(%rip), %xmm9
	vsubsd	-1096(%rbp), %xmm2, %xmm8
	movq	-1120(%rbp), %r10
	vmovsd	-1128(%rbp), %xmm10
	vcomisd	%xmm8, %xmm9
	leal	(%r14,%r14), %r9d
	ja	.L10
	sarl	%r9d
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	movabsq	$7308041938491629923, %r14
	vmovsd	%xmm8, -1112(%rbp)
	movl	%r9d, %ebx
	call	gethostname
	cmpq	%r14, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L115
.L26:
	vmovsd	.LC3(%rip), %xmm11
.L28:
	vxorps	%xmm12, %xmm12, %xmm12
	vcvtsi2sdq	%r15, %xmm12, %xmm4
	vcvtsi2sdl	%ebx, %xmm12, %xmm13
	vmovsd	.LC9(%rip), %xmm6
	movslq	%ebx, %r11
	vmulsd	.LC8(%rip), %xmm4, %xmm15
	vmulsd	%xmm4, %xmm13, %xmm0
	vmulsd	.LC10(%rip), %xmm13, %xmm3
	imulq	%r15, %r11
	vmulsd	%xmm11, %xmm1, %xmm11
	vmulsd	%xmm15, %xmm13, %xmm13
	vdivsd	%xmm1, %xmm0, %xmm5
	vmulsd	%xmm4, %xmm3, %xmm7
	vcvtsi2sdq	%r11, %xmm12, %xmm12
	vmovsd	.LC11(%rip), %xmm9
	movq	%r15, %rdx
	movl	%ebx, %esi
	vmulsd	.LC12(%rip), %xmm12, %xmm14
	movl	$.LC14, %edi
	movl	$6, %eax
	vdivsd	%xmm1, %xmm7, %xmm2
	vmulsd	.LC13(%rip), %xmm13, %xmm7
	vdivsd	%xmm6, %xmm5, %xmm8
	vmulsd	%xmm9, %xmm2, %xmm10
	vmulsd	%xmm9, %xmm10, %xmm4
	vdivsd	%xmm6, %xmm15, %xmm0
	vdivsd	%xmm6, %xmm8, %xmm5
	vdivsd	%xmm14, %xmm11, %xmm3
	vdivsd	%xmm1, %xmm7, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	addq	$1096, %rsp
	popq	%rbx
	popq	%r12
	movq	%r13, %rdi
	popq	%r13
	.cfi_remember_state
	.cfi_def_cfa 13, 0
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
	movq	%r12, %rdi
	movl	%r11d, -1128(%rbp)
	movq	%rcx, -1120(%rbp)
	vmovsd	%xmm2, -1136(%rbp)
	vzeroupper
	call	dummy
	vmovsd	-1136(%rbp), %xmm2
	movl	-1128(%rbp), %r11d
	movq	-1120(%rbp), %rcx
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L30:
	xorl	%edi, %edi
	jmp	.L21
.L115:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm11
	jne	.L26
	jmp	.L28
.L113:
	vzeroupper
	jmp	.L14
.L112:
	vmovapd	%ymm0, (%r12)
	leaq	32(%r12), %rsi
	jmp	.L84
.L29:
	xorl	%eax, %eax
	jmp	.L11
	.cfi_endproc
.LFE25:
	.size	scale, .-scale
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"SCALE b[i] = s * a[i], 16 byte/it, 1 Flop/it"
	.align 8
.LC17:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
	.align 8
.LC18:
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
	movl	$.LC15, %edi
	call	puts
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	8(%rsp), %xmm3, %xmm0
	leaq	16(%rsp), %rsi
	movl	$.LC17, %edi
	movl	$1, %eax
	vdivsd	.LC16(%rip), %xmm0, %xmm0
	call	printf
	movl	$.LC18, %edi
	call	puts
	movl	$20, %eax
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	movq	.LC19(%rip), %rdx
	vmovq	%rdx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %edi
	movq	.LC20(%rip), %rcx
	vmovq	%rcx, %xmm0
	andl	$-64, %edi
	movslq	%edi, %rdi
	call	scale
.L117:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	movq	.LC19(%rip), %rsi
	vmovq	%rsi, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r8d
	movq	.LC20(%rip), %r9
	vmovq	%r9, %xmm0
	andl	$-64, %r8d
	movslq	%r8d, %rdi
	call	scale
	vxorpd	%xmm4, %xmm4, %xmm4
	leal	1(%rbx), %r10d
	vcvtsi2sdl	%r10d, %xmm4, %xmm1
	movq	.LC19(%rip), %r11
	vmovq	%r11, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %eax
	movq	.LC20(%rip), %rdx
	vmovq	%rdx, %xmm0
	andl	$-64, %eax
	movslq	%eax, %rdi
	call	scale
	vxorpd	%xmm5, %xmm5, %xmm5
	leal	2(%rbx), %edi
	vcvtsi2sdl	%edi, %xmm5, %xmm1
	movq	.LC19(%rip), %rcx
	vmovq	%rcx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %esi
	movq	.LC20(%rip), %r8
	vmovq	%r8, %xmm0
	andl	$-64, %esi
	movslq	%esi, %rdi
	call	scale
	leal	3(%rbx), %r9d
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdl	%r9d, %xmm6, %xmm1
	movq	.LC19(%rip), %r10
	vmovq	%r10, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r11d
	movq	.LC20(%rip), %rax
	vmovq	%rax, %xmm0
	andl	$-64, %r11d
	movslq	%r11d, %rdi
	call	scale
	leal	4(%rbx), %edx
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%edx, %xmm7, %xmm1
	movq	.LC19(%rip), %rdi
	addl	$5, %ebx
	vmovq	%rdi, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %ecx
	movq	.LC20(%rip), %rsi
	vmovq	%rsi, %xmm0
	andl	$-64, %ecx
	movslq	%ecx, %rdi
	call	scale
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
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	1907715710
	.long	1048610426
	.align 8
.LC7:
	.long	2576980378
	.long	1070176665
	.align 8
.LC8:
	.long	0
	.long	1075838976
	.align 8
.LC9:
	.long	0
	.long	1083129856
	.align 8
.LC10:
	.long	0
	.long	1077936128
	.align 8
.LC11:
	.long	0
	.long	1062207488
	.align 8
.LC12:
	.long	0
	.long	1069547520
	.align 8
.LC13:
	.long	2696277389
	.long	1051772663
	.align 8
.LC16:
	.long	0
	.long	1104006501
	.align 8
.LC19:
	.long	3435973837
	.long	1073007820
	.align 8
.LC20:
	.long	981314128
	.long	1072935710
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
