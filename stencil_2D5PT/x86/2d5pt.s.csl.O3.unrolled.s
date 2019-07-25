	.file	"2d5pt.c"
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
	movl	%edi, %eax
	imull	%esi, %eax
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
	movslq	%eax, %r14
	salq	$3, %r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	pushq	%r12
	pushq	%rbx
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movl	%edi, %ebx
	subq	$1160, %rsp
	movl	%edi, -1192(%rbp)
	movl	%esi, -1188(%rbp)
	movl	$64, %edi
	movq	%r14, %rsi
	vmovsd	%xmm0, -1112(%rbp)
	movl	%eax, -1196(%rbp)
	call	aligned_alloc
	movq	%r14, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	testl	%ebx, %ebx
	vmovsd	-1112(%rbp), %xmm9
	movq	%rax, %r13
	jle	.L111
	movl	-1188(%rbp), %edx
	testl	%edx, %edx
	jle	.L111
	movslq	-1188(%rbp), %r10
	vmovsd	.LC5(%rip), %xmm1
	movq	%r10, %r15
	movl	%r15d, %edi
	shrl	$2, %edi
	movl	%edi, %ecx
	movl	%r15d, %r11d
	vmovapd	.LC4(%rip), %ymm0
	salq	$3, %r10
	movq	%r12, %rsi
	leal	-1(%r15), %r8d
	salq	$5, %rcx
	andl	$-4, %r11d
	xorl	%edi, %edi
	xorl	%r9d, %r9d
	movl	%r15d, %ebx
.L10:
	cmpl	$2, %r8d
	jbe	.L112
	leaq	-32(%rcx), %rdx
	shrq	$5, %rdx
	incq	%rdx
	leaq	(%rsi,%rcx), %r14
	movq	%rsi, %r15
	andl	$7, %edx
	je	.L11
	cmpq	$1, %rdx
	je	.L77
	cmpq	$2, %rdx
	je	.L78
	cmpq	$3, %rdx
	je	.L79
	cmpq	$4, %rdx
	je	.L80
	cmpq	$5, %rdx
	je	.L81
	cmpq	$6, %rdx
	je	.L82
	vmovupd	%ymm0, (%rsi)
	leaq	32(%rsi), %r15
.L82:
	vmovupd	%ymm0, (%r15)
	addq	$32, %r15
.L81:
	vmovupd	%ymm0, (%r15)
	addq	$32, %r15
.L80:
	vmovupd	%ymm0, (%r15)
	addq	$32, %r15
.L79:
	vmovupd	%ymm0, (%r15)
	addq	$32, %r15
.L78:
	vmovupd	%ymm0, (%r15)
	addq	$32, %r15
.L77:
	vmovupd	%ymm0, (%r15)
	addq	$32, %r15
	cmpq	%r14, %r15
	je	.L105
.L11:
	vmovupd	%ymm0, (%r15)
	vmovupd	%ymm0, 32(%r15)
	vmovupd	%ymm0, 64(%r15)
	vmovupd	%ymm0, 96(%r15)
	vmovupd	%ymm0, 128(%r15)
	vmovupd	%ymm0, 160(%r15)
	vmovupd	%ymm0, 192(%r15)
	vmovupd	%ymm0, 224(%r15)
	addq	$256, %r15
	cmpq	%r14, %r15
	jne	.L11
.L105:
	movl	%r11d, %eax
	cmpl	%ebx, %r11d
	je	.L12
.L13:
	leal	(%rdi,%rax), %r14d
	movslq	%r14d, %rdx
	leal	1(%rax), %r15d
	vmovsd	%xmm1, (%r12,%rdx,8)
	cmpl	%r15d, %ebx
	jle	.L12
	addl	%edi, %r15d
	movslq	%r15d, %r14
	addl	$2, %eax
	vmovsd	%xmm1, (%r12,%r14,8)
	cmpl	%eax, %ebx
	jle	.L12
	addl	%edi, %eax
	cltq
	vmovsd	%xmm1, (%r12,%rax,8)
.L12:
	incl	%r9d
	addl	%ebx, %edi
	addq	%r10, %rsi
	cmpl	%r9d, -1192(%rbp)
	jne	.L10
	vzeroupper
.L9:
	movslq	%r8d, %rcx
	movl	-1192(%rbp), %eax
	leaq	-1(%rcx), %rbx
	movq	%rbx, %r14
	movq	%rbx, -1112(%rbp)
	decl	%eax
	andq	$-4, %rbx
	leaq	1(%rbx), %rsi
	movq	%rcx, -1120(%rbp)
	cltq
	subq	$2, %rcx
	movq	%rax, -1128(%rbp)
	movq	%rcx, -1136(%rbp)
	movq	%rsi, -1152(%rbp)
	movl	$1, -1160(%rbp)
	movq	%rbx, -1144(%rbp)
	shrq	$2, %r14
	movslq	-1188(%rbp), %rbx
	salq	$5, %r14
	vmovddup	%xmm9, %xmm11
.L27:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	vmovaps	%xmm11, -1184(%rbp)
	vmovsd	%xmm9, -1168(%rbp)
	call	timing
	movl	$0, -1156(%rbp)
	vmovapd	-1184(%rbp), %xmm3
	vmovsd	-1168(%rbp), %xmm2
	.p2align 4,,10
	.p2align 3
.L18:
	vmovsd	(%r12), %xmm4
	vxorpd	%xmm5, %xmm5, %xmm5
	vcomisd	%xmm5, %xmm4
	jbe	.L15
	movq	%r12, %rdi
	vmovaps	%xmm3, -1184(%rbp)
	vmovsd	%xmm2, -1168(%rbp)
	vzeroupper
	call	dummy
	vmovapd	-1184(%rbp), %xmm3
	vmovsd	-1168(%rbp), %xmm2
.L15:
	cmpq	$1, -1128(%rbp)
	jle	.L20
	cmpq	$1, -1120(%rbp)
	jle	.L20
	movl	$1, %r15d
	vbroadcastsd	%xmm2, %ymm1
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%rbx, %r11
	imulq	%r15, %r11
	cmpq	$2, -1136(%rbp)
	jbe	.L113
	leaq	1(%r11), %rdi
	leaq	-32(%r14), %rcx
	movq	%rdi, %rax
	shrq	$5, %rcx
	leaq	0(,%rdi,8), %rdx
	subq	%rbx, %rax
	addq	%rbx, %rdi
	incq	%rcx
	leaq	(%r12,%rdx), %r10
	leaq	-8(%r12,%rdx), %r9
	leaq	(%r12,%rax,8), %r8
	leaq	(%r12,%rdi,8), %rdi
	leaq	16(%r12,%r11,8), %rsi
	addq	%r13, %rdx
	xorl	%eax, %eax
	andl	$3, %ecx
	je	.L24
	cmpq	$1, %rcx
	je	.L83
	cmpq	$2, %rcx
	je	.L84
	vmovupd	(%r9), %ymm6
	movl	$32, %eax
	vaddpd	(%r10), %ymm6, %ymm7
	vaddpd	(%r8), %ymm7, %ymm8
	vaddpd	(%rdi), %ymm8, %ymm9
	vaddpd	(%rsi), %ymm9, %ymm10
	vmulpd	%ymm1, %ymm10, %ymm11
	vmovupd	%ymm11, (%rdx)
.L84:
	vmovupd	(%r9,%rax), %ymm12
	vaddpd	(%r10,%rax), %ymm12, %ymm13
	vaddpd	(%r8,%rax), %ymm13, %ymm14
	vaddpd	(%rdi,%rax), %ymm14, %ymm15
	vaddpd	(%rsi,%rax), %ymm15, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm4
	vmovupd	%ymm4, (%rdx,%rax)
	addq	$32, %rax
.L83:
	vmovupd	(%r9,%rax), %ymm5
	vaddpd	(%r10,%rax), %ymm5, %ymm6
	vaddpd	(%r8,%rax), %ymm6, %ymm7
	vaddpd	(%rdi,%rax), %ymm7, %ymm8
	vaddpd	(%rsi,%rax), %ymm8, %ymm9
	vmulpd	%ymm1, %ymm9, %ymm10
	vmovupd	%ymm10, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%rax, %r14
	je	.L104
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
    # LLVM-MCA-BEGIN
.L24:
	vmovupd	(%r9,%rax), %ymm11
	vmovupd	32(%r9,%rax), %ymm4
	vaddpd	(%r10,%rax), %ymm11, %ymm12
	vmovupd	64(%r9,%rax), %ymm10
	vaddpd	32(%r10,%rax), %ymm4, %ymm5
	vaddpd	(%r8,%rax), %ymm12, %ymm13
	vaddpd	64(%r10,%rax), %ymm10, %ymm11
	vaddpd	32(%r8,%rax), %ymm5, %ymm6
	vaddpd	(%rdi,%rax), %ymm13, %ymm14
	vaddpd	64(%r8,%rax), %ymm11, %ymm12
	vaddpd	32(%rdi,%rax), %ymm6, %ymm7
	vaddpd	(%rsi,%rax), %ymm14, %ymm15
	vaddpd	64(%rdi,%rax), %ymm12, %ymm13
	vaddpd	32(%rsi,%rax), %ymm7, %ymm8
	vmulpd	%ymm1, %ymm15, %ymm0
	vaddpd	64(%rsi,%rax), %ymm13, %ymm14
	vmulpd	%ymm1, %ymm8, %ymm9
	vmulpd	%ymm1, %ymm14, %ymm15
	vmovupd	%ymm0, (%rdx,%rax)
	vmovupd	96(%r9,%rax), %ymm0
	vmovupd	%ymm9, 32(%rdx,%rax)
	vaddpd	96(%r10,%rax), %ymm0, %ymm4
	vmovupd	%ymm15, 64(%rdx,%rax)
	vaddpd	96(%r8,%rax), %ymm4, %ymm5
	vaddpd	96(%rdi,%rax), %ymm5, %ymm6
	vaddpd	96(%rsi,%rax), %ymm6, %ymm7
	vmulpd	%ymm1, %ymm7, %ymm8
	vmovupd	%ymm8, 96(%rdx,%rax)
	subq	$-128, %rax
	cmpq	%rax, %r14
	jne	.L24
    # LLVM-MCA-END
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L104:
	movq	-1112(%rbp), %rdx
	cmpq	%rdx, -1144(%rbp)
	je	.L25
	movq	-1152(%rbp), %r8
	movq	%rdx, %r9
.L21:
	leaq	(%r11,%r8), %r10
	leaq	0(,%r10,8), %rsi
	leaq	1(%r8), %rcx
	leaq	(%r12,%rsi), %rdi
	cmpq	%rcx, %r9
	jle	.L33
	cmpq	%r8, -1120(%rbp)
	jle	.L33
	vmovupd	(%rdi), %xmm11
	leaq	8(%r12,%rsi), %rax
	vaddpd	-8(%rdi), %xmm11, %xmm12
	movq	%r10, %rsi
	subq	%rbx, %rsi
	vaddpd	(%r12,%rsi,8), %xmm12, %xmm13
	leaq	(%rbx,%r10), %rdi
	leaq	1(%r11,%rcx), %rdx
	vaddpd	(%r12,%rdi,8), %xmm13, %xmm14
	vmovsd	(%r12,%rdx,8), %xmm10
	vmovsd	(%rax), %xmm9
	vaddpd	(%rax), %xmm14, %xmm15
	leaq	2(%r8), %rdx
	vmulpd	%xmm3, %xmm15, %xmm0
	vmovups	%xmm0, 0(%r13,%r10,8)
	leaq	3(%r8), %r10
	cmpq	%r10, %r9
	jle	.L26
	addq	%r11, %rdx
	vaddsd	%xmm10, %xmm9, %xmm4
	movq	%rdx, %rcx
	subq	%rbx, %rcx
	vaddsd	(%r12,%rcx,8), %xmm4, %xmm5
	leaq	(%rbx,%rdx), %rax
	vmovsd	8(%r12,%rdx,8), %xmm6
	vaddsd	(%r12,%rax,8), %xmm5, %xmm7
	addq	%r11, %r10
	vaddsd	%xmm6, %xmm10, %xmm10
	vaddsd	%xmm6, %xmm7, %xmm8
	leaq	(%rbx,%r10), %rsi
	vmovsd	8(%r12,%r10,8), %xmm11
	vmulsd	%xmm2, %xmm8, %xmm9
	leaq	5(%r8), %rdi
	vmovsd	%xmm9, 0(%r13,%rdx,8)
	movq	%r10, %rdx
	subq	%rbx, %rdx
	vaddsd	(%r12,%rdx,8), %xmm10, %xmm12
	leaq	4(%r8), %rdx
	vaddsd	(%r12,%rsi,8), %xmm12, %xmm13
	vaddsd	%xmm11, %xmm13, %xmm14
	vmulsd	%xmm2, %xmm14, %xmm15
	vmovsd	%xmm15, 0(%r13,%r10,8)
	cmpq	%rdi, %r9
	jle	.L26
	addq	%r11, %rdx
	vmovsd	8(%r12,%rdx,8), %xmm4
	addq	%r11, %rdi
	vaddsd	%xmm11, %xmm6, %xmm0
	vaddsd	%xmm11, %xmm4, %xmm9
	movq	%rdx, %r10
	movq	%rdi, %rcx
	subq	%rbx, %r10
	subq	%rbx, %rcx
	vaddsd	(%r12,%r10,8), %xmm0, %xmm6
	vaddsd	(%r12,%rcx,8), %xmm9, %xmm11
	leaq	(%rbx,%rdx), %r9
	leaq	(%rbx,%rdi), %rax
	vaddsd	(%r12,%r9,8), %xmm6, %xmm5
	vaddsd	(%r12,%rax,8), %xmm11, %xmm10
	vaddsd	%xmm4, %xmm5, %xmm7
	vaddsd	8(%r12,%rdi,8), %xmm10, %xmm12
	vmulsd	%xmm2, %xmm7, %xmm8
	vmulsd	%xmm2, %xmm12, %xmm13
	vmovsd	%xmm8, 0(%r13,%rdx,8)
	vmovsd	%xmm13, 0(%r13,%rdi,8)
	leaq	6(%r8), %rdx
.L26:
	leaq	(%r11,%rdx), %r8
	leaq	0(,%r8,8), %rdi
	vmovsd	-8(%r12,%rdi), %xmm14
	movq	%r8, %rsi
	vaddsd	(%r12,%r8,8), %xmm14, %xmm15
	subq	%rbx, %rsi
	leaq	(%rbx,%r8), %r10
	vaddsd	(%r12,%rsi,8), %xmm15, %xmm4
	movq	-1120(%rbp), %rax
	leaq	1(%rdx), %r9
	vaddsd	(%r12,%r10,8), %xmm4, %xmm0
	vaddsd	8(%r12,%rdi), %xmm0, %xmm6
	vmulsd	%xmm2, %xmm6, %xmm5
	vmovsd	%xmm5, 0(%r13,%r8,8)
	cmpq	%r9, %rax
	jle	.L25
	addq	%r11, %r9
	leaq	0(,%r9,8), %rcx
	vmovsd	-8(%r12,%rcx), %xmm7
	movq	%r9, %r8
	vaddsd	(%r12,%r9,8), %xmm7, %xmm8
	subq	%rbx, %r8
	leaq	(%rbx,%r9), %rdi
	vaddsd	(%r12,%r8,8), %xmm8, %xmm9
	addq	$2, %rdx
	vaddsd	(%r12,%rdi,8), %xmm9, %xmm11
	vaddsd	8(%r12,%rcx), %xmm11, %xmm10
	vmulsd	%xmm2, %xmm10, %xmm12
	vmovsd	%xmm12, 0(%r13,%r9,8)
	cmpq	%rdx, %rax
	jle	.L25
	addq	%rdx, %r11
	leaq	0(,%r11,8), %rsi
	vmovsd	-8(%r12,%rsi), %xmm13
	movq	%r11, %rdx
	vaddsd	(%r12,%r11,8), %xmm13, %xmm14
	subq	%rbx, %rdx
	leaq	(%rbx,%r11), %r10
	vaddsd	(%r12,%rdx,8), %xmm14, %xmm15
	vaddsd	(%r12,%r10,8), %xmm15, %xmm4
	vaddsd	8(%r12,%rsi), %xmm4, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm6
	vmovsd	%xmm6, 0(%r13,%r11,8)
.L25:
	incq	%r15
	cmpq	-1128(%rbp), %r15
	jl	.L23
.L20:
	incl	-1156(%rbp)
	movl	-1156(%rbp), %r11d
	cmpl	-1160(%rbp), %r11d
	jne	.L18
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	vmovaps	%xmm3, -1184(%rbp)
	vmovsd	%xmm2, -1168(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm5
	movl	-1156(%rbp), %r9d
	vsubsd	-1096(%rbp), %xmm5, %xmm7
	vmovsd	.LC7(%rip), %xmm8
	addl	%r9d, %r9d
	vcomisd	%xmm7, %xmm8
	movl	%r9d, -1160(%rbp)
	vmovsd	-1168(%rbp), %xmm9
	vmovapd	-1184(%rbp), %xmm11
	ja	.L27
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	movl	%r9d, %ebx
	vmovsd	%xmm7, -1112(%rbp)
	call	gethostname
	movabsq	$7308041938491629923, %rax
	sarl	%ebx
	cmpq	%rax, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L114
.L28:
	vmovsd	.LC3(%rip), %xmm12
.L30:
	movl	-1192(%rbp), %ecx
	movl	-1188(%rbp), %r8d
	subl	$2, %ecx
	subl	$2, %r8d
	imull	%r8d, %ecx
	vxorps	%xmm13, %xmm13, %xmm13
	vcvtsi2sdl	%ebx, %xmm13, %xmm7
	vcvtsi2sdl	%ecx, %xmm13, %xmm15
	vmovsd	.LC8(%rip), %xmm6
	movslq	%ecx, %rdx
	vmulsd	.LC9(%rip), %xmm7, %xmm0
	vmulsd	%xmm15, %xmm7, %xmm10
	movslq	%ebx, %rdi
	imulq	%rdx, %rdi
	movl	-1196(%rbp), %esi
	vmulsd	%xmm15, %xmm0, %xmm2
	vdivsd	%xmm1, %xmm10, %xmm4
	vmovsd	.LC12(%rip), %xmm10
	vmovapd	%xmm7, %xmm14
	vmulsd	%xmm10, %xmm15, %xmm15
	subl	$4, %esi
	vcvtsi2sdq	%rdi, %xmm13, %xmm11
	vcvtsi2sdl	%esi, %xmm13, %xmm13
	vmulsd	%xmm12, %xmm1, %xmm8
	vmulsd	%xmm14, %xmm15, %xmm14
	vmulsd	.LC11(%rip), %xmm11, %xmm12
	vmovsd	.LC10(%rip), %xmm9
	movl	%ebx, %esi
	movl	$.LC14, %edi
	movl	$6, %eax
	vdivsd	%xmm1, %xmm2, %xmm3
	vmulsd	.LC13(%rip), %xmm14, %xmm2
	vdivsd	%xmm6, %xmm4, %xmm5
	vmulsd	%xmm10, %xmm13, %xmm4
	vmulsd	%xmm9, %xmm3, %xmm7
	vdivsd	%xmm6, %xmm4, %xmm0
	vmulsd	%xmm9, %xmm7, %xmm4
	vdivsd	%xmm6, %xmm5, %xmm5
	vdivsd	%xmm12, %xmm8, %xmm3
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	addq	$1160, %rsp
	popq	%rbx
	popq	%r12
	popq	%rdx
	.cfi_remember_state
	.cfi_def_cfa 13, 0
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-16(%rdx), %rsp
	.cfi_def_cfa 7, 16
	movq	%r13, %rdi
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	free
	.p2align 4,,10
	.p2align 3
.L113:
	.cfi_restore_state
	movq	-1112(%rbp), %r9
	movl	$1, %r8d
	jmp	.L21
.L33:
	movq	%r8, %rdx
	jmp	.L26
.L112:
	xorl	%eax, %eax
	jmp	.L13
.L114:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm12
	jne	.L28
	jmp	.L30
.L111:
	movl	-1188(%rbp), %ecx
	leal	-1(%rcx), %r8d
	jmp	.L9
	.cfi_endproc
.LFE25:
	.size	stencil, .-stencil
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"2D5PT b[j][i] = c0 * (a[j][i] + a[j][i-1] + ...), 64 byte/it, 5 Flop/it"
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
	pushq	%r14
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movl	$1250, %r14d
	pushq	%r13
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movl	$1248, %r13d
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	$10000, %ebx
	subq	$2208, %rsp
	call	gethostname
	leaq	-2128(%rbp), %rsi
	leaq	-2096(%rbp), %rdi
	call	getFreq
	movl	$.LC15, %edi
	call	puts
	vxorpd	%xmm4, %xmm4, %xmm4
	vcvtsi2sdq	-2128(%rbp), %xmm4, %xmm0
	leaq	-2096(%rbp), %rsi
	movl	$.LC17, %edi
	movl	$1, %eax
	vdivsd	.LC16(%rip), %xmm0, %xmm0
	call	printf
	movl	$.LC18, %edi
	call	puts
	movq	$10016, -2184(%rbp)
	movq	$20008, -2176(%rbp)
	movq	$1249, -2136(%rbp)
	.p2align 4,,10
	.p2align 3
.L135:
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%r14d, %xmm7, %xmm1
	movl	%r14d, -2152(%rbp)
	movl	%r14d, -2144(%rbp)
	vucomisd	.LC19(%rip), %xmm1
	jnb	.L210
.L116:
	leaq	(%rbx,%rbx,2), %r15
	movq	%r15, %rsi
	movl	$64, %edi
	call	aligned_alloc
	movq	%r15, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movl	%r14d, %r11d
	movl	%r14d, %ecx
	shrl	$2, %ecx
	andl	$-4, %r11d
	vmovsd	.LC5(%rip), %xmm1
	vmovapd	.LC4(%rip), %ymm6
	movq	%rax, %r15
	movq	%r12, %rsi
	salq	$5, %rcx
	movl	%r11d, %r10d
	xorl	%edi, %edi
	movl	$3, %r9d
	.p2align 4,,10
	.p2align 3
.L117:
	cmpq	$2, -2136(%rbp)
	jbe	.L136
	leaq	-32(%rcx), %rdx
	shrq	$5, %rdx
	incq	%rdx
	leaq	(%rsi,%rcx), %r8
	movq	%rsi, %rax
	andl	$7, %edx
	je	.L119
	cmpq	$1, %rdx
	je	.L180
	cmpq	$2, %rdx
	je	.L181
	cmpq	$3, %rdx
	je	.L182
	cmpq	$4, %rdx
	je	.L183
	cmpq	$5, %rdx
	je	.L184
	cmpq	$6, %rdx
	je	.L185
	vmovupd	%ymm6, (%rsi)
	leaq	32(%rsi), %rax
.L185:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L184:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L183:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L182:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L181:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
.L180:
	vmovupd	%ymm6, (%rax)
	addq	$32, %rax
	cmpq	%rax, %r8
	je	.L204
.L119:
	vmovupd	%ymm6, (%rax)
	vmovupd	%ymm6, 32(%rax)
	vmovupd	%ymm6, 64(%rax)
	vmovupd	%ymm6, 96(%rax)
	vmovupd	%ymm6, 128(%rax)
	vmovupd	%ymm6, 160(%rax)
	vmovupd	%ymm6, 192(%rax)
	vmovupd	%ymm6, 224(%rax)
	addq	$256, %rax
	cmpq	%rax, %r8
	jne	.L119
.L204:
	movl	%r10d, %eax
	cmpl	%r10d, -2152(%rbp)
	je	.L118
.L122:
	leal	(%rdi,%rax), %r11d
	movslq	%r11d, %r8
	leal	1(%rax), %edx
	vmovsd	%xmm1, (%r12,%r8,8)
	cmpl	%edx, %r14d
	jle	.L118
	addl	%edi, %edx
	movslq	%edx, %r11
	addl	$2, %eax
	vmovsd	%xmm1, (%r12,%r11,8)
	cmpl	%eax, %r14d
	jle	.L118
	addl	%edi, %eax
	cltq
	vmovsd	%xmm1, (%r12,%rax,8)
.L118:
	addl	-2152(%rbp), %edi
	addq	%rbx, %rsi
	decl	%r9d
	jne	.L117
	cmpl	$2, -2144(%rbp)
	movl	$1, %ecx
	cmovg	%r13, %rcx
	leaq	8(%rbx), %r10
	leaq	-3(%rcx), %rsi
	movq	%rsi, %rdi
	movq	%rsi, -2208(%rbp)
	shrq	$2, %rdi
	andq	$-4, %rsi
	movq	%r10, -2216(%rbp)
	salq	$5, %rdi
	leaq	4(%rsi), %r9
	addq	%r12, %r10
	movq	%rdi, -2144(%rbp)
	movq	%rsi, -2200(%rbp)
	movq	%r9, -2192(%rbp)
	movl	$1, -2148(%rbp)
	movq	%r10, -2224(%rbp)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L131:
	leaq	-2104(%rbp), %rsi
	leaq	-2120(%rbp), %rdi
	call	timing
	leaq	-1(%r14), %rax
	movq	%rax, -2232(%rbp)
	movq	%r13, %r9
	movq	-2176(%rbp), %r13
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L130:
	vmovsd	(%r12), %xmm2
	vxorpd	%xmm3, %xmm3, %xmm3
	vcomisd	%xmm3, %xmm2
	jbe	.L123
	movq	%r12, %rdi
	movl	%r10d, -2164(%rbp)
	movq	%r9, -2160(%rbp)
	vzeroupper
	call	dummy
	movl	-2164(%rbp), %r10d
	movq	-2160(%rbp), %r9
.L123:
	cmpq	$8, %r14
	jbe	.L137
	movq	-2224(%rbp), %r8
	movq	-2184(%rbp), %rdx
	vmovsd	(%r8), %xmm5
	vmovsd	(%r12,%rdx), %xmm8
	vaddsd	-8(%r8), %xmm5, %xmm9
	vaddsd	%xmm5, %xmm8, %xmm15
	leaq	24(%r12,%rbx), %rsi
	vaddsd	8(%r12), %xmm9, %xmm10
	vaddsd	16(%r12), %xmm15, %xmm4
	vmovsd	(%rsi), %xmm14
	vaddsd	(%r12,%r13), %xmm10, %xmm11
	vaddsd	8(%r12,%r13), %xmm4, %xmm0
	vaddsd	%xmm14, %xmm8, %xmm6
	vaddsd	%xmm8, %xmm11, %xmm12
	vaddsd	%xmm14, %xmm0, %xmm7
	vaddsd	24(%r12), %xmm6, %xmm2
	vmulsd	.LC21(%rip), %xmm12, %xmm13
	vmulsd	.LC21(%rip), %xmm7, %xmm1
	movq	-2216(%rbp), %rcx
	vaddsd	16(%r12,%r13), %xmm2, %xmm3
	leaq	24(%r12,%r13), %r11
	vmovsd	%xmm13, (%r15,%rcx)
	vmovsd	%xmm1, (%r15,%rdx)
	leaq	32(%rbx), %rdx
	leaq	(%r12,%rdx), %rdi
	vaddsd	(%rdi), %xmm3, %xmm5
	movq	-2144(%rbp), %rcx
	leaq	40(%r12,%rbx), %r8
	vmulsd	.LC21(%rip), %xmm5, %xmm8
	subq	$32, %rcx
	shrq	$5, %rcx
	incq	%rcx
	addq	%r15, %rdx
	vmovsd	%xmm8, 24(%r15,%rbx)
	xorl	%eax, %eax
	andl	$3, %ecx
	je	.L126
	cmpq	$1, %rcx
	je	.L186
	cmpq	$2, %rcx
	je	.L187
	vmovupd	(%rsi), %ymm9
	movl	$32, %eax
	vaddpd	(%rdi), %ymm9, %ymm10
	vaddpd	32(%r12), %ymm10, %ymm11
	vaddpd	(%r11), %ymm11, %ymm12
	vaddpd	(%r8), %ymm12, %ymm13
	vmulpd	.LC22(%rip), %ymm13, %ymm14
	vmovupd	%ymm14, (%rdx)
.L187:
	vmovupd	(%rsi,%rax), %ymm15
	vaddpd	(%rdi,%rax), %ymm15, %ymm4
	vaddpd	32(%r12,%rax), %ymm4, %ymm0
	vaddpd	(%r11,%rax), %ymm0, %ymm7
	vaddpd	(%r8,%rax), %ymm7, %ymm1
	vmulpd	.LC22(%rip), %ymm1, %ymm6
	vmovupd	%ymm6, (%rdx,%rax)
	addq	$32, %rax
.L186:
	vmovupd	(%rsi,%rax), %ymm2
	vaddpd	(%rdi,%rax), %ymm2, %ymm3
	vaddpd	32(%r12,%rax), %ymm3, %ymm5
	vaddpd	(%r11,%rax), %ymm5, %ymm8
	vaddpd	(%r8,%rax), %ymm8, %ymm9
	vmulpd	.LC22(%rip), %ymm9, %ymm10
	vmovupd	%ymm10, (%rdx,%rax)
	addq	$32, %rax
	cmpq	-2144(%rbp), %rax
	je	.L203
.L126:
	vmovupd	(%rsi,%rax), %ymm11
	vmovupd	32(%rsi,%rax), %ymm0
	vaddpd	(%rdi,%rax), %ymm11, %ymm12
	vmovupd	64(%rsi,%rax), %ymm5
	vaddpd	32(%rdi,%rax), %ymm0, %ymm7
	vaddpd	32(%r12,%rax), %ymm12, %ymm13
	vaddpd	64(%rdi,%rax), %ymm5, %ymm8
	vaddpd	64(%r12,%rax), %ymm7, %ymm1
	vaddpd	(%r11,%rax), %ymm13, %ymm14
	vmovupd	96(%rsi,%rax), %ymm13
	vaddpd	96(%r12,%rax), %ymm8, %ymm9
	vaddpd	(%r8,%rax), %ymm14, %ymm15
	vaddpd	96(%rdi,%rax), %ymm13, %ymm14
	vaddpd	32(%r11,%rax), %ymm1, %ymm6
	vmulpd	.LC22(%rip), %ymm15, %ymm4
	vaddpd	128(%r12,%rax), %ymm14, %ymm15
	vaddpd	64(%r11,%rax), %ymm9, %ymm10
	vaddpd	32(%r8,%rax), %ymm6, %ymm2
	vmovupd	%ymm4, (%rdx,%rax)
	vaddpd	96(%r11,%rax), %ymm15, %ymm4
	vaddpd	64(%r8,%rax), %ymm10, %ymm11
	vmulpd	.LC22(%rip), %ymm2, %ymm3
	vaddpd	96(%r8,%rax), %ymm4, %ymm0
	vmulpd	.LC22(%rip), %ymm11, %ymm12
	vmulpd	.LC22(%rip), %ymm0, %ymm7
	vmovupd	%ymm3, 32(%rdx,%rax)
	vmovupd	%ymm12, 64(%rdx,%rax)
	vmovupd	%ymm7, 96(%rdx,%rax)
	subq	$-128, %rax
	cmpq	-2144(%rbp), %rax
	jne	.L126
	.p2align 4,,10
	.p2align 3
.L203:
	movq	-2208(%rbp), %rsi
	cmpq	%rsi, -2200(%rbp)
	je	.L127
	movq	-2192(%rbp), %r11
.L125:
	leaq	(%r11,%r14), %rax
	leaq	1(%r11), %rdx
	leaq	(%r12,%rax,8), %rdi
	cmpq	%r9, %rdx
	jge	.L128
	cmpq	-2136(%rbp), %r11
	jge	.L128
	vmovsd	-8(%rdi), %xmm5
	movq	%rdi, %rdx
	leaq	(%r15,%rbx), %r8
.L129:
	vmovsd	(%rdx), %xmm6
	movq	%r11, %rcx
	vaddsd	%xmm5, %xmm6, %xmm1
	vmovsd	8(%rdx), %xmm5
	addq	$3, %rcx
	vaddsd	%xmm6, %xmm5, %xmm10
	vaddsd	(%r12,%r11,8), %xmm1, %xmm2
	vaddsd	8(%r12,%r11,8), %xmm10, %xmm11
	vaddsd	(%rdx,%r14,8), %xmm2, %xmm3
	vaddsd	8(%rdx,%r14,8), %xmm11, %xmm12
	vaddsd	%xmm3, %xmm5, %xmm8
	addq	$16, %rdx
	vaddsd	(%rdx), %xmm12, %xmm13
	vmulsd	.LC21(%rip), %xmm8, %xmm9
	vmulsd	.LC21(%rip), %xmm13, %xmm14
	vmovsd	%xmm9, (%r8,%r11,8)
	vmovsd	%xmm14, 8(%r8,%r11,8)
	addq	$2, %r11
	cmpq	%r9, %rcx
	jl	.L129
	leaq	(%r11,%r14), %rax
	leaq	1(%r11), %rdx
.L128:
	leaq	0(,%rax,8), %rsi
	vmovsd	-8(%r12,%rsi), %xmm15
	leaq	(%r14,%rax), %r8
	vaddsd	(%r12,%rax,8), %xmm15, %xmm4
	leaq	0(,%r11,8), %rdi
	vaddsd	(%r12,%r11,8), %xmm4, %xmm0
	vaddsd	(%r12,%r8,8), %xmm0, %xmm7
	vaddsd	8(%r12,%rsi), %xmm7, %xmm6
	vmulsd	.LC21(%rip), %xmm6, %xmm1
	vmovsd	%xmm1, (%r15,%rax,8)
	cmpq	%rdx, -2136(%rbp)
	jg	.L211
.L127:
	incl	%r10d
	cmpl	%r10d, -2148(%rbp)
	jne	.L130
	movq	%r9, %r13
	leaq	-2104(%rbp), %rsi
	leaq	-2112(%rbp), %rdi
	vzeroupper
	call	timing
	vmovsd	-2112(%rbp), %xmm6
	vmovsd	.LC7(%rip), %xmm2
	vsubsd	-2120(%rbp), %xmm6, %xmm1
	sall	-2148(%rbp)
	vcomisd	%xmm1, %xmm2
	ja	.L131
	movl	-2148(%rbp), %r10d
	movl	$1024, %esi
	sarl	%r10d
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm1, -2160(%rbp)
	movl	%r10d, -2144(%rbp)
	call	gethostname
	movabsq	$7308041938491629923, %r9
	cmpq	%r9, -1072(%rbp)
	movl	-2144(%rbp), %r11d
	vmovsd	-2160(%rbp), %xmm1
	je	.L212
.L132:
	vmovsd	.LC3(%rip), %xmm8
.L134:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdl	%r11d, %xmm3, %xmm7
	vcvtsi2sdl	%r13d, %xmm3, %xmm10
	movslq	%r11d, %rcx
	imulq	%r13, %rcx
	vmulsd	.LC9(%rip), %xmm7, %xmm13
	vmulsd	.LC12(%rip), %xmm10, %xmm2
	vmulsd	%xmm10, %xmm7, %xmm5
	vcvtsi2sdq	%rcx, %xmm3, %xmm6
	vmulsd	%xmm8, %xmm1, %xmm8
	vmulsd	%xmm10, %xmm13, %xmm14
	vmulsd	%xmm7, %xmm2, %xmm7
	vmovapd	%xmm3, %xmm0
	vmulsd	.LC11(%rip), %xmm6, %xmm3
	vdivsd	%xmm1, %xmm5, %xmm11
	movl	-2152(%rbp), %r8d
	vmulsd	.LC13(%rip), %xmm7, %xmm9
	leal	-4(%r8,%r8,2), %eax
	vcvtsi2sdl	%eax, %xmm0, %xmm10
	movq	%r13, %rdx
	movl	%r11d, %esi
	movl	$.LC14, %edi
	vmulsd	.LC12(%rip), %xmm10, %xmm5
	movl	$6, %eax
	subq	$64, %r14
	subq	$64, %r13
	subq	$512, %rbx
	vdivsd	.LC8(%rip), %xmm5, %xmm0
	vdivsd	%xmm1, %xmm14, %xmm15
	vdivsd	.LC8(%rip), %xmm11, %xmm12
	vdivsd	.LC8(%rip), %xmm12, %xmm5
	vdivsd	%xmm3, %xmm8, %xmm3
	vmulsd	.LC10(%rip), %xmm15, %xmm4
	vmulsd	.LC10(%rip), %xmm4, %xmm4
	vdivsd	%xmm1, %xmm9, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r15, %rdi
	call	free
	subq	$64, -2136(%rbp)
	subq	$1024, -2176(%rbp)
	subq	$512, -2184(%rbp)
	cmpq	$162, %r14
	jne	.L135
	addq	$2208, %rsp
	popq	%rbx
	popq	%rsi
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	xorl	%eax, %eax
	popq	%rbp
	leaq	-8(%rsi), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L211:
	.cfi_restore_state
	addq	%r14, %rdx
	leaq	0(,%rdx,8), %rcx
	vmovsd	-8(%r12,%rcx), %xmm2
	leaq	(%r14,%rdx), %rax
	vaddsd	(%r12,%rdx,8), %xmm2, %xmm3
	vaddsd	8(%r12,%rdi), %xmm3, %xmm5
	vaddsd	(%r12,%rax,8), %xmm5, %xmm8
	vaddsd	8(%r12,%rcx), %xmm8, %xmm9
	vmulsd	.LC21(%rip), %xmm9, %xmm10
	vmovsd	%xmm10, (%r15,%rdx,8)
	leaq	2(%r11), %rdx
	cmpq	%rdx, -2136(%rbp)
	jle	.L127
	addq	%r14, %rdx
	leaq	0(,%rdx,8), %r8
	vmovsd	-8(%r12,%r8), %xmm11
	leaq	(%r14,%rdx), %rsi
	vaddsd	(%r12,%rdx,8), %xmm11, %xmm12
	leaq	3(%r11), %rax
	vaddsd	16(%r12,%rdi), %xmm12, %xmm13
	vaddsd	(%r12,%rsi,8), %xmm13, %xmm14
	vaddsd	8(%r12,%r8), %xmm14, %xmm15
	vmulsd	.LC21(%rip), %xmm15, %xmm4
	vmovsd	%xmm4, (%r15,%rdx,8)
	cmpq	%rax, -2136(%rbp)
	jle	.L127
	addq	%r14, %rax
	leaq	0(,%rax,8), %rcx
	vmovsd	-8(%r12,%rcx), %xmm0
	leaq	(%r14,%rax), %rdx
	vaddsd	(%r12,%rax,8), %xmm0, %xmm7
	leaq	4(%r11), %r8
	vaddsd	24(%r12,%rdi), %xmm7, %xmm6
	vaddsd	(%r12,%rdx,8), %xmm6, %xmm1
	vaddsd	8(%r12,%rcx), %xmm1, %xmm2
	vmulsd	.LC21(%rip), %xmm2, %xmm3
	vmovsd	%xmm3, (%r15,%rax,8)
	cmpq	%r8, -2232(%rbp)
	jle	.L127
	addq	%r14, %r8
	leaq	0(,%r8,8), %rax
	vmovsd	-8(%r12,%rax), %xmm5
	leaq	(%r14,%r8), %rsi
	vaddsd	(%r12,%r8,8), %xmm5, %xmm8
	addq	$5, %r11
	vaddsd	32(%r12,%rdi), %xmm8, %xmm9
	vaddsd	(%r12,%rsi,8), %xmm9, %xmm10
	vaddsd	8(%r12,%rax), %xmm10, %xmm11
	vmulsd	.LC21(%rip), %xmm11, %xmm12
	vmovsd	%xmm12, (%r15,%r8,8)
	cmpq	%r11, -2232(%rbp)
	jle	.L127
	addq	%r14, %r11
	leaq	0(,%r11,8), %rdx
	vmovsd	-8(%r12,%rdx), %xmm13
	vaddsd	(%r12,%r11,8), %xmm13, %xmm14
	vaddsd	40(%r12,%rdi), %xmm14, %xmm15
	leaq	(%r14,%r11), %rdi
	vaddsd	(%r12,%rdi,8), %xmm15, %xmm4
	vaddsd	8(%r12,%rdx), %xmm4, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm7
	vmovsd	%xmm7, (%r15,%r11,8)
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L137:
	movl	$1, %r11d
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L136:
	xorl	%eax, %eax
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L212:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm8
	jne	.L132
	jmp	.L134
.L210:
	vmovsd	.LC20(%rip), %xmm0
	call	pow
	jmp	.L116
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
	.align 8
.LC21:
	.long	398572965
	.long	1068847910
	.section	.rodata.cst32
	.align 32
.LC22:
	.long	398572965
	.long	1068847910
	.long	398572965
	.long	1068847910
	.long	398572965
	.long	1068847910
	.long	398572965
	.long	1068847910
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
