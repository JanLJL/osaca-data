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
.LC16:
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
	subq	$1128, %rsp
	vmovsd	%xmm0, -1112(%rbp)
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
	testq	%rbx, %rbx
	leaq	-1(%rbx), %rax
	vmovsd	-1112(%rbp), %xmm12
	movq	%rax, -1112(%rbp)
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
	vmovsd	.LC6(%rip), %xmm3
	vmovsd	.LC7(%rip), %xmm4
	leal	1(%rax), %r9d
	movslq	%eax, %r8
	movslq	%r9d, %r10
	vmovsd	%xmm3, 0(%r13,%r8,8)
	vmovsd	%xmm4, (%r14,%r8,8)
	cmpq	%r10, %rbx
	jle	.L14
	addl	$2, %eax
	cltq
	vmovsd	%xmm3, 0(%r13,%r10,8)
	vmovsd	%xmm4, (%r14,%r10,8)
	cmpq	%rax, %rbx
	jle	.L14
	vmovsd	%xmm3, 0(%r13,%rax,8)
	vmovsd	%xmm4, (%r14,%rax,8)
.L14:
	movq	%rbx, %r15
	shrq	$2, %r15
	movq	%rbx, %r11
	salq	$5, %r15
	andq	$-4, %r11
	movl	$1, %r10d
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	-1096(%rbp), %rdi
	leaq	-1080(%rbp), %rsi
	movq	%r11, -1128(%rbp)
	movq	%r15, -1120(%rbp)
	movl	%r10d, -1136(%rbp)
	vmovsd	%xmm12, -1144(%rbp)
	call	timing
	vmovsd	-1144(%rbp), %xmm2
	movl	-1136(%rbp), %r11d
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
	cmpq	$2, -1112(%rbp)
	jbe	.L30
	leaq	-32(%rcx), %rdx
	shrq	$5, %rdx
	incq	%rdx
	vbroadcastsd	%xmm2, %ymm6
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
	vmovapd	(%r14), %ymm7
	movl	$32, %esi
	vfmadd213pd	0(%r13), %ymm6, %ymm7
	vmovapd	%ymm7, (%r12)
.L90:
	vmovapd	(%r14,%rsi), %ymm8
	vfmadd213pd	0(%r13,%rsi), %ymm6, %ymm8
	vmovapd	%ymm8, (%r12,%rsi)
	addq	$32, %rsi
.L89:
	vmovapd	(%r14,%rsi), %ymm9
	vfmadd213pd	0(%r13,%rsi), %ymm6, %ymm9
	vmovapd	%ymm9, (%r12,%rsi)
	addq	$32, %rsi
.L88:
	vmovapd	(%r14,%rsi), %ymm10
	vfmadd213pd	0(%r13,%rsi), %ymm6, %ymm10
	vmovapd	%ymm10, (%r12,%rsi)
	addq	$32, %rsi
.L87:
	vmovapd	(%r14,%rsi), %ymm11
	vfmadd213pd	0(%r13,%rsi), %ymm6, %ymm11
	vmovapd	%ymm11, (%r12,%rsi)
	addq	$32, %rsi
.L86:
	vmovapd	(%r14,%rsi), %ymm12
	vfmadd213pd	0(%r13,%rsi), %ymm6, %ymm12
	vmovapd	%ymm12, (%r12,%rsi)
	addq	$32, %rsi
.L85:
	vmovapd	(%r14,%rsi), %ymm13
	vfmadd213pd	0(%r13,%rsi), %ymm6, %ymm13
	vmovapd	%ymm13, (%r12,%rsi)
	addq	$32, %rsi
	cmpq	%rsi, %rcx
	je	.L108
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L22:
	vmovapd	(%r14,%rsi), %ymm14
	vmovapd	32(%r14,%rsi), %ymm15
	vmovapd	64(%r14,%rsi), %ymm1
	vmovapd	96(%r14,%rsi), %ymm0
	vmovapd	128(%r14,%rsi), %ymm3
	vmovapd	160(%r14,%rsi), %ymm4
	vmovapd	192(%r14,%rsi), %ymm5
	vmovapd	224(%r14,%rsi), %ymm7
	vfmadd213pd	0(%r13,%rsi), %ymm6, %ymm14
	vfmadd213pd	32(%r13,%rsi), %ymm6, %ymm15
	vfmadd213pd	64(%r13,%rsi), %ymm6, %ymm1
	vfmadd213pd	96(%r13,%rsi), %ymm6, %ymm0
	vfmadd213pd	128(%r13,%rsi), %ymm6, %ymm3
	vfmadd213pd	160(%r13,%rsi), %ymm6, %ymm4
	vfmadd213pd	192(%r13,%rsi), %ymm6, %ymm5
	vfmadd213pd	224(%r13,%rsi), %ymm6, %ymm7
	vmovapd	%ymm14, (%r12,%rsi)
	vmovapd	%ymm15, 32(%r12,%rsi)
	vmovapd	%ymm1, 64(%r12,%rsi)
	vmovapd	%ymm0, 96(%r12,%rsi)
	vmovapd	%ymm3, 128(%r12,%rsi)
	vmovapd	%ymm4, 160(%r12,%rsi)
	vmovapd	%ymm5, 192(%r12,%rsi)
	vmovapd	%ymm7, 224(%r12,%rsi)
	addq	$256, %rsi
	cmpq	%rsi, %rcx
	jne	.L22
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L108:
	movq	%rdi, %rax
	cmpq	%rdi, %rbx
	je	.L24
.L21:
	vmovsd	(%r14,%rax,8), %xmm6
	leaq	0(,%rax,8), %r8
	vfmadd213sd	0(%r13,%rax,8), %xmm2, %xmm6
	leaq	1(%rax), %r9
	vmovsd	%xmm6, (%r12,%r8)
	cmpq	%rbx, %r9
	jge	.L24
	vmovsd	8(%r14,%r8), %xmm8
	addq	$2, %rax
	vfmadd213sd	8(%r13,%r8), %xmm2, %xmm8
	vmovsd	%xmm8, 8(%r12,%r8)
	cmpq	%rax, %rbx
	jle	.L24
	vmovsd	16(%r14,%r8), %xmm9
	vfmadd213sd	16(%r13,%r8), %xmm2, %xmm9
	vmovsd	%xmm9, 16(%r12,%r8)
.L24:
	incl	%r15d
	cmpl	%r11d, %r15d
	jne	.L19
	movq	%rdi, -1128(%rbp)
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	movq	%rcx, -1120(%rbp)
	vmovsd	%xmm2, -1136(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm2
	vmovsd	.LC9(%rip), %xmm11
	vsubsd	-1096(%rbp), %xmm2, %xmm10
	leal	(%r15,%r15), %r10d
	movq	-1128(%rbp), %r11
	vcomisd	%xmm10, %xmm11
	movq	-1120(%rbp), %r15
	vmovsd	-1136(%rbp), %xmm12
	ja	.L10
	sarl	%r10d
	leaq	-1072(%rbp), %rdi
	movl	$1024, %esi
	vmovsd	%xmm10, -1112(%rbp)
	movl	%r10d, %r15d
	call	gethostname
	movabsq	$7308041938491629923, %rdi
	cmpq	%rdi, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L115
.L26:
	vmovsd	.LC3(%rip), %xmm13
.L28:
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2sdq	%rbx, %xmm14, %xmm4
	vcvtsi2sdl	%r15d, %xmm14, %xmm15
	vmovsd	.LC11(%rip), %xmm8
	movslq	%r15d, %rcx
	vmulsd	.LC10(%rip), %xmm4, %xmm6
	vmulsd	%xmm4, %xmm15, %xmm3
	vmulsd	.LC12(%rip), %xmm15, %xmm7
	imulq	%rbx, %rcx
	vmulsd	%xmm13, %xmm1, %xmm13
	vmulsd	%xmm6, %xmm15, %xmm15
	vdivsd	%xmm1, %xmm3, %xmm5
	vmulsd	%xmm4, %xmm7, %xmm9
	vcvtsi2sdq	%rcx, %xmm14, %xmm14
	vmovsd	.LC13(%rip), %xmm11
	vmulsd	.LC15(%rip), %xmm15, %xmm7
	movq	%rbx, %rdx
	vmulsd	.LC14(%rip), %xmm14, %xmm3
	movl	%r15d, %esi
	movl	$.LC16, %edi
	movl	$6, %eax
	vdivsd	%xmm1, %xmm9, %xmm2
	vdivsd	%xmm8, %xmm5, %xmm10
	vmulsd	%xmm11, %xmm2, %xmm12
	vmulsd	%xmm11, %xmm12, %xmm4
	vdivsd	%xmm8, %xmm6, %xmm0
	vdivsd	%xmm8, %xmm10, %xmm5
	vdivsd	%xmm3, %xmm13, %xmm3
	vdivsd	%xmm1, %xmm7, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	addq	$1128, %rsp
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
	movl	%r11d, -1136(%rbp)
	movq	%rcx, -1120(%rbp)
	vmovsd	%xmm2, -1144(%rbp)
	vzeroupper
	call	dummy
	vmovsd	-1144(%rbp), %xmm2
	movl	-1136(%rbp), %r11d
	movq	-1128(%rbp), %rdi
	movq	-1120(%rbp), %rcx
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L30:
	xorl	%eax, %eax
	jmp	.L21
.L115:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm13
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
	.size	triad, .-triad
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"TRIAD a[i] = b[i] + s * c[i], 24 byte/it, 2 Flop/it"
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
	movq	.LC22(%rip), %rcx
	vmovq	%rcx, %xmm0
	andl	$-64, %edi
	movslq	%edi, %rdi
	call	triad
.L117:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	movq	.LC21(%rip), %rsi
	vmovq	%rsi, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r8d
	movq	.LC22(%rip), %r9
	vmovq	%r9, %xmm0
	andl	$-64, %r8d
	movslq	%r8d, %rdi
	call	triad
	vxorpd	%xmm4, %xmm4, %xmm4
	leal	1(%rbx), %r10d
	vcvtsi2sdl	%r10d, %xmm4, %xmm1
	movq	.LC21(%rip), %r11
	vmovq	%r11, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %eax
	movq	.LC22(%rip), %rdx
	vmovq	%rdx, %xmm0
	andl	$-64, %eax
	movslq	%eax, %rdi
	call	triad
	vxorpd	%xmm5, %xmm5, %xmm5
	leal	2(%rbx), %edi
	vcvtsi2sdl	%edi, %xmm5, %xmm1
	movq	.LC21(%rip), %rcx
	vmovq	%rcx, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %esi
	movq	.LC22(%rip), %r8
	vmovq	%r8, %xmm0
	andl	$-64, %esi
	movslq	%esi, %rdi
	call	triad
	leal	3(%rbx), %r9d
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sdl	%r9d, %xmm6, %xmm1
	movq	.LC21(%rip), %r10
	vmovq	%r10, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %r11d
	movq	.LC22(%rip), %rax
	vmovq	%rax, %xmm0
	andl	$-64, %r11d
	movslq	%r11d, %rdi
	call	triad
	leal	4(%rbx), %edx
	vxorpd	%xmm7, %xmm7, %xmm7
	vcvtsi2sdl	%edx, %xmm7, %xmm1
	movq	.LC21(%rip), %rdi
	addl	$5, %ebx
	vmovq	%rdi, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %ecx
	movq	.LC22(%rip), %rsi
	vmovq	%rsi, %xmm0
	andl	$-64, %ecx
	movslq	%ecx, %rdi
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
	.align 8
.LC22:
	.long	981314128
	.long	1072935710
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
