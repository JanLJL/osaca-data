	.file	"triad.c"
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
.LC18:
	.string	"%12.1f | %11.8f | %9.3f | %7.2f | %7.1f | %7.1f | %6d | %4ld \n"
	.text
	.p2align 4
	.globl	triad
	.type	triad, @function
triad:
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
	leaq	0(,%rdi,8), %r15
	movq	%r15, %rsi
	pushq	%r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	pushq	%rbx
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movq	%rdi, %rbx
	movl	$64, %edi
	subq	$1096, %rsp
	call	aligned_alloc
	movq	%r15, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movq	%r15, %rsi
	movl	$64, %edi
	movq	%rax, %r13
	call	aligned_alloc
	movq	%r15, %rsi
	movl	$64, %edi
	movq	%rax, %r14
	call	aligned_alloc
	movq	%rax, %r15
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
	vmovapd	.LC4(%rip), %ymm2
	vmovapd	.LC5(%rip), %ymm1
	vmovapd	.LC6(%rip), %ymm0
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
	vmovapd	%ymm2, 0(%r13,%rsi)
	vmovapd	%ymm1, (%r14,%rsi)
	vmovapd	%ymm0, (%r15,%rsi)
	addq	$32, %rsi
.L83:
	vmovapd	%ymm2, 0(%r13,%rsi)
	vmovapd	%ymm1, (%r14,%rsi)
	vmovapd	%ymm0, (%r15,%rsi)
	addq	$32, %rsi
.L82:
	vmovapd	%ymm2, 0(%r13,%rsi)
	vmovapd	%ymm1, (%r14,%rsi)
	vmovapd	%ymm0, (%r15,%rsi)
	addq	$32, %rsi
.L81:
	vmovapd	%ymm2, 0(%r13,%rsi)
	vmovapd	%ymm1, (%r14,%rsi)
	vmovapd	%ymm0, (%r15,%rsi)
	addq	$32, %rsi
.L80:
	vmovapd	%ymm2, 0(%r13,%rsi)
	vmovapd	%ymm1, (%r14,%rsi)
	vmovapd	%ymm0, (%r15,%rsi)
	addq	$32, %rsi
.L79:
	vmovapd	%ymm2, 0(%r13,%rsi)
	vmovapd	%ymm1, (%r14,%rsi)
	vmovapd	%ymm0, (%r15,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	je	.L109
.L12:
	vmovapd	%ymm2, 0(%r13,%rsi)
	vmovapd	%ymm1, (%r14,%rsi)
	vmovapd	%ymm0, (%r15,%rsi)
	vmovapd	%ymm2, 32(%r13,%rsi)
	vmovapd	%ymm1, 32(%r14,%rsi)
	vmovapd	%ymm0, 32(%r15,%rsi)
	vmovapd	%ymm2, 64(%r13,%rsi)
	vmovapd	%ymm1, 64(%r14,%rsi)
	vmovapd	%ymm0, 64(%r15,%rsi)
	vmovapd	%ymm2, 96(%r13,%rsi)
	vmovapd	%ymm1, 96(%r14,%rsi)
	vmovapd	%ymm0, 96(%r15,%rsi)
	vmovapd	%ymm2, 128(%r13,%rsi)
	vmovapd	%ymm1, 128(%r14,%rsi)
	vmovapd	%ymm0, 128(%r15,%rsi)
	vmovapd	%ymm2, 160(%r13,%rsi)
	vmovapd	%ymm1, 160(%r14,%rsi)
	vmovapd	%ymm0, 160(%r15,%rsi)
	vmovapd	%ymm2, 192(%r13,%rsi)
	vmovapd	%ymm1, 192(%r14,%rsi)
	vmovapd	%ymm0, 192(%r15,%rsi)
	vmovapd	%ymm2, 224(%r13,%rsi)
	vmovapd	%ymm1, 224(%r14,%rsi)
	vmovapd	%ymm0, 224(%r15,%rsi)
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
	vmovsd	.LC7(%rip), %xmm3
	vmovsd	.LC8(%rip), %xmm4
	vmovsd	.LC9(%rip), %xmm5
	leal	1(%rax), %r9d
	movslq	%eax, %r8
	movslq	%r9d, %r10
	vmovsd	%xmm3, 0(%r13,%r8,8)
	vmovsd	%xmm4, (%r14,%r8,8)
	vmovsd	%xmm5, (%r15,%r8,8)
	cmpq	%r10, %rbx
	jle	.L14
	addl	$2, %eax
	cltq
	vmovsd	%xmm3, 0(%r13,%r10,8)
	vmovsd	%xmm4, (%r14,%r10,8)
	vmovsd	%xmm5, (%r15,%r10,8)
	cmpq	%rax, %rbx
	jle	.L14
	vmovsd	%xmm3, 0(%r13,%rax,8)
	vmovsd	%xmm4, (%r14,%rax,8)
	vmovsd	%xmm5, (%r15,%rax,8)
.L14:
	movq	%rbx, %r11
	shrq	$2, %r11
	movq	%rbx, %rdi
	salq	$5, %r11
	andq	$-4, %rdi
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rdi, -1128(%rbp)
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	movl	%ecx, -1132(%rbp)
	movq	%r11, -1120(%rbp)
	call	timing
	movl	-1132(%rbp), %r11d
	movq	-1128(%rbp), %rdi
	movq	-1120(%rbp), %r8
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L19:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcomisd	(%r12), %xmm6
	ja	.L114
.L16:
	testq	%rbx, %rbx
	jle	.L24
	xorl	%eax, %eax
	cmpq	$2, -1112(%rbp)
	jbe	.L21
	leaq	-32(%r8), %rdx
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
	vmovapd	(%r14), %ymm7
	vmovapd	0(%r13), %ymm8
	movl	$32, %eax
	vfmadd132pd	(%r15), %ymm8, %ymm7
	vmovapd	%ymm7, (%r12)
.L90:
	vmovapd	(%r14,%rax), %ymm9
	vmovapd	0(%r13,%rax), %ymm10
	vfmadd132pd	(%r15,%rax), %ymm10, %ymm9
	vmovapd	%ymm9, (%r12,%rax)
	addq	$32, %rax
.L89:
	vmovapd	(%r14,%rax), %ymm11
	vmovapd	0(%r13,%rax), %ymm12
	vfmadd132pd	(%r15,%rax), %ymm12, %ymm11
	vmovapd	%ymm11, (%r12,%rax)
	addq	$32, %rax
.L88:
	vmovapd	(%r14,%rax), %ymm13
	vmovapd	0(%r13,%rax), %ymm14
	vfmadd132pd	(%r15,%rax), %ymm14, %ymm13
	vmovapd	%ymm13, (%r12,%rax)
	addq	$32, %rax
.L87:
	vmovapd	(%r14,%rax), %ymm15
	vmovapd	0(%r13,%rax), %ymm2
	vfmadd132pd	(%r15,%rax), %ymm2, %ymm15
	vmovapd	%ymm15, (%r12,%rax)
	addq	$32, %rax
.L86:
	vmovapd	(%r14,%rax), %ymm1
	vmovapd	0(%r13,%rax), %ymm0
	vfmadd132pd	(%r15,%rax), %ymm0, %ymm1
	vmovapd	%ymm1, (%r12,%rax)
	addq	$32, %rax
.L85:
	vmovapd	(%r14,%rax), %ymm3
	vmovapd	0(%r13,%rax), %ymm4
	vfmadd132pd	(%r15,%rax), %ymm4, %ymm3
	vmovapd	%ymm3, (%r12,%rax)
	addq	$32, %rax
	cmpq	%rax, %r8
	je	.L108
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L22:
	vmovapd	(%r14,%rax), %ymm5
	vmovapd	0(%r13,%rax), %ymm6
	vmovapd	32(%r14,%rax), %ymm7
	vmovapd	32(%r13,%rax), %ymm8
	vmovapd	64(%r14,%rax), %ymm9
	vmovapd	64(%r13,%rax), %ymm10
	vmovapd	96(%r14,%rax), %ymm11
	vmovapd	96(%r13,%rax), %ymm12
	vmovapd	128(%r14,%rax), %ymm13
	vmovapd	128(%r13,%rax), %ymm14
	vmovapd	160(%r14,%rax), %ymm15
	vmovapd	160(%r13,%rax), %ymm2
	vmovapd	192(%r14,%rax), %ymm0
	vmovapd	192(%r13,%rax), %ymm1
	vmovapd	224(%r14,%rax), %ymm3
	vmovapd	224(%r13,%rax), %ymm4
	vfmadd132pd	(%r15,%rax), %ymm6, %ymm5
	vfmadd132pd	32(%r15,%rax), %ymm8, %ymm7
	vfmadd132pd	64(%r15,%rax), %ymm10, %ymm9
	vfmadd132pd	96(%r15,%rax), %ymm12, %ymm11
	vfmadd132pd	128(%r15,%rax), %ymm14, %ymm13
	vfmadd132pd	160(%r15,%rax), %ymm2, %ymm15
	vfmadd132pd	192(%r15,%rax), %ymm1, %ymm0
	vfmadd132pd	224(%r15,%rax), %ymm4, %ymm3
	vmovapd	%ymm5, (%r12,%rax)
	vmovapd	%ymm7, 32(%r12,%rax)
	vmovapd	%ymm9, 64(%r12,%rax)
	vmovapd	%ymm11, 96(%r12,%rax)
	vmovapd	%ymm13, 128(%r12,%rax)
	vmovapd	%ymm15, 160(%r12,%rax)
	vmovapd	%ymm0, 192(%r12,%rax)
	vmovapd	%ymm3, 224(%r12,%rax)
	addq	$256, %rax
	cmpq	%rax, %r8
	jne	.L22
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L108:
	cmpq	%rdi, %rbx
	je	.L24
	movq	%rdi, %rax
.L21:
	vmovsd	(%r14,%rax,8), %xmm5
	vmovsd	0(%r13,%rax,8), %xmm6
	leaq	0(,%rax,8), %r9
	vfmadd132sd	(%r15,%rax,8), %xmm6, %xmm5
	leaq	1(%rax), %rsi
	vmovsd	%xmm5, (%r12,%r9)
	cmpq	%rbx, %rsi
	jge	.L24
	vmovsd	8(%r14,%r9), %xmm7
	vmovsd	8(%r13,%r9), %xmm8
	addq	$2, %rax
	vfmadd132sd	8(%r15,%r9), %xmm8, %xmm7
	vmovsd	%xmm7, 8(%r12,%r9)
	cmpq	%rax, %rbx
	jle	.L24
	vmovsd	16(%r15,%r9), %xmm9
	vmovsd	16(%r13,%r9), %xmm10
	vfmadd132sd	16(%r14,%r9), %xmm10, %xmm9
	vmovsd	%xmm9, 16(%r12,%r9)
.L24:
	incl	%ecx
	cmpl	%r11d, %ecx
	jne	.L19
	movq	%rdi, -1128(%rbp)
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	movl	%ecx, -1132(%rbp)
	movq	%r8, -1120(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm11
	vmovsd	.LC11(%rip), %xmm13
	vsubsd	-1096(%rbp), %xmm11, %xmm12
	movl	-1132(%rbp), %r10d
	movq	-1120(%rbp), %r11
	vcomisd	%xmm12, %xmm13
	movq	-1128(%rbp), %rdi
	leal	(%r10,%r10), %ecx
	ja	.L10
	sarl	%ecx
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm12, -1112(%rbp)
	movl	%ecx, %r15d
	call	gethostname
	movabsq	$7308041938491629923, %r8
	cmpq	%r8, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L115
.L26:
	vmovsd	.LC3(%rip), %xmm14
.L28:
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2sdq	%rbx, %xmm15, %xmm4
	vcvtsi2sdl	%r15d, %xmm15, %xmm0
	vmovsd	.LC13(%rip), %xmm8
	movslq	%r15d, %rdx
	vmulsd	.LC12(%rip), %xmm4, %xmm6
	vmulsd	%xmm4, %xmm0, %xmm3
	vmulsd	.LC14(%rip), %xmm0, %xmm7
	imulq	%rbx, %rdx
	vmulsd	%xmm14, %xmm1, %xmm14
	vmulsd	%xmm6, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm3, %xmm5
	vmulsd	%xmm4, %xmm7, %xmm9
	vcvtsi2sdq	%rdx, %xmm15, %xmm15
	vmovsd	.LC15(%rip), %xmm12
	vmulsd	.LC17(%rip), %xmm0, %xmm2
	movq	%rbx, %rdx
	vmulsd	.LC16(%rip), %xmm15, %xmm3
	movl	%r15d, %esi
	movl	$.LC18, %edi
	movl	$6, %eax
	vdivsd	%xmm1, %xmm9, %xmm11
	vdivsd	%xmm8, %xmm5, %xmm10
	vmulsd	%xmm12, %xmm11, %xmm13
	vmulsd	%xmm12, %xmm13, %xmm4
	vdivsd	%xmm8, %xmm6, %xmm0
	vdivsd	%xmm8, %xmm10, %xmm5
	vdivsd	%xmm3, %xmm14, %xmm3
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
	movl	%ecx, -1136(%rbp)
	movl	%r11d, -1132(%rbp)
	movq	%r8, -1120(%rbp)
	vzeroupper
	call	dummy
	movl	-1136(%rbp), %ecx
	movl	-1132(%rbp), %r11d
	movq	-1128(%rbp), %rdi
	movq	-1120(%rbp), %r8
	jmp	.L16
.L115:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm14
	jne	.L26
	jmp	.L28
.L113:
	vzeroupper
	jmp	.L14
.L112:
	vmovapd	%ymm2, 0(%r13)
	vmovapd	%ymm1, (%r14)
	vmovapd	%ymm0, (%r15)
	movl	$32, %esi
	jmp	.L84
.L29:
	xorl	%eax, %eax
	jmp	.L11
	.cfi_endproc
.LFE25:
	.size	triad, .-triad
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"TRIAD a[i] = b[i] + c[i] * d[i], 32 byte/it, 2 Flop/it"
	.align 8
.LC21:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
	.align 8
.LC22:
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
	movl	$.LC19, %edi
	call	puts
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	8(%rsp), %xmm3, %xmm0
	leaq	16(%rsp), %rsi
	movl	$.LC21, %edi
	movl	$1, %eax
	vdivsd	.LC20(%rip), %xmm0, %xmm0
	call	printf
	movl	$.LC22, %edi
	call	puts
	movl	$20, %eax
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdl	%eax, %xmm1, %xmm1
	movq	.LC23(%rip), %rdx
	vmovq	%rdx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %edi
	andl	$-64, %edi
	movslq	%edi, %rdi
	call	triad
.L117:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	movq	.LC23(%rip), %rcx
	vmovq	%rcx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %esi
	andl	$-64, %esi
	movslq	%esi, %rdi
	call	triad
	leal	1(%rbx), %r8d
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdl	%r8d, %xmm4, %xmm1
	movq	.LC23(%rip), %r9
	vmovq	%r9, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r10d
	andl	$-64, %r10d
	movslq	%r10d, %rdi
	call	triad
	leal	2(%rbx), %r11d
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%r11d, %xmm5, %xmm1
	movq	.LC23(%rip), %rax
	vmovq	%rax, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %edx
	andl	$-64, %edx
	movslq	%edx, %rdi
	call	triad
	vxorpd	%xmm6, %xmm6, %xmm6
	leal	3(%rbx), %edi
	vcvtsi2sdl	%edi, %xmm6, %xmm1
	movq	.LC23(%rip), %rcx
	vmovq	%rcx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %esi
	andl	$-64, %esi
	movslq	%esi, %rdi
	call	triad
	leal	4(%rbx), %r8d
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%r8d, %xmm7, %xmm1
	movq	.LC23(%rip), %r9
	addl	$5, %ebx
	vmovq	%r9, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r10d
	andl	$-64, %r10d
	movslq	%r10d, %rdi
	call	triad
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
	.align 32
.LC6:
	.long	619800931
	.long	1057026584
	.long	619800931
	.long	1057026584
	.long	619800931
	.long	1057026584
	.long	619800931
	.long	1057026584
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	1907715710
	.long	1048610426
	.align 8
.LC8:
	.long	1524087310
	.long	1055485069
	.align 8
.LC9:
	.long	619800931
	.long	1057026584
	.align 8
.LC11:
	.long	2576980378
	.long	1070176665
	.align 8
.LC12:
	.long	0
	.long	1075838976
	.align 8
.LC13:
	.long	0
	.long	1083129856
	.align 8
.LC14:
	.long	0
	.long	1077936128
	.align 8
.LC15:
	.long	0
	.long	1062207488
	.align 8
.LC16:
	.long	0
	.long	1069547520
	.align 8
.LC17:
	.long	2696277389
	.long	1051772663
	.align 8
.LC20:
	.long	0
	.long	1104006501
	.align 8
.LC23:
	.long	3435973837
	.long	1073007820
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
