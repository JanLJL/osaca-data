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
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movslq	%eax, %r13
	salq	$3, %r13
	pushq	%r12
	pushq	%rbx
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	movl	%edi, %ebx
	subq	$1160, %rsp
	movl	%edi, -1168(%rbp)
	movl	%esi, -1164(%rbp)
	movl	$64, %edi
	movq	%r13, %rsi
	vmovsd	%xmm0, -1112(%rbp)
	movl	%eax, -1188(%rbp)
	call	aligned_alloc
	movq	%r13, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	testl	%ebx, %ebx
	vmovsd	-1112(%rbp), %xmm4
	movq	%rax, %r13
	jle	.L57
	movl	-1164(%rbp), %eax
	testl	%eax, %eax
	jle	.L57
	movl	-1164(%rbp), %r11d
	vmovsd	.LC5(%rip), %xmm1
	movslq	%r11d, %r9
	movl	%r11d, %ecx
	movq	%r9, %rax
	shrl	$2, %ecx
	movl	%r11d, %r10d
	vmovapd	.LC4(%rip), %ymm0
	salq	$3, %r9
	movq	%r12, %rdi
	leal	-1(%rax), %esi
	salq	$5, %rcx
	andl	$-4, %r10d
	xorl	%edx, %edx
	xorl	%r8d, %r8d
.L10:
	leaq	(%rdi,%rcx), %rbx
	movq	%rdi, %rax
	cmpl	$2, %esi
	jbe	.L58
.L11:
	vmovupd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rbx, %rax
	jne	.L11
	movl	%r10d, %eax
	cmpl	%r11d, %r10d
	je	.L12
.L13:
	leal	(%rdx,%rax), %ebx
	movslq	%ebx, %rbx
	vmovsd	%xmm1, (%r12,%rbx,8)
	leal	1(%rax), %ebx
	cmpl	%ebx, %r11d
	jle	.L12
	addl	%edx, %ebx
	movslq	%ebx, %rbx
	addl	$2, %eax
	vmovsd	%xmm1, (%r12,%rbx,8)
	cmpl	%eax, %r11d
	jle	.L12
	addl	%edx, %eax
	cltq
	vmovsd	%xmm1, (%r12,%rax,8)
.L12:
	incl	%r8d
	addl	%r11d, %edx
	addq	%r9, %rdi
	cmpl	%r8d, -1168(%rbp)
	jne	.L10
	vzeroupper
.L9:
	movl	-1168(%rbp), %eax
	movl	$1, -1152(%rbp)
	decl	%eax
	cltq
	movq	%rax, -1120(%rbp)
	movslq	%esi, %rax
	leaq	-1(%rax), %r15
	movq	%rax, -1112(%rbp)
	subq	$2, %rax
	movq	%rax, -1128(%rbp)
	movq	%r15, %rax
	andq	$-4, %rax
	movq	%rax, -1136(%rbp)
	incq	%rax
	movq	%r15, %r14
	movq	%rax, -1144(%rbp)
	shrq	$2, %r14
	movslq	-1164(%rbp), %rbx
	salq	$5, %r14
	vmovddup	%xmm4, %xmm5
.L27:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	vmovaps	%xmm5, -1184(%rbp)
	vmovsd	%xmm4, -1160(%rbp)
	call	timing
	movl	$0, -1148(%rbp)
	vmovapd	-1184(%rbp), %xmm5
	vmovsd	-1160(%rbp), %xmm4
	.p2align 4,,10
	.p2align 3
.L18:
	vmovsd	(%r12), %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	vcomisd	%xmm2, %xmm0
	jbe	.L15
	movq	%r12, %rdi
	vmovaps	%xmm5, -1184(%rbp)
	vmovsd	%xmm4, -1160(%rbp)
	vzeroupper
	call	dummy
	vmovapd	-1184(%rbp), %xmm5
	vmovsd	-1160(%rbp), %xmm4
.L15:
	cmpq	$1, -1120(%rbp)
	jle	.L20
	cmpq	$1, -1112(%rbp)
	jle	.L20
	movl	$1, %r11d
	vbroadcastsd	%xmm4, %ymm1
	.p2align 4,,10
	.p2align 3
.L23:
	movq	%rbx, %rcx
	imulq	%r11, %rcx
	cmpq	$2, -1128(%rbp)
	jbe	.L59
	leaq	1(%rcx), %rax
	movq	%rax, %rsi
	leaq	0(,%rax,8), %rdx
	subq	%rbx, %rsi
	addq	%rbx, %rax
	leaq	(%r12,%rdx), %r10
	leaq	-8(%r12,%rdx), %r9
	leaq	(%r12,%rsi,8), %r8
	leaq	(%r12,%rax,8), %rdi
	leaq	16(%r12,%rcx,8), %rsi
	addq	%r13, %rdx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
    movl $111,%ebx      #IACA START MARKER
    .byte 100,103,144   #IACA START MARKER
    # LLVM-MCA-BEGIN
.L24:
	vmovupd	(%r9,%rax), %ymm7
	vaddpd	(%r10,%rax), %ymm7, %ymm0
	vaddpd	(%r8,%rax), %ymm0, %ymm0
	vaddpd	(%rdi,%rax), %ymm0, %ymm0
	vaddpd	(%rsi,%rax), %ymm0, %ymm0
	vmulpd	%ymm1, %ymm0, %ymm0
	vmovupd	%ymm0, (%rdx,%rax)
	addq	$32, %rax
	cmpq	%rax, %r14
	jne	.L24
    # LLVM-MCA-END
    movl $222,%ebx      #IACA END MARKER
    .byte 100,103,144   #IACA END MARKER
	cmpq	%r15, -1136(%rbp)
	je	.L25
	movq	-1144(%rbp), %rax
.L21:
	leaq	(%rcx,%rax), %rdx
	leaq	0(,%rdx,8), %rdi
	leaq	1(%rax), %rsi
	leaq	(%r12,%rdi), %r8
	cmpq	%rsi, %r15
	jle	.L33
	cmpq	%rax, -1112(%rbp)
	jle	.L33
	vmovupd	(%r8), %xmm6
	leaq	1(%rcx,%rsi), %rsi
	vaddpd	-8(%r8), %xmm6, %xmm0
	vmovsd	(%r12,%rsi,8), %xmm2
	movq	%rdx, %rsi
	subq	%rbx, %rsi
	vaddpd	(%r12,%rsi,8), %xmm0, %xmm0
	leaq	(%rbx,%rdx), %rsi
	leaq	8(%r12,%rdi), %rdi
	vaddpd	(%r12,%rsi,8), %xmm0, %xmm0
	leaq	3(%rax), %rsi
	vmovsd	(%rdi), %xmm3
	vaddpd	(%rdi), %xmm0, %xmm0
	vmulpd	%xmm5, %xmm0, %xmm0
	vmovups	%xmm0, 0(%r13,%rdx,8)
	leaq	2(%rax), %rdx
	cmpq	%rsi, %r15
	jle	.L26
	addq	%rcx, %rdx
	vaddsd	%xmm2, %xmm3, %xmm0
	movq	%rdx, %rdi
	subq	%rbx, %rdi
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	leaq	(%rbx,%rdx), %rdi
	vmovsd	8(%r12,%rdx,8), %xmm6
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	addq	%rcx, %rsi
	vmovsd	8(%r12,%rsi,8), %xmm3
	vaddsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rdx,8)
	vaddsd	%xmm6, %xmm2, %xmm0
	movq	%rsi, %rdx
	subq	%rbx, %rdx
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	leaq	(%rbx,%rsi), %rdx
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	leaq	4(%rax), %rdx
	vaddsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rsi,8)
	leaq	5(%rax), %rsi
	cmpq	%rsi, %r15
	jle	.L26
	addq	%rcx, %rdx
	vaddsd	%xmm3, %xmm6, %xmm0
	movq	%rdx, %rdi
	subq	%rbx, %rdi
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	leaq	(%rbx,%rdx), %rdi
	vmovsd	8(%r12,%rdx,8), %xmm2
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	addq	%rcx, %rsi
	vaddsd	%xmm2, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rdx,8)
	vaddsd	%xmm3, %xmm2, %xmm0
	movq	%rsi, %rdx
	subq	%rbx, %rdx
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	leaq	(%rbx,%rsi), %rdx
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	leaq	6(%rax), %rdx
	vaddsd	8(%r12,%rsi,8), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rsi,8)
.L26:
	leaq	(%rcx,%rdx), %rax
	leaq	0(,%rax,8), %rsi
	vmovsd	-8(%r12,%rsi), %xmm0
	movq	%rax, %rdi
	vaddsd	(%r12,%rax,8), %xmm0, %xmm0
	subq	%rbx, %rdi
	movq	-1112(%rbp), %r9
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	leaq	(%rbx,%rax), %rdi
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rsi), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rax,8)
	leaq	1(%rdx), %rax
	cmpq	%rax, %r9
	jle	.L25
	addq	%rcx, %rax
	leaq	0(,%rax,8), %rsi
	vmovsd	-8(%r12,%rsi), %xmm0
	movq	%rax, %rdi
	vaddsd	(%r12,%rax,8), %xmm0, %xmm0
	subq	%rbx, %rdi
	addq	$2, %rdx
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	leaq	(%rbx,%rax), %rdi
	vaddsd	(%r12,%rdi,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rsi), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rax,8)
	cmpq	%rdx, %r9
	jle	.L25
	addq	%rdx, %rcx
	leaq	0(,%rcx,8), %rax
	vmovsd	-8(%r12,%rax), %xmm0
	movq	%rcx, %rdx
	vaddsd	(%r12,%rcx,8), %xmm0, %xmm0
	subq	%rbx, %rdx
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	leaq	(%rbx,%rcx), %rdx
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rax), %xmm0, %xmm0
	vmulsd	%xmm4, %xmm0, %xmm0
	vmovsd	%xmm0, 0(%r13,%rcx,8)
.L25:
	incq	%r11
	cmpq	-1120(%rbp), %r11
	jl	.L23
.L20:
	incl	-1148(%rbp)
	movl	-1148(%rbp), %eax
	cmpl	-1152(%rbp), %eax
	jne	.L18
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	vmovaps	%xmm5, -1184(%rbp)
	vmovsd	%xmm4, -1160(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm1
	vmovsd	.LC7(%rip), %xmm5
	vsubsd	-1096(%rbp), %xmm1, %xmm1
	movl	-1148(%rbp), %eax
	vmovsd	-1160(%rbp), %xmm4
	addl	%eax, %eax
	vcomisd	%xmm1, %xmm5
	movl	%eax, -1152(%rbp)
	vmovapd	-1184(%rbp), %xmm5
	ja	.L27
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm1, -1112(%rbp)
	movl	%eax, %r14d
	call	gethostname
	movabsq	$7308041938491629923, %rax
	sarl	%r14d
	cmpq	%rax, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L60
.L28:
	vmovsd	.LC3(%rip), %xmm3
.L30:
	movl	-1168(%rbp), %eax
	movl	-1164(%rbp), %edx
	subl	$2, %eax
	subl	$2, %edx
	imull	%edx, %eax
	vxorps	%xmm6, %xmm6, %xmm6
	vcvtsi2sdl	%r14d, %xmm6, %xmm2
	vcvtsi2sdl	%eax, %xmm6, %xmm0
	vmovsd	.LC8(%rip), %xmm9
	movslq	%eax, %rdx
	vmovapd	%xmm2, %xmm7
	vmulsd	%xmm0, %xmm2, %xmm2
	movslq	%r14d, %rax
	imulq	%rdx, %rax
	vmovsd	.LC10(%rip), %xmm10
	vmovsd	.LC12(%rip), %xmm11
	vdivsd	%xmm1, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm1, %xmm8
	movl	%r14d, %esi
	movl	$.LC14, %edi
	vdivsd	%xmm9, %xmm2, %xmm5
	vmulsd	.LC9(%rip), %xmm7, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vdivsd	%xmm9, %xmm5, %xmm5
	vmulsd	%xmm10, %xmm2, %xmm4
	vcvtsi2sdq	%rax, %xmm6, %xmm2
	movl	-1188(%rbp), %eax
	subl	$4, %eax
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
	movq	%r12, %rdi
	call	free
	addq	$1160, %rsp
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
.L59:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L21
.L33:
	movq	%rax, %rdx
	jmp	.L26
.L58:
	xorl	%eax, %eax
	jmp	.L13
.L60:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm3
	jne	.L28
	jmp	.L30
.L57:
	movl	-1164(%rbp), %eax
	leal	-1(%rax), %esi
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
	movq	%r14, %r15
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
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdq	-2128(%rbp), %xmm6, %xmm0
	leaq	-2096(%rbp), %rsi
	movl	$.LC17, %edi
	movl	$1, %eax
	vdivsd	.LC16(%rip), %xmm0, %xmm0
	call	printf
	movl	$.LC18, %edi
	call	puts
	movq	$10016, -2176(%rbp)
	movq	$20008, -2168(%rbp)
	movq	$1249, -2136(%rbp)
	.p2align 4,,10
	.p2align 3
.L81:
	vxorpd	%xmm5, %xmm5, %xmm5
	vcvtsi2sdl	%r15d, %xmm5, %xmm1
	movl	%r15d, -2144(%rbp)
	movl	%r15d, -2140(%rbp)
	vucomisd	.LC19(%rip), %xmm1
	jnb	.L100
.L62:
	leaq	(%rbx,%rbx,2), %r14
	movq	%r14, %rsi
	movl	$64, %edi
	call	aligned_alloc
	movq	%r14, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movq	%rax, %r14
	movl	%r15d, %edi
	movl	%r15d, %eax
	shrl	$2, %edi
	andl	$-4, %eax
	vmovsd	.LC5(%rip), %xmm0
	movq	%r12, %r9
	salq	$5, %rdi
	movl	%eax, %r11d
	xorl	%esi, %esi
	movl	$3, %r10d
	.p2align 4,,10
	.p2align 3
.L63:
	cmpq	$2, -2136(%rbp)
	jbe	.L82
	leaq	(%r9,%rdi), %rdx
	movq	%r9, %rax
	.p2align 4,,10
	.p2align 3
.L65:
	vmovapd	.LC4(%rip), %ymm6
	addq	$32, %rax
	vmovupd	%ymm6, -32(%rax)
	cmpq	%rax, %rdx
	jne	.L65
	movl	%r11d, %eax
	cmpl	%r11d, -2144(%rbp)
	je	.L64
.L68:
	leal	(%rsi,%rax), %edx
	movslq	%edx, %rdx
	vmovsd	%xmm0, (%r12,%rdx,8)
	leal	1(%rax), %edx
	cmpl	%edx, %r15d
	jle	.L64
	addl	%esi, %edx
	movslq	%edx, %rdx
	addl	$2, %eax
	vmovsd	%xmm0, (%r12,%rdx,8)
	cmpl	%eax, %r15d
	jle	.L64
	addl	%esi, %eax
	cltq
	vmovsd	%xmm0, (%r12,%rax,8)
.L64:
	addl	-2144(%rbp), %esi
	addq	%rbx, %r9
	decl	%r10d
	jne	.L63
	cmpl	$2, -2140(%rbp)
	movl	$1, %eax
	cmovg	%r13, %rax
	movl	$1, -2140(%rbp)
	leaq	-3(%rax), %rcx
	movq	%rcx, %rax
	shrq	$2, %rax
	salq	$5, %rax
	movq	%rcx, -2200(%rbp)
	andq	$-4, %rcx
	movq	%rax, -2208(%rbp)
	leaq	4(%rcx), %rax
	movq	%rax, -2184(%rbp)
	leaq	8(%rbx), %rax
	movq	%rax, -2216(%rbp)
	addq	%r12, %rax
	movq	%rcx, -2192(%rbp)
	movq	%rax, -2224(%rbp)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L77:
	leaq	-2104(%rbp), %rsi
	leaq	-2120(%rbp), %rdi
	call	timing
	leaq	-1(%r15), %rax
	movq	%rax, -2232(%rbp)
	movq	-2168(%rbp), %rsi
	movq	%rbx, %rax
	xorl	%r9d, %r9d
	movq	%r13, %rbx
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L76:
	vmovsd	(%r12), %xmm0
	vxorpd	%xmm7, %xmm7, %xmm7
	vcomisd	%xmm7, %xmm0
	jbe	.L69
	movq	%r12, %rdi
	movq	%rsi, -2160(%rbp)
	movl	%r9d, -2152(%rbp)
	vzeroupper
	call	dummy
	movq	-2160(%rbp), %rsi
	movl	-2152(%rbp), %r9d
.L69:
	cmpq	$8, %r15
	jbe	.L83
	movq	-2224(%rbp), %rax
	movq	-2176(%rbp), %rcx
	vmovsd	(%rax), %xmm1
	vmovsd	(%r12,%rcx), %xmm0
	vaddsd	-8(%rax), %xmm1, %xmm2
	vaddsd	%xmm1, %xmm0, %xmm1
	movq	-2216(%rbp), %rax
	vaddsd	8(%r12), %xmm2, %xmm2
	vaddsd	16(%r12), %xmm1, %xmm1
	leaq	24(%r12,%r13), %rdi
	vaddsd	(%r12,%rsi), %xmm2, %xmm2
	vaddsd	8(%r12,%rsi), %xmm1, %xmm1
	leaq	32(%r13), %rdx
	vaddsd	%xmm0, %xmm2, %xmm2
	leaq	24(%r12,%rsi), %r11
	leaq	40(%r12,%r13), %r10
	vmulsd	.LC21(%rip), %xmm2, %xmm2
	vmovsd	%xmm2, (%r14,%rax)
	vmovsd	(%rdi), %xmm2
	xorl	%eax, %eax
	vaddsd	%xmm2, %xmm1, %xmm1
	vaddsd	%xmm2, %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm1, %xmm1
	vaddsd	24(%r12), %xmm0, %xmm0
	vaddsd	16(%r12,%rsi), %xmm0, %xmm0
	vmovsd	%xmm1, (%r14,%rcx)
	leaq	(%r12,%rdx), %rcx
	vaddsd	(%rcx), %xmm0, %xmm0
	addq	%r14, %rdx
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, 24(%r14,%r13)
.L72:
	vmovupd	(%rdi,%rax), %ymm6
	vaddpd	(%rcx,%rax), %ymm6, %ymm0
	vaddpd	32(%r12,%rax), %ymm0, %ymm0
	vaddpd	(%r11,%rax), %ymm0, %ymm0
	vaddpd	(%r10,%rax), %ymm0, %ymm0
	vmulpd	.LC22(%rip), %ymm0, %ymm0
	vmovupd	%ymm0, (%rdx,%rax)
	addq	$32, %rax
	cmpq	-2208(%rbp), %rax
	jne	.L72
	movq	-2200(%rbp), %rdi
	cmpq	%rdi, -2192(%rbp)
	je	.L73
	movq	-2184(%rbp), %rax
.L71:
	leaq	(%rax,%r15), %rcx
	leaq	1(%rax), %rdx
	leaq	(%r12,%rcx,8), %rdi
	cmpq	%rbx, %rdx
	jge	.L74
	cmpq	-2136(%rbp), %rax
	jge	.L74
	vmovsd	-8(%rdi), %xmm0
	movq	%rdi, %rdx
	leaq	(%r14,%r13), %rdi
.L75:
	vmovsd	(%rdx), %xmm2
	movq	%rax, %rcx
	vaddsd	%xmm0, %xmm2, %xmm1
	vmovsd	8(%rdx), %xmm0
	addq	$3, %rcx
	vaddsd	(%r12,%rax,8), %xmm1, %xmm1
	vaddsd	(%rdx,%r15,8), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm1
	vmulsd	.LC21(%rip), %xmm1, %xmm1
	vmovsd	%xmm1, (%rdi,%rax,8)
	vaddsd	%xmm2, %xmm0, %xmm1
	vaddsd	8(%r12,%rax,8), %xmm1, %xmm1
	vaddsd	8(%rdx,%r15,8), %xmm1, %xmm1
	addq	$16, %rdx
	vaddsd	(%rdx), %xmm1, %xmm1
	vmulsd	.LC21(%rip), %xmm1, %xmm1
	vmovsd	%xmm1, 8(%rdi,%rax,8)
	addq	$2, %rax
	cmpq	%rbx, %rcx
	jl	.L75
	leaq	(%rax,%r15), %rcx
	leaq	1(%rax), %rdx
.L74:
	leaq	0(,%rcx,8), %r10
	vmovsd	-8(%r12,%r10), %xmm0
	leaq	(%r15,%rcx), %r11
	vaddsd	(%r12,%rcx,8), %xmm0, %xmm0
	leaq	0(,%rax,8), %rdi
	vaddsd	(%r12,%rax,8), %xmm0, %xmm0
	vaddsd	(%r12,%r11,8), %xmm0, %xmm0
	vaddsd	8(%r12,%r10), %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rcx,8)
	cmpq	%rdx, -2136(%rbp)
	jg	.L101
.L73:
	incl	%r9d
	cmpl	%r9d, -2140(%rbp)
	jne	.L76
	movq	%r13, %rax
	leaq	-2104(%rbp), %rsi
	movq	%rbx, %r13
	leaq	-2112(%rbp), %rdi
	movq	%rax, %rbx
	vzeroupper
	call	timing
	vmovsd	-2112(%rbp), %xmm1
	vmovsd	.LC7(%rip), %xmm7
	vsubsd	-2120(%rbp), %xmm1, %xmm1
	sall	-2140(%rbp)
	vcomisd	%xmm1, %xmm7
	ja	.L77
	movl	-2140(%rbp), %r8d
	movl	$1024, %esi
	sarl	%r8d
	leaq	-1072(%rbp), %rdi
	movl	%r8d, -2140(%rbp)
	vmovsd	%xmm1, -2152(%rbp)
	call	gethostname
	movabsq	$7308041938491629923, %rax
	cmpq	%rax, -1072(%rbp)
	movl	-2140(%rbp), %r8d
	vmovsd	-2152(%rbp), %xmm1
	je	.L102
.L78:
	vmovsd	.LC3(%rip), %xmm7
.L80:
	vxorpd	%xmm3, %xmm3, %xmm3
	vcvtsi2sdl	%r8d, %xmm3, %xmm2
	vcvtsi2sdl	%r13d, %xmm3, %xmm0
	movslq	%r8d, %rax
	imulq	%r13, %rax
	vmulsd	.LC9(%rip), %xmm2, %xmm4
	vmovapd	%xmm2, %xmm6
	vmulsd	%xmm0, %xmm2, %xmm5
	vmulsd	.LC12(%rip), %xmm0, %xmm2
	vmovapd	%xmm3, %xmm8
	vmulsd	%xmm0, %xmm4, %xmm4
	vcvtsi2sdq	%rax, %xmm3, %xmm3
	vmulsd	%xmm7, %xmm1, %xmm7
	vmulsd	%xmm6, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm5, %xmm5
	vmulsd	.LC11(%rip), %xmm3, %xmm3
	movl	-2144(%rbp), %eax
	movq	%r13, %rdx
	vmulsd	.LC13(%rip), %xmm2, %xmm2
	leal	-4(%rax,%rax,2), %eax
	vcvtsi2sdl	%eax, %xmm8, %xmm0
	movl	%r8d, %esi
	movl	$.LC14, %edi
	movl	$6, %eax
	vmulsd	.LC12(%rip), %xmm0, %xmm0
	subq	$64, %r15
	subq	$64, %r13
	subq	$512, %rbx
	vdivsd	.LC8(%rip), %xmm0, %xmm0
	vdivsd	%xmm1, %xmm4, %xmm4
	vdivsd	.LC8(%rip), %xmm5, %xmm5
	vdivsd	.LC8(%rip), %xmm5, %xmm5
	vdivsd	%xmm3, %xmm7, %xmm3
	vmulsd	.LC10(%rip), %xmm4, %xmm4
	vmulsd	.LC10(%rip), %xmm4, %xmm4
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	subq	$64, -2136(%rbp)
	subq	$1024, -2168(%rbp)
	subq	$512, -2176(%rbp)
	cmpq	$290, %r15
	jne	.L81
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
.L101:
	.cfi_restore_state
	addq	%r15, %rdx
	leaq	0(,%rdx,8), %rcx
	vmovsd	-8(%r12,%rcx), %xmm0
	leaq	(%r15,%rdx), %r10
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rdi), %xmm0, %xmm0
	vaddsd	(%r12,%r10,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rcx), %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rdx,8)
	leaq	2(%rax), %rdx
	cmpq	%rdx, -2136(%rbp)
	jle	.L73
	addq	%r15, %rdx
	leaq	0(,%rdx,8), %rcx
	vmovsd	-8(%r12,%rcx), %xmm0
	leaq	(%r15,%rdx), %r10
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	vaddsd	16(%r12,%rdi), %xmm0, %xmm0
	vaddsd	(%r12,%r10,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rcx), %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rdx,8)
	leaq	3(%rax), %rdx
	cmpq	%rdx, -2136(%rbp)
	jle	.L73
	addq	%r15, %rdx
	leaq	0(,%rdx,8), %rcx
	vmovsd	-8(%r12,%rcx), %xmm0
	leaq	(%r15,%rdx), %r10
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	vaddsd	24(%r12,%rdi), %xmm0, %xmm0
	vaddsd	(%r12,%r10,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rcx), %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rdx,8)
	leaq	4(%rax), %rdx
	cmpq	%rdx, -2232(%rbp)
	jle	.L73
	addq	%r15, %rdx
	leaq	0(,%rdx,8), %rcx
	vmovsd	-8(%r12,%rcx), %xmm0
	leaq	(%r15,%rdx), %r10
	vaddsd	(%r12,%rdx,8), %xmm0, %xmm0
	addq	$5, %rax
	vaddsd	32(%r12,%rdi), %xmm0, %xmm0
	vaddsd	(%r12,%r10,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rcx), %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rdx,8)
	cmpq	%rax, -2232(%rbp)
	jle	.L73
	addq	%r15, %rax
	leaq	0(,%rax,8), %rdx
	vmovsd	-8(%r12,%rdx), %xmm0
	leaq	(%r15,%rax), %rcx
	vaddsd	(%r12,%rax,8), %xmm0, %xmm0
	vaddsd	40(%r12,%rdi), %xmm0, %xmm0
	vaddsd	(%r12,%rcx,8), %xmm0, %xmm0
	vaddsd	8(%r12,%rdx), %xmm0, %xmm0
	vmulsd	.LC21(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rax,8)
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L83:
	movl	$1, %eax
	jmp	.L71
	.p2align 4,,10
	.p2align 3
.L82:
	xorl	%eax, %eax
	jmp	.L68
	.p2align 4,,10
	.p2align 3
.L102:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm7
	jne	.L78
	jmp	.L80
.L100:
	vmovsd	.LC20(%rip), %xmm0
	call	pow
	jmp	.L62
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
