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
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L4
	movl	$2200000000, %edx
	movq	%rdx, (%r8)
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$2500000000, %ecx
	movq	%rcx, (%r8)
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
	movl	%edi, -1284(%rbp)
	movslq	%r12d, %r12
	salq	$3, %r12
	movl	%esi, -1272(%rbp)
	movl	$64, %edi
	movq	%r12, %rsi
	movl	%edx, -1268(%rbp)
	vmovsd	%xmm0, -1120(%rbp)
	vmovsd	%xmm1, -1112(%rbp)
	call	aligned_alloc
	movq	%r12, %rsi
	movl	$64, %edi
	movq	%rax, %r15
	call	aligned_alloc
	testl	%ebx, %ebx
	movq	%rax, -1136(%rbp)
	vmovsd	-1112(%rbp), %xmm5
	vmovsd	-1120(%rbp), %xmm4
	jle	.L64
	movl	-1272(%rbp), %ecx
	testl	%ecx, %ecx
	jle	.L64
	movslq	-1268(%rbp), %r12
	movl	-1268(%rbp), %edx
	movq	%r12, %rax
	testl	%edx, %edx
	jle	.L65
	movl	-1272(%rbp), %ebx
	movl	%r12d, %r13d
	imull	%r12d, %ebx
	shrl	$2, %r13d
	andl	$-4, %eax
	vmovsd	.LC5(%rip), %xmm1
	vmovapd	.LC4(%rip), %ymm0
	leaq	0(,%r12,8), %r14
	leal	-1(%r12), %edx
	salq	$5, %r13
	movl	%eax, %r11d
	xorl	%esi, %esi
	xorl	%r8d, %r8d
.L10:
	movslq	%esi, %rax
	leaq	(%r15,%rax,8), %rdi
	movl	%esi, %ecx
	xorl	%r9d, %r9d
.L16:
	leaq	0(%r13,%rdi), %r10
	movq	%rdi, %rax
	cmpl	$2, %edx
	jbe	.L66
.L11:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%r10, %rax
	jne	.L11
	movl	%r11d, %eax
	cmpl	-1268(%rbp), %r11d
	je	.L12
.L14:
	leal	(%rcx,%rax), %r10d
	movslq	%r10d, %r10
	vmovsd	%xmm1, (%r15,%r10,8)
	leal	1(%rax), %r10d
	cmpl	%r10d, -1268(%rbp)
	jle	.L12
	addl	%ecx, %r10d
	movslq	%r10d, %r10
	addl	$2, %eax
	vmovsd	%xmm1, (%r15,%r10,8)
	cmpl	%eax, -1268(%rbp)
	jle	.L12
	addl	%ecx, %eax
	cltq
	vmovsd	%xmm1, (%r15,%rax,8)
.L12:
	incl	%r9d
	addl	-1268(%rbp), %ecx
	addq	%r14, %rdi
	cmpl	%r9d, -1272(%rbp)
	jne	.L16
	incl	%r8d
	addl	%ebx, %esi
	cmpl	%r8d, -1284(%rbp)
	jne	.L10
.L9:
	movl	-1284(%rbp), %eax
	movl	-1272(%rbp), %esi
	decl	%eax
	cltq
	movq	%rax, -1224(%rbp)
	leal	-1(%rsi), %eax
	cltq
	movq	%rax, -1144(%rbp)
	movl	-1268(%rbp), %eax
	movslq	%edx, %rcx
	imull	%esi, %eax
	movq	%rcx, -1128(%rbp)
	movl	$1, -1280(%rbp)
	movslq	%eax, %r14
	movslq	%esi, %rax
	imulq	%r12, %rax
	leaq	-1(%rcx), %rsi
	movq	%rsi, -1120(%rbp)
	movq	%rax, -1232(%rbp)
	leaq	0(,%r12,8), %rax
	movq	%rax, -1160(%rbp)
	leaq	-2(%rcx), %rax
	movq	%rax, -1152(%rbp)
	movq	%r14, %rax
	negq	%rax
	salq	$3, %rax
	movq	%rax, -1184(%rbp)
	leaq	0(,%r14,8), %rax
	movq	%rax, -1168(%rbp)
	movq	%r12, %rax
	negq	%rax
	salq	$3, %rax
	movq	%rax, -1192(%rbp)
	movq	%rsi, %rax
	shrq	$2, %rax
	salq	$5, %rax
	andq	$-4, %rsi
	movq	%rax, %r13
	movq	%rsi, -1176(%rbp)
	leaq	1(%rsi), %rax
	movq	%rax, -1208(%rbp)
	movq	%r12, %rax
	vbroadcastsd	%xmm4, %ymm2
	movq	%r13, %r12
	movq	%rax, %r13
.L29:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	vmovapd	%ymm2, -1264(%rbp)
	vmovsd	%xmm5, -1200(%rbp)
	vmovsd	%xmm4, -1112(%rbp)
	vzeroupper
	call	timing
	movl	$0, -1276(%rbp)
	vmovapd	-1264(%rbp), %ymm2
	vmovsd	-1200(%rbp), %xmm5
	vmovsd	-1112(%rbp), %xmm4
.L28:
	vmovsd	(%r15), %xmm0
	vxorpd	%xmm3, %xmm3, %xmm3
	vcomisd	%xmm3, %xmm0
	jbe	.L17
	movq	%r15, %rdi
	vmovapd	%ymm2, -1264(%rbp)
	vmovsd	%xmm5, -1200(%rbp)
	vmovsd	%xmm4, -1112(%rbp)
	vzeroupper
	call	dummy
	vmovapd	-1264(%rbp), %ymm2
	vmovsd	-1200(%rbp), %xmm5
	vmovsd	-1112(%rbp), %xmm4
.L17:
	cmpq	$1, -1224(%rbp)
	jle	.L19
	cmpq	$1, -1144(%rbp)
	jle	.L19
	movq	-1232(%rbp), %rax
	movq	$1, -1264(%rbp)
	movq	%rax, -1216(%rbp)
	movq	-1136(%rbp), %rax
	vbroadcastsd	%xmm5, %ymm3
	addq	$8, %rax
	cmpq	$1, -1128(%rbp)
	movq	%rax, -1200(%rbp)
	jle	.L19
	.p2align 4,,10
	.p2align 3
.L20:
	movq	-1216(%rbp), %rax
	movq	$1, -1112(%rbp)
	leaq	(%rax,%r13), %rsi
	leaq	8(%r15,%rsi,8), %rdx
	.p2align 4,,10
	.p2align 3
.L23:
	cmpq	$2, -1152(%rbp)
	jbe	.L67
	movq	-1184(%rbp), %rax
	leaq	-8(%rdx), %rbx
	leaq	(%rax,%rdx), %r10
	movq	-1168(%rbp), %rax
	leaq	8(%rdx), %r11
	leaq	(%rax,%rdx), %r9
	movq	-1192(%rbp), %rax
	leaq	(%rdx,%rax), %r8
	movq	-1160(%rbp), %rax
	leaq	(%rax,%rdx), %rcx
	movq	-1200(%rbp), %rax
	leaq	(%rax,%rsi,8), %rdi
	xorl	%eax, %eax
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
	.p2align 4,,10
	.p2align 3
.L25:
	vmovupd	(%r9,%rax), %ymm7
	vmovupd	(%r11,%rax), %ymm6
	vaddpd	(%r10,%rax), %ymm7, %ymm0
	vaddpd	(%rbx,%rax), %ymm6, %ymm1
	vmovupd	(%rcx,%rax), %ymm7
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	(%r8,%rax), %ymm7, %ymm1
	vaddpd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm3, %ymm0, %ymm0
	vfmadd231pd	(%rdx,%rax), %ymm2, %ymm0
	vmovupd	%ymm0, (%rdi,%rax)
	addq	$32, %rax
	cmpq	%rax, %r12
	jne	.L25
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
	movq	-1120(%rbp), %rdi
	cmpq	%rdi, -1176(%rbp)
	je	.L26
	movq	-1208(%rbp), %rdi
.L21:
	leaq	(%rsi,%rdi), %rdx
	leaq	0(,%rdx,8), %r8
	leaq	1(%rdi), %rax
	leaq	(%r15,%r8), %r9
	cmpq	-1120(%rbp), %rax
	jge	.L36
	cmpq	%rdi, -1128(%rbp)
	jle	.L36
	movq	%rdx, %rbx
	subq	%r14, %rbx
	vmovsd	(%r15,%rbx,8), %xmm1
	vmovsd	8(%r15,%r8), %xmm0
	leaq	(%r14,%rdx), %r10
	vaddsd	-8(%r9), %xmm0, %xmm0
	vaddsd	(%r15,%r10,8), %xmm1, %xmm1
	vmovsd	(%r9), %xmm6
	movq	%rdx, %r9
	subq	%r13, %r9
	vaddsd	%xmm0, %xmm1, %xmm1
	vmovsd	(%r15,%r9,8), %xmm0
	addq	%r13, %rdx
	vaddsd	(%r15,%rdx,8), %xmm0, %xmm0
	movq	-1136(%rbp), %rbx
	addq	%rsi, %rax
	vaddsd	%xmm0, %xmm1, %xmm1
	leaq	(%r14,%rax), %rdx
	vmovsd	(%r15,%rax,8), %xmm7
	vmulsd	%xmm5, %xmm1, %xmm1
	movq	-1120(%rbp), %r11
	vfmadd231sd	%xmm6, %xmm4, %xmm1
	vaddsd	8(%r15,%rax,8), %xmm6, %xmm6
	vmovsd	%xmm1, (%rbx,%r8)
	movq	%rax, %r8
	subq	%r14, %r8
	vmovsd	(%r15,%r8,8), %xmm0
	movq	%rax, %r8
	vaddsd	(%r15,%rdx,8), %xmm0, %xmm0
	subq	%r13, %r8
	leaq	0(%r13,%rax), %rdx
	vaddsd	%xmm6, %xmm0, %xmm0
	vmovsd	(%r15,%r8,8), %xmm6
	vaddsd	(%r15,%rdx,8), %xmm6, %xmm6
	leaq	3(%rdi), %rdx
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmadd231sd	%xmm7, %xmm4, %xmm0
	vmovsd	%xmm0, (%rbx,%rax,8)
	leaq	2(%rdi), %rax
	cmpq	%rdx, %r11
	jle	.L27
	addq	%rsi, %rax
	movq	%rax, %r9
	subq	%r14, %r9
	vmovsd	(%r15,%r9,8), %xmm1
	leaq	(%r14,%rax), %r8
	movq	%rax, %r9
	vaddsd	8(%r15,%rax,8), %xmm7, %xmm7
	vaddsd	(%r15,%r8,8), %xmm1, %xmm1
	subq	%r13, %r9
	vmovsd	(%r15,%r9,8), %xmm0
	leaq	0(%r13,%rax), %r8
	vaddsd	(%r15,%r8,8), %xmm0, %xmm0
	vaddsd	%xmm7, %xmm1, %xmm1
	vmovsd	(%r15,%rax,8), %xmm6
	addq	%rsi, %rdx
	vaddsd	%xmm0, %xmm1, %xmm1
	movq	%rdx, %r8
	subq	%r14, %r8
	vmulsd	%xmm5, %xmm1, %xmm1
	vmovsd	(%r15,%r8,8), %xmm0
	movq	%rdx, %r8
	subq	%r13, %r8
	vmovsd	(%r15,%rdx,8), %xmm7
	vfmadd231sd	%xmm6, %xmm4, %xmm1
	vaddsd	8(%r15,%rdx,8), %xmm6, %xmm6
	vmovsd	%xmm1, (%rbx,%rax,8)
	leaq	(%r14,%rdx), %rax
	vaddsd	(%r15,%rax,8), %xmm0, %xmm0
	leaq	0(%r13,%rdx), %rax
	vaddsd	%xmm6, %xmm0, %xmm0
	vmovsd	(%r15,%r8,8), %xmm6
	vaddsd	(%r15,%rax,8), %xmm6, %xmm6
	leaq	4(%rdi), %rax
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmadd231sd	%xmm7, %xmm4, %xmm0
	vmovsd	%xmm0, (%rbx,%rdx,8)
	leaq	5(%rdi), %rdx
	cmpq	%rdx, %r11
	jle	.L27
	addq	%rsi, %rax
	leaq	(%r14,%rax), %r9
	vmovsd	(%r15,%r9,8), %xmm1
	movq	%rax, %r8
	subq	%r14, %r8
	vaddsd	(%r15,%r8,8), %xmm1, %xmm1
	vaddsd	8(%r15,%rax,8), %xmm7, %xmm7
	leaq	0(%r13,%rax), %r9
	movq	%rax, %r8
	vmovsd	(%r15,%r9,8), %xmm0
	subq	%r13, %r8
	vaddsd	(%r15,%r8,8), %xmm0, %xmm0
	vaddsd	%xmm7, %xmm1, %xmm1
	vmovsd	(%r15,%rax,8), %xmm6
	addq	%rsi, %rdx
	vaddsd	%xmm0, %xmm1, %xmm1
	leaq	(%r14,%rdx), %r8
	vmovsd	(%r15,%r8,8), %xmm0
	vmulsd	%xmm5, %xmm1, %xmm1
	movq	%rdx, %r8
	subq	%r13, %r8
	vfmadd231sd	%xmm6, %xmm4, %xmm1
	vaddsd	8(%r15,%rdx,8), %xmm6, %xmm6
	vmovsd	%xmm1, (%rbx,%rax,8)
	movq	%rdx, %rax
	subq	%r14, %rax
	vaddsd	(%r15,%rax,8), %xmm0, %xmm0
	vmovsd	(%r15,%r8,8), %xmm1
	leaq	0(%r13,%rdx), %rax
	vaddsd	(%r15,%rax,8), %xmm1, %xmm1
	vaddsd	%xmm6, %xmm0, %xmm0
	leaq	6(%rdi), %rax
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmadd231sd	(%r15,%rdx,8), %xmm4, %xmm0
	vmovsd	%xmm0, (%rbx,%rdx,8)
.L27:
	leaq	(%rsi,%rax), %rdx
	movq	%rdx, %r9
	leaq	0(,%rdx,8), %rdi
	subq	%r14, %r9
	vmovsd	(%r15,%r9,8), %xmm0
	vmovsd	-8(%r15,%rdi), %xmm1
	leaq	(%r14,%rdx), %r8
	vaddsd	(%r15,%r8,8), %xmm0, %xmm0
	vaddsd	8(%r15,%rdi), %xmm1, %xmm1
	movq	%rdx, %r9
	subq	%r13, %r9
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%r15,%r9,8), %xmm1
	leaq	0(%r13,%rdx), %r8
	vaddsd	(%r15,%r8,8), %xmm1, %xmm1
	movq	-1136(%rbp), %rbx
	movq	-1128(%rbp), %r10
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmadd231sd	(%r15,%rdx,8), %xmm4, %xmm0
	leaq	1(%rax), %rdx
	vmovsd	%xmm0, (%rbx,%rdi)
	cmpq	%rdx, %r10
	jle	.L26
	addq	%rsi, %rdx
	movq	%rdx, %r9
	leaq	0(,%rdx,8), %rdi
	subq	%r14, %r9
	vmovsd	(%r15,%r9,8), %xmm0
	vmovsd	-8(%r15,%rdi), %xmm1
	leaq	(%r14,%rdx), %r8
	vaddsd	(%r15,%r8,8), %xmm0, %xmm0
	vaddsd	8(%r15,%rdi), %xmm1, %xmm1
	movq	%rdx, %r9
	subq	%r13, %r9
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%r15,%r9,8), %xmm1
	leaq	0(%r13,%rdx), %r8
	vaddsd	(%r15,%r8,8), %xmm1, %xmm1
	addq	$2, %rax
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmadd231sd	(%r15,%rdx,8), %xmm4, %xmm0
	vmovsd	%xmm0, (%rbx,%rdi)
	cmpq	%rax, %r10
	jle	.L26
	addq	%rsi, %rax
	movq	%rax, %r8
	leaq	0(,%rax,8), %rdx
	subq	%r14, %r8
	vmovsd	(%r15,%r8,8), %xmm0
	vmovsd	-8(%r15,%rdx), %xmm1
	leaq	(%r14,%rax), %rdi
	vaddsd	(%r15,%rdi,8), %xmm0, %xmm0
	vaddsd	8(%r15,%rdx), %xmm1, %xmm1
	movq	%rax, %r8
	subq	%r13, %r8
	vaddsd	%xmm1, %xmm0, %xmm0
	vmovsd	(%r15,%r8,8), %xmm1
	leaq	0(%r13,%rax), %rdi
	vaddsd	(%r15,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vmulsd	%xmm5, %xmm0, %xmm0
	vfmadd231sd	(%r15,%rax,8), %xmm4, %xmm0
	vmovsd	%xmm0, (%rbx,%rdx)
.L26:
	incq	-1112(%rbp)
	addq	%r13, %rsi
	movq	%rcx, %rdx
	movq	-1112(%rbp), %rax
	cmpq	%rax, -1144(%rbp)
	jne	.L23
	incq	-1264(%rbp)
	movq	-1232(%rbp), %rcx
	addq	%rcx, -1216(%rbp)
	movq	-1264(%rbp), %rax
	cmpq	-1224(%rbp), %rax
	jne	.L20
.L19:
	incl	-1276(%rbp)
	movl	-1276(%rbp), %eax
	cmpl	-1280(%rbp), %eax
	jne	.L28
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	vmovapd	%ymm2, -1264(%rbp)
	vmovsd	%xmm5, -1200(%rbp)
	vmovsd	%xmm4, -1112(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm1
	vmovsd	.LC7(%rip), %xmm4
	vsubsd	-1096(%rbp), %xmm1, %xmm1
	movl	-1276(%rbp), %eax
	vmovsd	-1200(%rbp), %xmm5
	addl	%eax, %eax
	vcomisd	%xmm1, %xmm4
	movl	%eax, -1280(%rbp)
	vmovsd	-1112(%rbp), %xmm4
	vmovapd	-1264(%rbp), %ymm2
	ja	.L29
	movl	%eax, %r12d
	sarl	%r12d
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm1, -1112(%rbp)
	vzeroupper
	call	gethostname
	movabsq	$7308041938491629923, %rax
	cmpq	%rax, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L68
.L30:
	vmovsd	.LC3(%rip), %xmm3
.L32:
	movl	-1268(%rbp), %esi
	movl	-1284(%rbp), %edx
	leal	-2(%rsi), %eax
	subl	$2, %edx
	imull	%edx, %eax
	movl	-1272(%rbp), %edx
	vxorps	%xmm6, %xmm6, %xmm6
	subl	$2, %edx
	imull	%edx, %eax
	vcvtsi2sdl	%r12d, %xmm6, %xmm2
	vmovsd	.LC8(%rip), %xmm9
	vcvtsi2sdl	%eax, %xmm6, %xmm0
	movslq	%eax, %rdx
	vmovapd	%xmm2, %xmm7
	movslq	%r12d, %rax
	vmulsd	%xmm0, %xmm2, %xmm2
	imulq	%rdx, %rax
	vmovsd	.LC10(%rip), %xmm10
	vmovsd	.LC12(%rip), %xmm11
	vmulsd	%xmm3, %xmm1, %xmm8
	vdivsd	%xmm1, %xmm2, %xmm2
	movl	$.LC14, %edi
	vdivsd	%xmm9, %xmm2, %xmm5
	vmulsd	.LC9(%rip), %xmm7, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vdivsd	%xmm9, %xmm5, %xmm5
	vmulsd	%xmm10, %xmm2, %xmm4
	vcvtsi2sdq	%rax, %xmm6, %xmm2
	leal	(%rsi,%rsi,2), %eax
	addl	%eax, %eax
	movl	%r12d, %esi
	vmulsd	.LC11(%rip), %xmm2, %xmm3
	vmulsd	%xmm11, %xmm0, %xmm2
	vcvtsi2sdl	%eax, %xmm6, %xmm0
	vmulsd	%xmm10, %xmm4, %xmm4
	movl	$6, %eax
	vmulsd	%xmm7, %xmm2, %xmm2
	vmulsd	%xmm11, %xmm0, %xmm0
	vdivsd	%xmm3, %xmm8, %xmm3
	vmulsd	.LC13(%rip), %xmm2, %xmm2
	vdivsd	%xmm9, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r15, %rdi
	call	free
	movq	-1136(%rbp), %rdi
	addq	$1256, %rsp
	popq	%rbx
	popq	%r12
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
.L66:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L67:
	movq	-1160(%rbp), %rax
	movl	$1, %edi
	leaq	(%rdx,%rax), %rcx
	jmp	.L21
.L36:
	movq	%rdi, %rax
	jmp	.L27
.L64:
	movslq	-1268(%rbp), %r12
	leal	-1(%r12), %edx
	jmp	.L9
.L68:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm3
	jne	.L30
	jmp	.L32
.L65:
	leal	-1(%r12), %edx
	jmp	.L9
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
	pushq	%r13
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	$610, %ebx
	subq	$2208, %rsp
	call	gethostname
	leaq	-2128(%rbp), %rsi
	leaq	-2096(%rbp), %rdi
	call	getFreq
	movl	$.LC15, %edi
	call	puts
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdq	-2128(%rbp), %xmm7, %xmm0
	leaq	-2096(%rbp), %rsi
	movl	$.LC17, %edi
	movl	$1, %eax
	vdivsd	.LC16(%rip), %xmm0, %xmm0
	call	printf
	movl	$.LC18, %edi
	call	puts
	movq	$34168, -2176(%rbp)
	movq	$4880, -2144(%rbp)
	movq	$609, -2160(%rbp)
	movq	$608, -2136(%rbp)
	.p2align 4,,10
	.p2align 3
.L90:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdl	%ebx, %xmm6, %xmm1
	movl	%ebx, -2192(%rbp)
	movl	%ebx, %r14d
	vucomisd	.LC19(%rip), %xmm1
	jnb	.L113
.L70:
	movq	-2144(%rbp), %rax
	movl	$64, %edi
	leaq	(%rax,%rax,8), %r13
	movq	%r13, %rsi
	call	aligned_alloc
	movq	%r13, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movq	%rax, %r13
	movl	%r14d, %eax
	shrl	$2, %eax
	salq	$5, %rax
	movl	%r15d, -2152(%rbp)
	movq	%rax, -2184(%rbp)
	movl	$3, -2168(%rbp)
	movl	%r14d, %r10d
	leaq	0(,%r15,8), %r11
	movq	%r12, %r9
	andl	$-4, %r10d
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L71:
	movl	$3, %edi
	movl	%edi, -2148(%rbp)
	movq	%r9, %rsi
	movl	%r8d, %ecx
	.p2align 4,,10
	.p2align 3
.L78:
	cmpq	$2, -2160(%rbp)
	jbe	.L91
	movq	-2184(%rbp), %rax
	movl	-2148(%rbp), %edi
	leaq	(%rsi,%rax), %rdx
	movq	%rsi, %rax
.L73:
	vmovapd	.LC4(%rip), %ymm7
	addq	$32, %rax
	vmovupd	%ymm7, -32(%rax)
	cmpq	%rdx, %rax
	jne	.L73
	movl	%edi, -2148(%rbp)
	movl	%r10d, %eax
	cmpl	%r14d, %r10d
	je	.L72
.L76:
	movq	.LC5(%rip), %rdi
	leal	(%rcx,%rax), %edx
	movslq	%edx, %rdx
	movq	%rdi, (%r12,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%ebx, %edx
	jl	.L114
.L72:
	addl	%r14d, %ecx
	addq	-2144(%rbp), %rsi
	decl	-2148(%rbp)
	jne	.L78
	addl	-2152(%rbp), %r8d
	addq	%r11, %r9
	decl	-2168(%rbp)
	jne	.L71
	cmpl	$2, -2192(%rbp)
	movl	$1, %eax
	cmovg	-2136(%rbp), %rax
	leaq	0(,%rbx,4), %r14
	movq	%rax, %rdi
	movq	%rax, -2248(%rbp)
	movq	%rbx, %rax
	salq	$5, %rax
	leaq	8(%rax), %rdx
	leaq	(%r12,%rdx), %rcx
	movq	%rcx, -2224(%rbp)
	leaq	(%r12,%rax), %rcx
	leaq	16(%r12,%rax), %rax
	movq	%rax, -2208(%rbp)
	leaq	8(%r12,%r11), %rax
	movq	%rax, -2200(%rbp)
	movq	-2144(%rbp), %rax
	movq	%rcx, -2216(%rbp)
	leaq	8(%rax,%rax,4), %rax
	addq	%r12, %rax
	movq	%rax, -2192(%rbp)
	leaq	0(%r13,%rdx), %rax
	movq	%rax, -2184(%rbp)
	movq	%rdi, %rax
	shrq	$2, %rax
	salq	$5, %rax
	andq	$-4, %rdi
	movq	%rax, -2256(%rbp)
	leaq	1(%rdi), %rax
	movq	%rax, -2232(%rbp)
	movq	%r14, %rax
	movq	%r13, %r14
	movq	%rax, %r13
	movq	%rdi, -2240(%rbp)
	movl	$1, -2148(%rbp)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L86:
	leaq	-2104(%rbp), %rsi
	leaq	-2120(%rbp), %rdi
	call	timing
	xorl	%r8d, %r8d
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L109:
	addq	%r13, %rdx
	movq	%rdx, %r9
	leaq	0(,%rdx,8), %rsi
	subq	%r15, %r9
	vmovsd	8(%r12,%rsi), %xmm5
	vmovsd	(%r12,%r9,8), %xmm3
	leaq	(%r15,%rdx), %rdi
	vaddsd	%xmm5, %xmm2, %xmm0
	vaddsd	(%r12,%rdi,8), %xmm3, %xmm3
	movq	%rdx, %rdi
	subq	%rbx, %rdi
	vaddsd	%xmm0, %xmm3, %xmm3
	vmovsd	(%r12,%rdi,8), %xmm0
	addq	%rbx, %rdx
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	vmovsd	.LC25(%rip), %xmm4
	addq	%r13, %rcx
	vaddsd	%xmm0, %xmm3, %xmm3
	vmovsd	.LC26(%rip), %xmm0
	movq	%rcx, %rdi
	vmulsd	%xmm4, %xmm3, %xmm3
	subq	%r15, %rdi
	leaq	0(,%rcx,8), %rdx
	vmovsd	(%r12,%rdi,8), %xmm2
	vfmadd231sd	%xmm0, %xmm6, %xmm3
	vmovsd	%xmm3, (%r14,%rsi)
	leaq	(%r15,%rcx), %rsi
	vmovsd	8(%r12,%rdx), %xmm3
	vaddsd	(%r12,%rsi,8), %xmm2, %xmm2
	movq	%rcx, %rsi
	vaddsd	%xmm3, %xmm6, %xmm6
	subq	%rbx, %rsi
	vmovsd	(%r12,%rsi,8), %xmm1
	addq	%rbx, %rcx
	vaddsd	(%r12,%rcx,8), %xmm1, %xmm1
	vaddsd	%xmm6, %xmm2, %xmm2
	leaq	5(%rax), %rcx
	vaddsd	%xmm1, %xmm2, %xmm2
	vmulsd	%xmm4, %xmm2, %xmm2
	vfmadd231sd	%xmm0, %xmm5, %xmm2
	vmovsd	%xmm2, (%r14,%rdx)
	leaq	4(%rax), %rdx
	cmpq	-2136(%rbp), %rcx
	jge	.L84
	addq	%r13, %rdx
	leaq	0(,%rdx,8), %rsi
	leaq	(%r15,%rdx), %r9
	vmovsd	8(%r12,%rsi), %xmm2
	movq	%rdx, %rdi
	vmovsd	(%r12,%r9,8), %xmm1
	subq	%r15, %rdi
	vaddsd	(%r12,%rdi,8), %xmm1, %xmm1
	vaddsd	%xmm5, %xmm2, %xmm5
	leaq	(%rbx,%rdx), %rdi
	subq	%rbx, %rdx
	vaddsd	%xmm5, %xmm1, %xmm1
	vmovsd	(%r12,%rdi,8), %xmm5
	addq	%r13, %rcx
	vaddsd	(%r12,%rdx,8), %xmm5, %xmm5
	leaq	(%rcx,%r15), %rdx
	vaddsd	%xmm5, %xmm1, %xmm1
	vmulsd	%xmm4, %xmm1, %xmm1
	vfmadd231sd	%xmm0, %xmm3, %xmm1
	vaddsd	8(%r12,%rcx,8), %xmm3, %xmm3
	vmovsd	%xmm1, (%r14,%rsi)
	movq	%rcx, %rsi
	subq	%r15, %rsi
	vmovsd	(%r12,%rsi,8), %xmm1
	leaq	(%rcx,%rbx), %rsi
	vaddsd	(%r12,%rdx,8), %xmm1, %xmm1
	movq	%rcx, %rdx
	subq	%rbx, %rdx
	vaddsd	%xmm3, %xmm1, %xmm1
	vmovsd	(%r12,%rsi,8), %xmm3
	vaddsd	(%r12,%rdx,8), %xmm3, %xmm3
	leaq	6(%rax), %rdx
	vaddsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm4, %xmm1, %xmm1
	vfmadd231sd	%xmm0, %xmm2, %xmm1
	vmovsd	%xmm1, (%r14,%rcx,8)
.L84:
	leaq	(%rdx,%r13), %rax
	leaq	0(,%rax,8), %rcx
	leaq	(%rax,%r15), %rdi
	vmovsd	(%r12,%rdi,8), %xmm1
	movq	%rax, %rsi
	vmovsd	8(%r12,%rcx), %xmm2
	subq	%r15, %rsi
	vaddsd	(%r12,%rsi,8), %xmm1, %xmm1
	vaddsd	-8(%r12,%rcx), %xmm2, %xmm2
	movq	%rax, %rdi
	subq	%rbx, %rdi
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	(%r12,%rdi,8), %xmm2
	leaq	(%rax,%rbx), %rsi
	vaddsd	(%r12,%rsi,8), %xmm2, %xmm2
	movq	-2160(%rbp), %r10
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm4, %xmm1, %xmm1
	vfmadd231sd	(%r12,%rax,8), %xmm0, %xmm1
	leaq	1(%rdx), %rax
	vmovsd	%xmm1, (%r14,%rcx)
	cmpq	%r10, %rax
	jge	.L83
	addq	%r13, %rax
	movq	%rax, %rdi
	leaq	0(,%rax,8), %rcx
	subq	%r15, %rdi
	vmovsd	(%r12,%rdi,8), %xmm1
	vmovsd	-8(%r12,%rcx), %xmm2
	leaq	(%r15,%rax), %rsi
	vaddsd	(%r12,%rsi,8), %xmm1, %xmm1
	vaddsd	8(%r12,%rcx), %xmm2, %xmm2
	movq	%rax, %rdi
	subq	%rbx, %rdi
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	(%r12,%rdi,8), %xmm2
	leaq	(%rbx,%rax), %rsi
	vaddsd	(%r12,%rsi,8), %xmm2, %xmm2
	addq	$2, %rdx
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm4, %xmm1, %xmm1
	vfmadd231sd	(%r12,%rax,8), %xmm0, %xmm1
	vmovsd	%xmm1, (%r14,%rcx)
	cmpq	%r10, %rdx
	jge	.L83
	addq	%r13, %rdx
	movq	%rdx, %rsi
	leaq	0(,%rdx,8), %rax
	subq	%r15, %rsi
	vmovsd	(%r12,%rsi,8), %xmm1
	vmovsd	-8(%r12,%rax), %xmm2
	leaq	(%r15,%rdx), %rcx
	vaddsd	(%r12,%rcx,8), %xmm1, %xmm1
	vaddsd	8(%r12,%rax), %xmm2, %xmm2
	movq	%rdx, %rsi
	subq	%rbx, %rsi
	vaddsd	%xmm2, %xmm1, %xmm1
	vmovsd	(%r12,%rsi,8), %xmm2
	leaq	(%rbx,%rdx), %rcx
	vaddsd	(%r12,%rcx,8), %xmm2, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm1
	vmulsd	%xmm4, %xmm1, %xmm1
	vfmadd132sd	(%r12,%rdx,8), %xmm1, %xmm0
	vmovsd	%xmm0, (%r14,%rax)
.L83:
	incl	%r8d
	cmpl	-2148(%rbp), %r8d
	je	.L115
.L85:
	vmovsd	(%r12), %xmm0
	vxorpd	%xmm7, %xmm7, %xmm7
	vcomisd	%xmm7, %xmm0
	jbe	.L79
	movq	%r12, %rdi
	movl	%r8d, -2168(%rbp)
	vzeroupper
	call	dummy
	movl	-2168(%rbp), %r8d
.L79:
	cmpq	$5, %rbx
	jbe	.L92
	movq	-2144(%rbp), %rax
	movq	-2200(%rbp), %rsi
	leaq	8(%r12,%rax), %rcx
	movq	-2176(%rbp), %rax
	movq	-2216(%rbp), %rdi
	leaq	(%r12,%rax), %rdx
	xorl	%eax, %eax
.L82:
	movq	-2208(%rbp), %r11
	vmovupd	(%rdx,%rax), %ymm7
	vmovupd	(%r11,%rax), %ymm6
	movq	-2192(%rbp), %r9
	vaddpd	(%rdi,%rax), %ymm6, %ymm1
	vaddpd	(%rcx,%rax), %ymm7, %ymm0
	vmovupd	(%r9,%rax), %ymm7
	movq	-2224(%rbp), %r11
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	(%rsi,%rax), %ymm7, %ymm1
	vmovupd	(%r11,%rax), %ymm6
	movq	-2184(%rbp), %r10
	vaddpd	%ymm1, %ymm0, %ymm0
	vmulpd	.LC21(%rip), %ymm0, %ymm0
	vfmadd231pd	.LC22(%rip), %ymm6, %ymm0
	vmovupd	%ymm0, (%r10,%rax)
	addq	$32, %rax
	cmpq	%rax, -2256(%rbp)
	jne	.L82
	movq	-2248(%rbp), %rcx
	cmpq	%rcx, -2240(%rbp)
	je	.L83
	movq	-2232(%rbp), %rax
.L81:
	leaq	0(%r13,%rax), %rdx
	movq	-2136(%rbp), %r11
	leaq	0(,%rdx,8), %rsi
	leaq	1(%rax), %rcx
	leaq	(%r12,%rsi), %rdi
	cmpq	%r11, %rcx
	jge	.L93
	cmpq	-2160(%rbp), %rax
	jge	.L93
	leaq	(%rdx,%rbx), %r10
	addq	%r13, %rcx
	vmovsd	(%r12,%r10,8), %xmm0
	vmovsd	8(%r12,%rcx,8), %xmm6
	addq	%rbx, %rcx
	vmovhpd	(%r12,%rcx,8), %xmm0, %xmm0
	movq	%rdx, %rcx
	subq	%rbx, %rcx
	vaddpd	(%r12,%rcx,8), %xmm0, %xmm0
	leaq	8(%r12,%rsi), %r9
	leaq	(%rdx,%r15), %rcx
	subq	%r15, %rdx
	vmovupd	(%r12,%rdx,8), %xmm1
	vmovupd	(%r9), %xmm7
	vaddpd	(%r12,%rcx,8), %xmm1, %xmm1
	vaddpd	-8(%rdi), %xmm7, %xmm3
	vmovupd	(%rdi), %xmm7
	leaq	3(%rax), %rcx
	vaddpd	%xmm3, %xmm1, %xmm1
	vmovsd	(%r9), %xmm2
	leaq	2(%rax), %rdx
	vaddpd	%xmm1, %xmm0, %xmm0
	vmulpd	.LC23(%rip), %xmm0, %xmm0
	vfmadd231pd	.LC24(%rip), %xmm7, %xmm0
	vmovups	%xmm0, (%r14,%rsi)
	cmpq	%r11, %rcx
	jl	.L109
.L112:
	vmovsd	.LC25(%rip), %xmm4
	vmovsd	.LC26(%rip), %xmm0
	jmp	.L84
	.p2align 4,,10
	.p2align 3
.L92:
	movl	$1, %eax
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L91:
	xorl	%eax, %eax
	jmp	.L76
	.p2align 4,,10
	.p2align 3
.L114:
	addl	%ecx, %edx
	movslq	%edx, %rdx
	addl	$2, %eax
	movq	%rdi, (%r12,%rdx,8)
	cmpl	%ebx, %eax
	jge	.L72
	addl	%ecx, %eax
	cltq
	movq	%rdi, (%r12,%rax,8)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L93:
	movq	%rax, %rdx
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L115:
	leaq	-2104(%rbp), %rsi
	leaq	-2112(%rbp), %rdi
	movl	%r8d, -2148(%rbp)
	vzeroupper
	call	timing
	vmovsd	-2112(%rbp), %xmm1
	vmovsd	.LC7(%rip), %xmm6
	vsubsd	-2120(%rbp), %xmm1, %xmm1
	movl	-2148(%rbp), %r8d
	vcomisd	%xmm1, %xmm6
	leal	(%r8,%r8), %eax
	movl	%eax, -2148(%rbp)
	ja	.L86
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm1, -2168(%rbp)
	movq	%r14, %r13
	movl	%eax, %r14d
	call	gethostname
	movabsq	$7308041938491629923, %rax
	sarl	%r14d
	cmpq	%rax, -1072(%rbp)
	vmovsd	-2168(%rbp), %xmm1
	je	.L116
.L87:
	vmovsd	.LC3(%rip), %xmm7
.L89:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdl	%r14d, %xmm3, %xmm2
	movq	-2136(%rbp), %rsi
	movslq	%r14d, %rax
	vcvtsi2sdl	%esi, %xmm3, %xmm0
	vmulsd	.LC9(%rip), %xmm2, %xmm4
	vmovapd	%xmm2, %xmm6
	imulq	%rsi, %rax
	vmulsd	%xmm0, %xmm2, %xmm5
	vmulsd	.LC12(%rip), %xmm0, %xmm2
	vmulsd	%xmm0, %xmm4, %xmm4
	vmovapd	%xmm3, %xmm8
	vcvtsi2sdq	%rax, %xmm3, %xmm3
	vmulsd	%xmm7, %xmm1, %xmm7
	vmulsd	%xmm6, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm4, %xmm4
	vmulsd	.LC11(%rip), %xmm3, %xmm3
	movl	-2152(%rbp), %eax
	movq	%rsi, %rdx
	vmulsd	.LC13(%rip), %xmm2, %xmm2
	addl	%eax, %eax
	vcvtsi2sdl	%eax, %xmm8, %xmm0
	movl	%r14d, %esi
	movl	$.LC14, %edi
	movl	$6, %eax
	vmulsd	.LC12(%rip), %xmm0, %xmm0
	subq	$32, %rbx
	subq	$96, %r15
	vdivsd	.LC8(%rip), %xmm0, %xmm0
	vdivsd	%xmm1, %xmm5, %xmm5
	vmulsd	.LC10(%rip), %xmm4, %xmm4
	vmulsd	.LC10(%rip), %xmm4, %xmm4
	vdivsd	%xmm3, %xmm7, %xmm3
	vdivsd	.LC8(%rip), %xmm5, %xmm5
	vdivsd	.LC8(%rip), %xmm5, %xmm5
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	subq	$32, -2136(%rbp)
	subq	$32, -2160(%rbp)
	subq	$256, -2144(%rbp)
	subq	$1792, -2176(%rbp)
	cmpq	$290, %rbx
	jne	.L90
	addq	$2208, %rsp
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
.L116:
	.cfi_restore_state
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm7
	jne	.L87
	jmp	.L89
.L113:
	vmovsd	.LC20(%rip), %xmm0
	call	pow
	jmp	.L70
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
