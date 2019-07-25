	.file	"3d7pt.c"
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
	.globl	stencil
	.type	stencil, @function
stencil:
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
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movl	%edi, %r12d
	imull	%esi, %r12d
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movl	%edi, %ebx
	imull	%edx, %r12d
	subq	$1256, %rsp
	movl	%edi, -1292(%rbp)
	movslq	%r12d, %r15
	salq	$3, %r15
	movl	%esi, -1280(%rbp)
	movl	$64, %edi
	movq	%r15, %rsi
	movl	%edx, -1276(%rbp)
	vmovsd	%xmm0, -1120(%rbp)
	vmovsd	%xmm1, -1112(%rbp)
	call	aligned_alloc
	movq	%r15, %rsi
	movl	$64, %edi
	movq	%rax, %r14
	call	aligned_alloc
	testl	%ebx, %ebx
	movq	%rax, -1144(%rbp)
	vmovsd	-1112(%rbp), %xmm10
	vmovsd	-1120(%rbp), %xmm11
	jle	.L120
	movl	-1280(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L120
	movslq	-1276(%rbp), %r13
	movl	-1276(%rbp), %edx
	movq	%r13, %rdi
	leal	-1(%r13), %esi
	testl	%edx, %edx
	jle	.L9
	movl	-1280(%rbp), %esi
	movl	%r13d, %ebx
	imull	%r13d, %esi
	shrl	$2, %ebx
	andl	$-4, %edi
	vmovsd	.LC5(%rip), %xmm1
	vmovapd	.LC4(%rip), %ymm0
	movl	%esi, -1112(%rbp)
	leaq	0(,%r13,8), %r15
	leal	-1(%r13), %esi
	salq	$5, %rbx
	movl	%edi, %r12d
	xorl	%r8d, %r8d
	xorl	%r11d, %r11d
.L10:
	movslq	%r8d, %r9
	leaq	(%r14,%r9,8), %rcx
	movl	%r8d, %edi
	xorl	%r9d, %r9d
.L16:
	cmpl	$2, %esi
	jbe	.L121
	leaq	-32(%rbx), %rdx
	shrq	$5, %rdx
	incq	%rdx
	leaq	(%rbx,%rcx), %r10
	movq	%rcx, %rax
	andl	$7, %edx
	je	.L11
	cmpq	$1, %rdx
	je	.L82
	cmpq	$2, %rdx
	je	.L83
	cmpq	$3, %rdx
	je	.L84
	cmpq	$4, %rdx
	je	.L85
	cmpq	$5, %rdx
	je	.L86
	cmpq	$6, %rdx
	je	.L87
	vmovupd	%ymm0, (%rcx)
	leaq	32(%rcx), %rax
.L87:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
.L86:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
.L85:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
.L84:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
.L83:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
.L82:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%r10, %rax
	je	.L111
.L11:
	vmovupd	%ymm0, (%rax)
	vmovupd	%ymm0, 32(%rax)
	vmovupd	%ymm0, 64(%rax)
	vmovupd	%ymm0, 96(%rax)
	vmovupd	%ymm0, 128(%rax)
	vmovupd	%ymm0, 160(%rax)
	vmovupd	%ymm0, 192(%rax)
	vmovupd	%ymm0, 224(%rax)
	addq	$256, %rax
	cmpq	%r10, %rax
	jne	.L11
.L111:
	movl	%r12d, %eax
	cmpl	-1276(%rbp), %r12d
	je	.L12
.L14:
	leal	(%rdi,%rax), %r10d
	movslq	%r10d, %rdx
	movl	-1276(%rbp), %r10d
	vmovsd	%xmm1, (%r14,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%edx, %r10d
	jle	.L12
	addl	%edi, %edx
	movslq	%edx, %rdx
	addl	$2, %eax
	vmovsd	%xmm1, (%r14,%rdx,8)
	cmpl	%eax, %r10d
	jle	.L12
	addl	%edi, %eax
	cltq
	vmovsd	%xmm1, (%r14,%rax,8)
.L12:
	incl	%r9d
	addl	-1276(%rbp), %edi
	addq	%r15, %rcx
	cmpl	%r9d, -1280(%rbp)
	jne	.L16
	incl	%r11d
	addl	-1112(%rbp), %r8d
	cmpl	%r11d, -1292(%rbp)
	jne	.L10
.L9:
	movl	-1280(%rbp), %ecx
	movl	-1276(%rbp), %r9d
	movl	-1292(%rbp), %eax
	imull	%ecx, %r9d
	movslq	%esi, %rdi
	decl	%eax
	leaq	-1(%rdi), %r11
	cltq
	movslq	%r9d, %r15
	movslq	%ecx, %rbx
	movq	%rax, -1232(%rbp)
	imulq	%r13, %rbx
	leal	-1(%rcx), %eax
	movq	%r15, %r12
	movq	%r11, %rcx
	movq	%r13, %rdx
	cltq
	movq	%r11, -1128(%rbp)
	movq	%rdi, %r8
	andq	$-4, %r11
	negq	%r12
	negq	%rdx
	shrq	$2, %rcx
	movq	%rax, -1152(%rbp)
	leaq	0(,%r13,8), %rsi
	subq	$2, %r8
	salq	$3, %r12
	leaq	0(,%r15,8), %r10
	salq	$3, %rdx
	salq	$5, %rcx
	leaq	1(%r11), %rax
	movq	%rdi, -1136(%rbp)
	movq	%rbx, -1272(%rbp)
	movq	%rsi, -1168(%rbp)
	movq	%r8, -1160(%rbp)
	movq	%r12, -1192(%rbp)
	movq	%r10, -1176(%rbp)
	movq	%rdx, -1200(%rbp)
	movq	%rcx, -1120(%rbp)
	movq	%r11, -1184(%rbp)
	movq	%rax, -1216(%rbp)
	movl	$1, -1288(%rbp)
	vbroadcastsd	%xmm11, %ymm12
.L29:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	vmovapd	%ymm12, -1264(%rbp)
	vmovsd	%xmm10, -1208(%rbp)
	vmovsd	%xmm11, -1112(%rbp)
	vzeroupper
	call	timing
	movl	$0, -1284(%rbp)
	vmovapd	-1264(%rbp), %ymm2
	vmovsd	-1208(%rbp), %xmm5
	vmovsd	-1112(%rbp), %xmm4
.L28:
	vmovsd	(%r14), %xmm6
	vxorpd	%xmm3, %xmm3, %xmm3
	vcomisd	%xmm3, %xmm6
	jbe	.L17
	movq	%r14, %rdi
	vmovapd	%ymm2, -1264(%rbp)
	vmovsd	%xmm5, -1208(%rbp)
	vmovsd	%xmm4, -1112(%rbp)
	vzeroupper
	call	dummy
	vmovapd	-1264(%rbp), %ymm2
	vmovsd	-1208(%rbp), %xmm5
	vmovsd	-1112(%rbp), %xmm4
.L17:
	cmpq	$1, -1232(%rbp)
	jle	.L19
	cmpq	$1, -1152(%rbp)
	jle	.L19
	movq	-1144(%rbp), %r9
	movq	-1272(%rbp), %rdi
	addq	$8, %r9
	cmpq	$1, -1136(%rbp)
	movq	%rdi, -1224(%rbp)
	movq	$1, -1264(%rbp)
	movq	%r9, -1208(%rbp)
	vbroadcastsd	%xmm5, %ymm3
	jle	.L19
	.p2align 4,,10
	.p2align 3
.L20:
	movq	-1224(%rbp), %rbx
	movq	$1, -1112(%rbp)
	leaq	(%rbx,%r13), %r12
	leaq	8(%r14,%r12,8), %rdx
	.p2align 4,,10
	.p2align 3
.L23:
	cmpq	$2, -1160(%rbp)
	jbe	.L122
	movq	-1168(%rbp), %rcx
	movq	-1176(%rbp), %rax
	leaq	(%rcx,%rdx), %rsi
	movq	-1120(%rbp), %rcx
	movq	-1192(%rbp), %r8
	subq	$32, %rcx
	movq	-1200(%rbp), %rdi
	leaq	(%rax,%rdx), %r11
	shrq	$5, %rcx
	movq	-1208(%rbp), %rax
	incq	%rcx
	leaq	(%r8,%rdx), %rbx
	leaq	-8(%rdx), %r10
	leaq	(%rdx,%rdi), %r8
	leaq	8(%rdx), %r9
	leaq	(%rax,%r12,8), %rdi
	xorl	%eax, %eax
	andl	$3, %ecx
	je	.L25
	cmpq	$1, %rcx
	je	.L88
	cmpq	$2, %rcx
	je	.L89
	vmovupd	(%r11), %ymm7
	vmovupd	(%r9), %ymm9
	vaddpd	(%rbx), %ymm7, %ymm8
	vaddpd	(%r10), %ymm9, %ymm10
	vmovupd	(%rsi), %ymm12
	movl	$32, %eax
	vaddpd	%ymm10, %ymm8, %ymm11
	vaddpd	(%r8), %ymm12, %ymm13
	vaddpd	%ymm13, %ymm11, %ymm14
	vmulpd	%ymm3, %ymm14, %ymm15
	vfmadd231pd	(%rdx), %ymm2, %ymm15
	vmovupd	%ymm15, (%rdi)
.L89:
	vmovupd	(%r11,%rax), %ymm0
	vmovupd	(%r9,%rax), %ymm1
	vaddpd	(%rbx,%rax), %ymm0, %ymm7
	vaddpd	(%r10,%rax), %ymm1, %ymm6
	vmovupd	(%rsi,%rax), %ymm9
	vaddpd	%ymm6, %ymm7, %ymm8
	vaddpd	(%r8,%rax), %ymm9, %ymm10
	vaddpd	%ymm10, %ymm8, %ymm11
	vmulpd	%ymm3, %ymm11, %ymm12
	vfmadd231pd	(%rdx,%rax), %ymm2, %ymm12
	vmovupd	%ymm12, (%rdi,%rax)
	addq	$32, %rax
.L88:
	vmovupd	(%r11,%rax), %ymm13
	vmovupd	(%r9,%rax), %ymm15
	vaddpd	(%rbx,%rax), %ymm13, %ymm14
	vaddpd	(%r10,%rax), %ymm15, %ymm0
	vmovupd	(%rsi,%rax), %ymm1
	vaddpd	%ymm0, %ymm14, %ymm7
	vaddpd	(%r8,%rax), %ymm1, %ymm6
	vaddpd	%ymm6, %ymm7, %ymm8
	vmulpd	%ymm3, %ymm8, %ymm9
	vfmadd231pd	(%rdx,%rax), %ymm2, %ymm9
	vmovupd	%ymm9, (%rdi,%rax)
	addq	$32, %rax
	cmpq	%rax, -1120(%rbp)
	je	.L110
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L25:
	vmovupd	(%r11,%rax), %ymm10
	vmovupd	(%r9,%rax), %ymm12
	vmovupd	32(%r11,%rax), %ymm6
	vmovupd	32(%r9,%rax), %ymm9
	vaddpd	(%rbx,%rax), %ymm10, %ymm11
	vaddpd	(%r10,%rax), %ymm12, %ymm13
	vaddpd	32(%rbx,%rax), %ymm6, %ymm8
	vaddpd	32(%r10,%rax), %ymm9, %ymm10
	vmovupd	(%rsi,%rax), %ymm15
	vmovupd	32(%rax,%rsi), %ymm12
	vaddpd	%ymm13, %ymm11, %ymm14
	vaddpd	(%r8,%rax), %ymm15, %ymm0
	vaddpd	%ymm10, %ymm8, %ymm11
	vaddpd	32(%r8,%rax), %ymm12, %ymm13
	vaddpd	%ymm0, %ymm14, %ymm7
	vmovupd	64(%r11,%rax), %ymm0
	vaddpd	%ymm13, %ymm11, %ymm14
	vmulpd	%ymm3, %ymm7, %ymm1
	vmovupd	96(%r11,%rax), %ymm13
	vmulpd	%ymm3, %ymm14, %ymm15
	vaddpd	64(%rbx,%rax), %ymm0, %ymm7
	vaddpd	96(%rbx,%rax), %ymm13, %ymm14
	vfmadd231pd	(%rdx,%rax), %ymm2, %ymm1
	vmovupd	64(%rax,%rsi), %ymm9
	vfmadd231pd	32(%rax,%rdx), %ymm2, %ymm15
	vaddpd	64(%r8,%rax), %ymm9, %ymm10
	vmovupd	%ymm1, (%rdi,%rax)
	vmovupd	64(%r9,%rax), %ymm1
	vmovupd	%ymm15, 32(%rdi,%rax)
	vmovupd	96(%r9,%rax), %ymm15
	vaddpd	64(%r10,%rax), %ymm1, %ymm6
	vaddpd	96(%r10,%rax), %ymm15, %ymm0
	vmovupd	96(%rax,%rsi), %ymm1
	vaddpd	%ymm6, %ymm7, %ymm8
	vaddpd	96(%r8,%rax), %ymm1, %ymm6
	vaddpd	%ymm0, %ymm14, %ymm7
	vaddpd	%ymm10, %ymm8, %ymm11
	vaddpd	%ymm6, %ymm7, %ymm8
	vmulpd	%ymm3, %ymm11, %ymm12
	vmulpd	%ymm3, %ymm8, %ymm9
	vfmadd231pd	64(%rax,%rdx), %ymm2, %ymm12
	vfmadd231pd	96(%rax,%rdx), %ymm2, %ymm9
	vmovupd	%ymm12, 64(%rdi,%rax)
	vmovupd	%ymm9, 96(%rdi,%rax)
	subq	$-128, %rax
	cmpq	%rax, -1120(%rbp)
	jne	.L25
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L110:
	movq	-1128(%rbp), %rdx
	cmpq	%rdx, -1184(%rbp)
	je	.L26
	movq	-1216(%rbp), %rcx
	movq	%rdx, %r11
.L21:
	leaq	(%r12,%rcx), %rbx
	leaq	0(,%rbx,8), %rdi
	leaq	1(%rcx), %rax
	leaq	(%r14,%rdi), %r8
	cmpq	%r11, %rax
	jge	.L36
	cmpq	%rcx, -1136(%rbp)
	jle	.L36
	movq	%rbx, %r10
	subq	%r15, %r10
	vmovsd	(%r14,%r10,8), %xmm11
	vmovsd	8(%r14,%rdi), %xmm13
	leaq	(%r15,%rbx), %r9
	movq	%rbx, %rdx
	vaddsd	(%r14,%r9,8), %xmm11, %xmm12
	vaddsd	-8(%r8), %xmm13, %xmm14
	subq	%r13, %rdx
	vmovsd	(%r14,%rdx,8), %xmm0
	addq	%r13, %rbx
	vaddsd	%xmm14, %xmm12, %xmm15
	vaddsd	(%r14,%rbx,8), %xmm0, %xmm7
	vmovsd	(%r8), %xmm10
	movq	-1144(%rbp), %rbx
	vaddsd	%xmm7, %xmm15, %xmm1
	addq	%r12, %rax
	leaq	(%r15,%rax), %r8
	vmulsd	%xmm5, %xmm1, %xmm6
	movq	%rax, %r10
	subq	%r13, %r10
	vmovsd	(%r14,%r10,8), %xmm13
	leaq	0(%r13,%rax), %r9
	vfmadd231sd	%xmm10, %xmm4, %xmm6
	vaddsd	8(%r14,%rax,8), %xmm10, %xmm10
	vaddsd	(%r14,%r9,8), %xmm13, %xmm14
	vmovsd	(%r14,%rax,8), %xmm8
	leaq	3(%rcx), %rdx
	vmovsd	%xmm6, (%rbx,%rdi)
	movq	%rax, %rdi
	subq	%r15, %rdi
	vmovsd	(%r14,%rdi,8), %xmm9
	vaddsd	(%r14,%r8,8), %xmm9, %xmm11
	vaddsd	%xmm10, %xmm11, %xmm12
	vaddsd	%xmm14, %xmm12, %xmm15
	vmulsd	%xmm5, %xmm15, %xmm0
	vfmadd231sd	%xmm8, %xmm4, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
	leaq	2(%rcx), %rax
	cmpq	%rdx, %r11
	jle	.L27
	addq	%r12, %rax
	movq	%rax, %r8
	subq	%r15, %r8
	vmovsd	(%r14,%r8,8), %xmm7
	leaq	(%r15,%rax), %rdi
	movq	%rax, %r10
	vaddsd	(%r14,%rdi,8), %xmm7, %xmm1
	vaddsd	8(%r14,%rax,8), %xmm8, %xmm8
	subq	%r13, %r10
	vmovsd	(%r14,%r10,8), %xmm11
	leaq	0(%r13,%rax), %r9
	vaddsd	%xmm8, %xmm1, %xmm9
	vaddsd	(%r14,%r9,8), %xmm11, %xmm10
	vmovsd	(%r14,%rax,8), %xmm6
	addq	%r12, %rdx
	vaddsd	%xmm10, %xmm9, %xmm12
	movq	%rdx, %r8
	subq	%r15, %r8
	vmulsd	%xmm5, %xmm12, %xmm13
	vmovsd	(%r14,%r8,8), %xmm15
	movq	%rdx, %rdi
	subq	%r13, %rdi
	vmovsd	(%r14,%rdi,8), %xmm1
	vfmadd231sd	%xmm6, %xmm4, %xmm13
	vaddsd	8(%r14,%rdx,8), %xmm6, %xmm6
	leaq	0(%r13,%rdx), %r10
	vaddsd	(%r14,%r10,8), %xmm1, %xmm8
	vmovsd	(%r14,%rdx,8), %xmm14
	vmovsd	%xmm13, (%rbx,%rax,8)
	leaq	(%r15,%rdx), %rax
	vaddsd	(%r14,%rax,8), %xmm15, %xmm0
	leaq	4(%rcx), %rax
	vaddsd	%xmm6, %xmm0, %xmm7
	vaddsd	%xmm8, %xmm7, %xmm9
	vmulsd	%xmm5, %xmm9, %xmm11
	vfmadd231sd	%xmm14, %xmm4, %xmm11
	vmovsd	%xmm11, (%rbx,%rdx,8)
	leaq	5(%rcx), %rdx
	cmpq	%rdx, %r11
	jle	.L27
	addq	%r12, %rax
	leaq	(%r15,%rax), %r11
	vmovsd	(%r14,%r11,8), %xmm12
	movq	%rax, %r9
	subq	%r15, %r9
	vaddsd	(%r14,%r9,8), %xmm12, %xmm13
	vaddsd	8(%r14,%rax,8), %xmm14, %xmm14
	leaq	0(%r13,%rax), %r8
	movq	%rax, %rdi
	vmovsd	(%r14,%r8,8), %xmm0
	subq	%r13, %rdi
	vaddsd	%xmm14, %xmm13, %xmm15
	vaddsd	(%r14,%rdi,8), %xmm0, %xmm6
	vmovsd	(%r14,%rax,8), %xmm10
	addq	%r12, %rdx
	vaddsd	%xmm6, %xmm15, %xmm7
	leaq	(%r15,%rdx), %r10
	vmovsd	(%r14,%r10,8), %xmm8
	vmulsd	%xmm5, %xmm7, %xmm1
	movq	%rdx, %r11
	vaddsd	8(%r14,%rdx,8), %xmm10, %xmm11
	subq	%r13, %r11
	vmovsd	(%r14,%r11,8), %xmm12
	vfmadd231sd	%xmm10, %xmm4, %xmm1
	leaq	0(%r13,%rdx), %r9
	vaddsd	(%r14,%r9,8), %xmm12, %xmm13
	vmovsd	%xmm1, (%rbx,%rax,8)
	movq	%rdx, %rax
	subq	%r15, %rax
	vaddsd	(%r14,%rax,8), %xmm8, %xmm9
	leaq	6(%rcx), %rax
	vaddsd	%xmm11, %xmm9, %xmm10
	vaddsd	%xmm13, %xmm10, %xmm14
	vmulsd	%xmm5, %xmm14, %xmm15
	vfmadd231sd	(%r14,%rdx,8), %xmm4, %xmm15
	vmovsd	%xmm15, (%rbx,%rdx,8)
.L27:
	leaq	(%r12,%rax), %rbx
	movq	%rbx, %rdx
	leaq	0(,%rbx,8), %rcx
	subq	%r15, %rdx
	vmovsd	(%r14,%rdx,8), %xmm0
	vmovsd	-8(%r14,%rcx), %xmm7
	leaq	(%r15,%rbx), %r8
	movq	%rbx, %r10
	vaddsd	(%r14,%r8,8), %xmm0, %xmm6
	vaddsd	8(%r14,%rcx), %xmm7, %xmm1
	subq	%r13, %r10
	vmovsd	(%r14,%r10,8), %xmm9
	leaq	0(%r13,%rbx), %rdi
	vaddsd	%xmm1, %xmm6, %xmm8
	vaddsd	(%r14,%rdi,8), %xmm9, %xmm11
	movq	-1144(%rbp), %r11
	movq	-1136(%rbp), %r9
	vaddsd	%xmm11, %xmm8, %xmm10
	vmulsd	%xmm5, %xmm10, %xmm12
	vfmadd231sd	(%r14,%rbx,8), %xmm4, %xmm12
	leaq	1(%rax), %rbx
	vmovsd	%xmm12, (%r11,%rcx)
	cmpq	%rbx, %r9
	jle	.L26
	addq	%r12, %rbx
	movq	%rbx, %rdx
	leaq	0(,%rbx,8), %rcx
	subq	%r15, %rdx
	vmovsd	(%r14,%rdx,8), %xmm13
	vmovsd	-8(%r14,%rcx), %xmm15
	leaq	(%r15,%rbx), %r8
	movq	%rbx, %r10
	vaddsd	(%r14,%r8,8), %xmm13, %xmm14
	vaddsd	8(%r14,%rcx), %xmm15, %xmm0
	subq	%r13, %r10
	vmovsd	(%r14,%r10,8), %xmm7
	leaq	0(%r13,%rbx), %rdi
	vaddsd	%xmm0, %xmm14, %xmm6
	vaddsd	(%r14,%rdi,8), %xmm7, %xmm1
	addq	$2, %rax
	vaddsd	%xmm1, %xmm6, %xmm8
	vmulsd	%xmm5, %xmm8, %xmm9
	vfmadd231sd	(%r14,%rbx,8), %xmm4, %xmm9
	vmovsd	%xmm9, (%r11,%rcx)
	cmpq	%rax, %r9
	jle	.L26
	addq	%r12, %rax
	movq	%rax, %r9
	leaq	0(,%rax,8), %rbx
	subq	%r15, %r9
	vmovsd	(%r14,%r9,8), %xmm11
	vmovsd	-8(%r14,%rbx), %xmm12
	leaq	(%r15,%rax), %rcx
	movq	%rax, %rdx
	vaddsd	(%r14,%rcx,8), %xmm11, %xmm10
	vaddsd	8(%r14,%rbx), %xmm12, %xmm13
	subq	%r13, %rdx
	vmovsd	(%r14,%rdx,8), %xmm15
	leaq	0(%r13,%rax), %r8
	vaddsd	%xmm13, %xmm10, %xmm14
	vaddsd	(%r14,%r8,8), %xmm15, %xmm0
	vaddsd	%xmm0, %xmm14, %xmm6
	vmulsd	%xmm5, %xmm6, %xmm7
	vfmadd231sd	(%r14,%rax,8), %xmm4, %xmm7
	vmovsd	%xmm7, (%r11,%rbx)
.L26:
	incq	-1112(%rbp)
	addq	%r13, %r12
	movq	%rsi, %rdx
	movq	-1112(%rbp), %rax
	cmpq	%rax, -1152(%rbp)
	jne	.L23
	incq	-1264(%rbp)
	movq	-1272(%rbp), %rsi
	addq	%rsi, -1224(%rbp)
	movq	-1264(%rbp), %r12
	cmpq	-1232(%rbp), %r12
	jne	.L20
.L19:
	incl	-1284(%rbp)
	movl	-1284(%rbp), %r11d
	cmpl	-1288(%rbp), %r11d
	jne	.L28
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	vmovapd	%ymm2, -1264(%rbp)
	vmovsd	%xmm5, -1208(%rbp)
	vmovsd	%xmm4, -1112(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm1
	movl	-1284(%rbp), %r10d
	vsubsd	-1096(%rbp), %xmm1, %xmm8
	vmovsd	.LC7(%rip), %xmm9
	addl	%r10d, %r10d
	vcomisd	%xmm8, %xmm9
	movl	%r10d, -1288(%rbp)
	vmovsd	-1112(%rbp), %xmm11
	vmovsd	-1208(%rbp), %xmm10
	vmovapd	-1264(%rbp), %ymm12
	ja	.L29
	movl	%r10d, %ebx
	sarl	%ebx
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm8, -1112(%rbp)
	vzeroupper
	call	gethostname
	movabsq	$7308041938491629923, %rdi
	cmpq	%rdi, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L123
.L30:
	vmovsd	.LC3(%rip), %xmm13
.L32:
	movl	-1276(%rbp), %r9d
	movl	-1292(%rbp), %edx
	leal	-2(%r9), %ecx
	subl	$2, %edx
	movl	-1280(%rbp), %r8d
	imull	%edx, %ecx
	subl	$2, %r8d
	vxorps	%xmm14, %xmm14, %xmm14
	imull	%r8d, %ecx
	vcvtsi2sdl	%ebx, %xmm14, %xmm7
	vmovsd	.LC8(%rip), %xmm9
	vcvtsi2sdl	%ecx, %xmm14, %xmm0
	movslq	%ecx, %rdx
	vmulsd	.LC9(%rip), %xmm7, %xmm3
	movslq	%ebx, %r13
	vmulsd	%xmm0, %xmm7, %xmm6
	imulq	%rdx, %r13
	leal	(%r9,%r9,2), %r15d
	vmulsd	%xmm0, %xmm3, %xmm4
	vmovapd	%xmm7, %xmm15
	vdivsd	%xmm1, %xmm6, %xmm2
	vmovsd	.LC12(%rip), %xmm6
	addl	%r15d, %r15d
	vmulsd	%xmm6, %xmm0, %xmm0
	vcvtsi2sdq	%r13, %xmm14, %xmm11
	vcvtsi2sdl	%r15d, %xmm14, %xmm14
	vmulsd	%xmm13, %xmm1, %xmm13
	vmovsd	.LC10(%rip), %xmm10
	vmulsd	%xmm15, %xmm0, %xmm15
	vmulsd	%xmm6, %xmm14, %xmm3
	vmulsd	.LC11(%rip), %xmm11, %xmm7
	movl	%ebx, %esi
	movl	$.LC14, %edi
	movl	$6, %eax
	vdivsd	%xmm1, %xmm4, %xmm8
	vdivsd	%xmm9, %xmm2, %xmm5
	vmulsd	.LC13(%rip), %xmm15, %xmm2
	vmulsd	%xmm10, %xmm8, %xmm12
	vmulsd	%xmm10, %xmm12, %xmm4
	vdivsd	%xmm9, %xmm3, %xmm0
	vdivsd	%xmm9, %xmm5, %xmm5
	vdivsd	%xmm7, %xmm13, %xmm3
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r14, %rdi
	call	free
	movq	-1144(%rbp), %rdi
	addq	$1256, %rsp
	popq	%rbx
	popq	%r12
	popq	%rax
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%rax), %rsp
	.cfi_def_cfa 7, 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	free
.L121:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L122:
	movq	-1168(%rbp), %rsi
	movq	-1128(%rbp), %r11
	movl	$1, %ecx
	leaq	(%rdx,%rsi), %rsi
	jmp	.L21
.L36:
	movq	%rcx, %rax
	jmp	.L27
.L120:
	movslq	-1276(%rbp), %r13
	leal	-1(%r13), %esi
	jmp	.L9
.L123:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm13
	jne	.L30
	jmp	.L32
	.cfi_endproc
.LFE25:
	.size	stencil, .-stencil
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"3D7PT b[k][j][i] = c0 * a[k][j][i] + c1 * (...), 32 byte/it, 8 Flop/it"
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
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	movl	$1024, %esi
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r15
	leaq	-2096(%rbp), %rdi
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	movl	$1830, %r15d
	pushq	%r14
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movl	$610, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$2240, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	call	gethostname
	leaq	-2128(%rbp), %rsi
	leaq	-2096(%rbp), %rdi
	call	getFreq
	movl	$.LC15, %edi
	call	puts
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdq	-2128(%rbp), %xmm3, %xmm0
	leaq	-2096(%rbp), %rsi
	movl	$.LC17, %edi
	movl	$1, %eax
	vdivsd	.LC16(%rip), %xmm0, %xmm0
	call	printf
	movl	$.LC18, %edi
	call	puts
	movq	$34168, -2232(%rbp)
	movq	$4880, -2176(%rbp)
	movq	$609, -2184(%rbp)
	movq	$608, -2136(%rbp)
	.p2align 4,,10
	.p2align 3
.L145:
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdl	%r14d, %xmm4, %xmm1
	movl	%r14d, -2164(%rbp)
	movl	%r14d, %ebx
	vucomisd	.LC19(%rip), %xmm1
	jnb	.L223
.L125:
	movq	-2176(%rbp), %rax
	movl	$64, %edi
	leaq	(%rax,%rax,8), %r13
	movq	%r13, %rsi
	call	aligned_alloc
	movq	%r13, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movl	%ebx, %edx
	andl	$-4, %edx
	movl	%ebx, %esi
	movl	%r15d, -2196(%rbp)
	movl	%edx, -2144(%rbp)
	movl	$3, -2160(%rbp)
	shrl	$2, %esi
	vmovapd	.LC4(%rip), %ymm6
	movq	%rax, %r13
	leaq	0(,%r15,8), %r11
	movq	%r12, %r10
	salq	$5, %rsi
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L126:
	movl	$3, -2152(%rbp)
	movq	%r10, %rcx
	movl	%r9d, %edi
	.p2align 4,,10
	.p2align 3
.L133:
	cmpq	$2, -2184(%rbp)
	jbe	.L146
	leaq	-32(%rsi), %rdx
	shrq	$5, %rdx
	incq	%rdx
	leaq	(%rcx,%rsi), %r8
	movq	%rcx, %rax
	andl	$7, %edx
	je	.L128
	cmpq	$1, %rdx
	je	.L191
	cmpq	$2, %rdx
	je	.L192
	cmpq	$3, %rdx
	je	.L193
	cmpq	$4, %rdx
	je	.L194
	cmpq	$5, %rdx
	je	.L195
	cmpq	$6, %rdx
	je	.L196
	vmovupd	%ymm6, (%rcx)
	leaq	32(%rcx), %rax
.L196:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L195:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L194:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L193:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L192:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L191:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
	cmpq	%r8, %rax
	je	.L216
.L128:
	vmovupd	%ymm6, (%rax)
	vmovupd	%ymm6, 32(%rax)
	vmovupd	%ymm6, 64(%rax)
	vmovupd	%ymm6, 96(%rax)
	vmovupd	%ymm6, 128(%rax)
	vmovupd	%ymm6, 160(%rax)
	vmovupd	%ymm6, 192(%rax)
	vmovupd	%ymm6, 224(%rax)
	addq	$256, %rax
	cmpq	%r8, %rax
	jne	.L128
	.p2align 4,,10
	.p2align 3
.L216:
	movl	-2144(%rbp), %eax
	cmpl	%ebx, -2144(%rbp)
	je	.L127
.L131:
	leal	(%rdi,%rax), %r8d
	movslq	%r8d, %rdx
	movq	.LC5(%rip), %r8
	movq	%r8, (%r12,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%r14d, %edx
	jl	.L224
.L127:
	addl	%ebx, %edi
	addq	-2176(%rbp), %rcx
	decl	-2152(%rbp)
	jne	.L133
	addl	-2196(%rbp), %r9d
	addq	%r11, %r10
	decl	-2160(%rbp)
	jne	.L126
	cmpl	$2, -2164(%rbp)
	movq	%r14, %rcx
	movl	$1, %edi
	cmovg	-2136(%rbp), %rdi
	salq	$5, %rcx
	leaq	8(%rcx), %r10
	leaq	(%r12,%r10), %rbx
	movq	%rdi, %r9
	addq	%r13, %r10
	movq	%rdi, -2256(%rbp)
	leaq	8(%r12,%r11), %rdi
	movq	-2176(%rbp), %r11
	movq	%r10, -2144(%rbp)
	movq	%r9, %r10
	leaq	0(,%r14,4), %rsi
	andq	$-4, %r9
	leaq	8(%r11,%r11,4), %rdx
	shrq	$2, %r10
	leaq	(%r12,%rcx), %r8
	leaq	16(%r12,%rcx), %rax
	movq	%rbx, -2160(%rbp)
	movq	%r9, -2248(%rbp)
	leaq	(%r12,%rdx), %rcx
	salq	$5, %r10
	leaq	1(%r9), %r9
	movq	%rsi, %rbx
	movq	%rax, -2152(%rbp)
	movq	%r10, -2192(%rbp)
	movq	%r9, -2240(%rbp)
	movl	$1, -2168(%rbp)
	movq	%rcx, -2264(%rbp)
	movq	%rdi, -2272(%rbp)
	movq	%r8, -2280(%rbp)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L141:
	leaq	-2104(%rbp), %rsi
	leaq	-2120(%rbp), %rdi
	call	timing
	movl	$0, -2164(%rbp)
	movq	-2264(%rbp), %r11
	movq	-2272(%rbp), %r9
	movq	-2280(%rbp), %r8
	.p2align 4,,10
	.p2align 3
.L140:
	vmovsd	(%r12), %xmm1
	vxorpd	%xmm7, %xmm7, %xmm7
	vcomisd	%xmm7, %xmm1
	jbe	.L134
	movq	%r12, %rdi
	movq	%r8, -2224(%rbp)
	movq	%r9, -2216(%rbp)
	movq	%r11, -2208(%rbp)
	vzeroupper
	call	dummy
	movq	-2224(%rbp), %r8
	movq	-2216(%rbp), %r9
	movq	-2208(%rbp), %r11
.L134:
	cmpq	$5, %r14
	jbe	.L147
	movq	-2192(%rbp), %rdx
	movq	-2176(%rbp), %rsi
	leaq	-32(%rdx), %r10
	movq	-2232(%rbp), %rdi
	shrq	$5, %r10
	incq	%r10
	leaq	8(%r12,%rsi), %rsi
	leaq	(%r12,%rdi), %rcx
	xorl	%eax, %eax
	andl	$3, %r10d
	je	.L218
	cmpq	$1, %r10
	je	.L197
	cmpq	$2, %r10
	je	.L198
	movq	-2152(%rbp), %rax
	vmovupd	(%rcx), %ymm2
	vmovupd	(%rax), %ymm8
	vaddpd	(%rsi), %ymm2, %ymm5
	vaddpd	(%r8), %ymm8, %ymm9
	vmovupd	(%r11), %ymm11
	movq	-2160(%rbp), %rdi
	vaddpd	%ymm9, %ymm5, %ymm10
	vaddpd	(%r9), %ymm11, %ymm12
	vmovupd	(%rdi), %ymm15
	movq	-2144(%rbp), %rdx
	vaddpd	%ymm12, %ymm10, %ymm13
	movl	$32, %eax
	vmulpd	.LC21(%rip), %ymm13, %ymm14
	vfmadd231pd	.LC22(%rip), %ymm15, %ymm14
	vmovupd	%ymm14, (%rdx)
.L198:
	movq	-2152(%rbp), %r10
	vmovupd	(%rcx,%rax), %ymm3
	vmovupd	(%r10,%rax), %ymm4
	vaddpd	(%rsi,%rax), %ymm3, %ymm0
	vaddpd	(%r8,%rax), %ymm4, %ymm6
	vmovupd	(%r11,%rax), %ymm1
	movq	-2160(%rbp), %rdi
	vaddpd	(%r9,%rax), %ymm1, %ymm2
	vaddpd	%ymm6, %ymm0, %ymm7
	vmovupd	(%rdi,%rax), %ymm9
	movq	-2144(%rbp), %rdx
	vaddpd	%ymm2, %ymm7, %ymm5
	vmulpd	.LC21(%rip), %ymm5, %ymm8
	vfmadd231pd	.LC22(%rip), %ymm9, %ymm8
	vmovupd	%ymm8, (%rdx,%rax)
	addq	$32, %rax
.L197:
	movq	-2152(%rbp), %r10
	vmovupd	(%rcx,%rax), %ymm10
	vmovupd	(%r10,%rax), %ymm12
	vaddpd	(%rsi,%rax), %ymm10, %ymm11
	vaddpd	(%r8,%rax), %ymm12, %ymm13
	vmovupd	(%r11,%rax), %ymm15
	movq	-2160(%rbp), %rdi
	vaddpd	(%r9,%rax), %ymm15, %ymm3
	vaddpd	%ymm13, %ymm11, %ymm14
	vmovupd	(%rdi,%rax), %ymm6
	movq	-2144(%rbp), %rdx
	vaddpd	%ymm3, %ymm14, %ymm0
	vmulpd	.LC21(%rip), %ymm0, %ymm4
	vfmadd231pd	.LC22(%rip), %ymm6, %ymm4
	vmovupd	%ymm4, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%rax, -2192(%rbp)
	je	.L215
	movq	%rdi, %r10
	movq	-2152(%rbp), %rdi
.L137:
	vmovupd	(%rcx,%rax), %ymm7
	vmovupd	(%rdi,%rax), %ymm1
	vaddpd	(%rsi,%rax), %ymm7, %ymm2
	vaddpd	(%r8,%rax), %ymm1, %ymm5
	vmovupd	(%r11,%rax), %ymm9
	vmovupd	(%r10,%rax), %ymm13
	vaddpd	(%r9,%rax), %ymm9, %ymm10
	vaddpd	%ymm5, %ymm2, %ymm8
	vmovupd	32(%rcx,%rax), %ymm14
	vmovupd	32(%rdi,%rax), %ymm3
	vaddpd	%ymm10, %ymm8, %ymm11
	vmovupd	64(%rcx,%rax), %ymm8
	vmovupd	64(%rdi,%rax), %ymm10
	vmulpd	.LC21(%rip), %ymm11, %ymm12
	vaddpd	32(%rsi,%rax), %ymm14, %ymm15
	vaddpd	32(%r8,%rax), %ymm3, %ymm0
	vaddpd	64(%rsi,%rax), %ymm8, %ymm9
	vaddpd	64(%r8,%rax), %ymm10, %ymm11
	vfmadd231pd	.LC22(%rip), %ymm13, %ymm12
	vmovupd	32(%r11,%rax), %ymm6
	vmovupd	64(%r11,%rax), %ymm13
	vaddpd	%ymm0, %ymm15, %ymm4
	vaddpd	32(%r9,%rax), %ymm6, %ymm7
	vaddpd	64(%r9,%rax), %ymm13, %ymm14
	vmovupd	%ymm12, (%rdx,%rax)
	vaddpd	%ymm11, %ymm9, %ymm12
	vaddpd	%ymm7, %ymm4, %ymm2
	vmovupd	32(%r10,%rax), %ymm5
	vaddpd	%ymm14, %ymm12, %ymm15
	vmulpd	.LC21(%rip), %ymm2, %ymm1
	vmovupd	64(%r10,%rax), %ymm0
	vmulpd	.LC21(%rip), %ymm15, %ymm3
	vmovupd	96(%rcx,%rax), %ymm4
	vfmadd231pd	.LC22(%rip), %ymm5, %ymm1
	vaddpd	96(%rsi,%rax), %ymm4, %ymm6
	vfmadd231pd	.LC22(%rip), %ymm0, %ymm3
	vmovupd	%ymm1, 32(%rdx,%rax)
	vmovupd	%ymm3, 64(%rdx,%rax)
	vmovupd	96(%rdi,%rax), %ymm7
	vmovupd	96(%r11,%rax), %ymm1
	vaddpd	96(%r8,%rax), %ymm7, %ymm2
	vaddpd	96(%r9,%rax), %ymm1, %ymm8
	vmovupd	96(%r10,%rax), %ymm11
	vaddpd	%ymm2, %ymm6, %ymm5
	vaddpd	%ymm8, %ymm5, %ymm9
	vmulpd	.LC21(%rip), %ymm9, %ymm10
	vfmadd231pd	.LC22(%rip), %ymm11, %ymm10
	vmovupd	%ymm10, 96(%rdx,%rax)
	subq	$-128, %rax
	cmpq	%rax, -2192(%rbp)
	jne	.L137
	.p2align 4,,10
	.p2align 3
.L215:
	movq	-2256(%rbp), %rax
	cmpq	%rax, -2248(%rbp)
	je	.L138
	movq	-2240(%rbp), %rax
.L136:
	leaq	(%rbx,%rax), %rdx
	leaq	0(,%rdx,8), %rsi
	leaq	(%r12,%rsi), %rcx
	movq	%rcx, -2208(%rbp)
	leaq	1(%rax), %rcx
	cmpq	-2136(%rbp), %rcx
	jge	.L148
	cmpq	-2184(%rbp), %rax
	jge	.L148
	leaq	(%rdx,%r14), %rdi
	vmovsd	(%r12,%rdi,8), %xmm14
	addq	%rbx, %rcx
	vmovsd	8(%r12,%rcx,8), %xmm13
	addq	%r14, %rcx
	leaq	8(%r12,%rsi), %r10
	vmovhpd	(%r12,%rcx,8), %xmm14, %xmm15
	leaq	(%rdx,%r15), %rdi
	movq	%rdx, %rcx
	subq	%r15, %rdx
	vmovupd	(%r12,%rdx,8), %xmm3
	vmovupd	(%r10), %xmm4
	leaq	(%r12,%rsi), %rdx
	vaddpd	-8(%rdx), %xmm4, %xmm7
	vaddpd	(%r12,%rdi,8), %xmm3, %xmm6
	subq	%r14, %rcx
	vaddpd	(%r12,%rcx,8), %xmm15, %xmm0
	vaddpd	%xmm7, %xmm6, %xmm2
	vmovupd	(%rdx), %xmm8
	leaq	3(%rax), %rcx
	vaddpd	%xmm2, %xmm0, %xmm5
	vmovsd	(%r10), %xmm12
	leaq	2(%rax), %rdx
	vmulpd	.LC23(%rip), %xmm5, %xmm1
	vfmadd231pd	.LC24(%rip), %xmm8, %xmm1
	vmovups	%xmm1, 0(%r13,%rsi)
	cmpq	-2136(%rbp), %rcx
	jge	.L222
	addq	%rbx, %rdx
	movq	%rdx, %r10
	leaq	0(,%rdx,8), %rsi
	subq	%r15, %r10
	vmovsd	8(%r12,%rsi), %xmm9
	vmovsd	(%r12,%r10,8), %xmm10
	leaq	(%r15,%rdx), %rdi
	movq	%rdx, %r10
	vaddsd	(%r12,%rdi,8), %xmm10, %xmm11
	vaddsd	%xmm9, %xmm12, %xmm12
	subq	%r14, %r10
	vmovsd	(%r12,%r10,8), %xmm15
	addq	%r14, %rdx
	vaddsd	%xmm12, %xmm11, %xmm14
	vaddsd	(%r12,%rdx,8), %xmm15, %xmm0
	vmovsd	.LC25(%rip), %xmm4
	addq	%rbx, %rcx
	vaddsd	%xmm0, %xmm14, %xmm3
	vmovsd	.LC26(%rip), %xmm0
	movq	%rcx, %rdi
	vmulsd	%xmm4, %xmm3, %xmm6
	leaq	0(,%rcx,8), %rdx
	subq	%r15, %rdi
	vmovsd	8(%r12,%rdx), %xmm8
	vmovsd	(%r12,%rdi,8), %xmm7
	vfmadd231sd	%xmm0, %xmm13, %xmm6
	movq	%rcx, %r10
	vaddsd	%xmm8, %xmm13, %xmm13
	subq	%r14, %r10
	vmovsd	(%r12,%r10,8), %xmm1
	vmovsd	%xmm6, 0(%r13,%rsi)
	leaq	(%r15,%rcx), %rsi
	vaddsd	(%r12,%rsi,8), %xmm7, %xmm2
	addq	%r14, %rcx
	vaddsd	(%r12,%rcx,8), %xmm1, %xmm10
	vaddsd	%xmm13, %xmm2, %xmm5
	leaq	5(%rax), %rcx
	vaddsd	%xmm10, %xmm5, %xmm11
	vmulsd	%xmm4, %xmm11, %xmm12
	vfmadd231sd	%xmm0, %xmm9, %xmm12
	vmovsd	%xmm12, 0(%r13,%rdx)
	leaq	4(%rax), %rdx
	cmpq	-2136(%rbp), %rcx
	jge	.L139
	addq	%rbx, %rdx
	leaq	0(,%rdx,8), %rsi
	leaq	(%r15,%rdx), %r10
	vmovsd	8(%r12,%rsi), %xmm14
	vmovsd	(%r12,%r10,8), %xmm15
	movq	%rdx, %rdi
	subq	%r15, %rdi
	vaddsd	(%r12,%rdi,8), %xmm15, %xmm3
	leaq	(%r14,%rdx), %r10
	vaddsd	%xmm9, %xmm14, %xmm9
	vmovsd	(%r12,%r10,8), %xmm7
	subq	%r14, %rdx
	vaddsd	%xmm9, %xmm3, %xmm6
	vaddsd	(%r12,%rdx,8), %xmm7, %xmm2
	addq	%rbx, %rcx
	leaq	(%rcx,%r15), %rdx
	vaddsd	%xmm2, %xmm6, %xmm13
	leaq	(%rcx,%r14), %rdi
	vmovsd	(%r12,%rdi,8), %xmm12
	vmulsd	%xmm4, %xmm13, %xmm5
	movq	%rcx, %r10
	subq	%r14, %r10
	vaddsd	(%r12,%r10,8), %xmm12, %xmm15
	vfmadd231sd	%xmm0, %xmm8, %xmm5
	vaddsd	8(%r12,%rcx,8), %xmm8, %xmm8
	vmovsd	%xmm5, 0(%r13,%rsi)
	movq	%rcx, %rsi
	subq	%r15, %rsi
	vmovsd	(%r12,%rsi,8), %xmm1
	vaddsd	(%r12,%rdx,8), %xmm1, %xmm10
	leaq	6(%rax), %rdx
	vaddsd	%xmm8, %xmm10, %xmm11
	vaddsd	%xmm15, %xmm11, %xmm3
	vmulsd	%xmm4, %xmm3, %xmm9
	vfmadd231sd	%xmm0, %xmm14, %xmm9
	vmovsd	%xmm9, 0(%r13,%rcx,8)
.L139:
	leaq	(%rdx,%rbx), %rax
	leaq	0(,%rax,8), %rcx
	leaq	(%rax,%r15), %rdi
	vmovsd	(%r12,%rdi,8), %xmm14
	movq	%rax, %rsi
	vmovsd	8(%r12,%rcx), %xmm7
	movq	%rax, %r10
	subq	%r15, %rsi
	subq	%r14, %r10
	vaddsd	(%r12,%rsi,8), %xmm14, %xmm6
	vaddsd	-8(%r12,%rcx), %xmm7, %xmm2
	vmovsd	(%r12,%r10,8), %xmm5
	leaq	(%rax,%r14), %rdi
	vaddsd	%xmm2, %xmm6, %xmm13
	vaddsd	(%r12,%rdi,8), %xmm5, %xmm1
	movq	-2184(%rbp), %r10
	vaddsd	%xmm1, %xmm13, %xmm10
	vmulsd	%xmm4, %xmm10, %xmm8
	vfmadd231sd	(%r12,%rax,8), %xmm0, %xmm8
	leaq	1(%rdx), %rax
	vmovsd	%xmm8, 0(%r13,%rcx)
	cmpq	%r10, %rax
	jge	.L138
	addq	%rbx, %rax
	movq	%rax, %rdi
	leaq	0(,%rax,8), %rcx
	subq	%r15, %rdi
	vmovsd	(%r12,%rdi,8), %xmm11
	vmovsd	-8(%r12,%rcx), %xmm15
	leaq	(%r15,%rax), %rsi
	movq	%rax, %rdi
	vaddsd	(%r12,%rsi,8), %xmm11, %xmm12
	vaddsd	8(%r12,%rcx), %xmm15, %xmm3
	subq	%r14, %rdi
	vmovsd	(%r12,%rdi,8), %xmm14
	leaq	(%r14,%rax), %rsi
	vaddsd	%xmm3, %xmm12, %xmm9
	vaddsd	(%r12,%rsi,8), %xmm14, %xmm6
	addq	$2, %rdx
	vaddsd	%xmm6, %xmm9, %xmm7
	vmulsd	%xmm4, %xmm7, %xmm2
	vfmadd231sd	(%r12,%rax,8), %xmm0, %xmm2
	vmovsd	%xmm2, 0(%r13,%rcx)
	cmpq	%r10, %rdx
	jge	.L138
	addq	%rbx, %rdx
	movq	%rdx, %r10
	leaq	0(,%rdx,8), %rax
	subq	%r15, %r10
	vmovsd	(%r12,%r10,8), %xmm13
	vmovsd	-8(%r12,%rax), %xmm1
	leaq	(%r15,%rdx), %rcx
	movq	%rdx, %rdi
	vaddsd	(%r12,%rcx,8), %xmm13, %xmm5
	vaddsd	8(%r12,%rax), %xmm1, %xmm10
	subq	%r14, %rdi
	vmovsd	(%r12,%rdi,8), %xmm11
	leaq	(%r14,%rdx), %rsi
	vaddsd	%xmm10, %xmm5, %xmm8
	vaddsd	(%r12,%rsi,8), %xmm11, %xmm12
	vaddsd	%xmm12, %xmm8, %xmm15
	vmulsd	%xmm4, %xmm15, %xmm4
	vfmadd132sd	(%r12,%rdx,8), %xmm4, %xmm0
	vmovsd	%xmm0, 0(%r13,%rax)
.L138:
	incl	-2164(%rbp)
	movl	-2164(%rbp), %edx
	cmpl	-2168(%rbp), %edx
	jne	.L140
	leaq	-2104(%rbp), %rsi
	leaq	-2112(%rbp), %rdi
	vzeroupper
	call	timing
	vmovsd	-2112(%rbp), %xmm0
	movl	-2164(%rbp), %r8d
	vsubsd	-2120(%rbp), %xmm0, %xmm3
	vmovsd	.LC7(%rip), %xmm9
	addl	%r8d, %r8d
	vcomisd	%xmm3, %xmm9
	movl	%r8d, -2168(%rbp)
	ja	.L141
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	movl	%r8d, %ebx
	vmovsd	%xmm3, -2144(%rbp)
	call	gethostname
	movabsq	$7308041938491629923, %r9
	sarl	%ebx
	cmpq	%r9, -1072(%rbp)
	vmovsd	-2144(%rbp), %xmm1
	je	.L225
.L142:
	vmovsd	.LC3(%rip), %xmm14
.L144:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdl	%ebx, %xmm6, %xmm7
	movq	-2136(%rbp), %rdx
	vmulsd	%xmm14, %xmm1, %xmm9
	vcvtsi2sdl	%edx, %xmm6, %xmm2
	vmulsd	.LC9(%rip), %xmm7, %xmm8
	movslq	%ebx, %r11
	imulq	%rdx, %r11
	vmulsd	.LC12(%rip), %xmm2, %xmm14
	movl	-2196(%rbp), %eax
	vmulsd	%xmm2, %xmm8, %xmm12
	vmulsd	%xmm2, %xmm7, %xmm5
	addl	%eax, %eax
	vmulsd	%xmm7, %xmm14, %xmm7
	vcvtsi2sdq	%r11, %xmm6, %xmm0
	vdivsd	%xmm1, %xmm12, %xmm15
	vcvtsi2sdl	%eax, %xmm6, %xmm6
	movl	%ebx, %esi
	vmulsd	.LC13(%rip), %xmm7, %xmm13
	vmulsd	.LC11(%rip), %xmm0, %xmm3
	vmulsd	.LC12(%rip), %xmm6, %xmm2
	movl	$.LC14, %edi
	movl	$6, %eax
	subq	$32, %r14
	subq	$96, %r15
	vdivsd	.LC8(%rip), %xmm2, %xmm0
	vdivsd	%xmm1, %xmm5, %xmm10
	vmulsd	.LC10(%rip), %xmm15, %xmm4
	vmulsd	.LC10(%rip), %xmm4, %xmm4
	vdivsd	%xmm3, %xmm9, %xmm3
	vdivsd	.LC8(%rip), %xmm10, %xmm11
	vdivsd	.LC8(%rip), %xmm11, %xmm5
	vdivsd	%xmm1, %xmm13, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	subq	$32, -2136(%rbp)
	subq	$32, -2184(%rbp)
	subq	$256, -2176(%rbp)
	subq	$1792, -2232(%rbp)
	cmpq	$290, %r14
	jne	.L145
	addq	$2240, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	xorl	%eax, %eax
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L148:
	.cfi_restore_state
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L222:
	vmovsd	.LC25(%rip), %xmm4
	vmovsd	.LC26(%rip), %xmm0
	jmp	.L139
	.p2align 4,,10
	.p2align 3
.L218:
	movq	-2144(%rbp), %rdx
	movq	-2152(%rbp), %rdi
	movq	-2160(%rbp), %r10
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L147:
	movl	$1, %eax
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L146:
	xorl	%eax, %eax
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L224:
	addl	%edi, %edx
	movslq	%edx, %rdx
	addl	$2, %eax
	movq	%r8, (%r12,%rdx,8)
	cmpl	%r14d, %eax
	jge	.L127
	addl	%edi, %eax
	cltq
	movq	%r8, (%r12,%rax,8)
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L225:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm14
	jne	.L142
	jmp	.L144
.L223:
	vmovsd	.LC20(%rip), %xmm0
	call	pow
	jmp	.L125
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
	.long	1083129856
	.align 8
.LC9:
	.long	0
	.long	1077936128
	.align 8
.LC10:
	.long	0
	.long	1062207488
	.align 8
.LC11:
	.long	0
	.long	1069547520
	.align 8
.LC12:
	.long	0
	.long	1075838976
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
	.long	0
	.long	1080016896
	.align 8
.LC20:
	.long	3435973837
	.long	1073007820
	.section	.rodata.cst32
	.align 32
.LC21:
	.long	398572965
	.long	1068847910
	.long	398572965
	.long	1068847910
	.long	398572965
	.long	1068847910
	.long	398572965
	.long	1068847910
	.align 32
.LC22:
	.long	858993459
	.long	1071854387
	.long	858993459
	.long	1071854387
	.long	858993459
	.long	1071854387
	.long	858993459
	.long	1071854387
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC23:
	.long	398572965
	.long	1068847910
	.long	398572965
	.long	1068847910
	.align 16
.LC24:
	.long	858993459
	.long	1071854387
	.long	858993459
	.long	1071854387
	.section	.rodata.cst8
	.align 8
.LC25:
	.long	398572965
	.long	1068847910
	.align 8
.LC26:
	.long	858993459
	.long	1071854387
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
