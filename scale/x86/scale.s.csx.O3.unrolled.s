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
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$2200000000, %edx
	movq	%rdx, (%r8)
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	movl	$2500000000, %r9d
	movq	%r9, (%r8)
	ret
	.p2align 4,,10
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
	movq	%rdi, %r14
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
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
	testq	%r14, %r14
	leaq	-1(%r14), %rax
	vmovsd	-1112(%rbp), %xmm10
	movq	%rax, -1112(%rbp)
	jle	.L16
	cmpq	$2, %rax
	jbe	.L33
	movq	%r14, %rdx
	shrq	$2, %rdx
	salq	$5, %rdx
	leaq	(%rdx,%r12), %rcx
	subq	$32, %rdx
	shrq	$5, %rdx
	incq	%rdx
	vmovapd	.LC6(%rip), %ymm0
	movq	%r12, %rsi
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
	jne	.L117
.L89:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L88:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L87:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L86:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L85:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
.L84:
	vmovapd	%ymm0, (%rsi)
	addq	$32, %rsi
	cmpq	%rcx, %rsi
	je	.L114
.L14:
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
	jne	.L14
.L114:
	movq	%r14, %rdi
	andq	$-4, %rdi
	movl	%edi, %eax
	cmpq	%rdi, %r14
	je	.L118
	vzeroupper
.L13:
	vmovsd	.LC7(%rip), %xmm1
	leal	1(%rax), %r9d
	movslq	%eax, %r8
	movslq	%r9d, %r10
	vmovsd	%xmm1, (%r12,%r8,8)
	cmpq	%r10, %r14
	jle	.L16
	addl	$2, %eax
	cltq
	vmovsd	%xmm1, (%r12,%r10,8)
	cmpq	%rax, %r14
	jle	.L16
	vmovsd	%xmm1, (%r12,%rax,8)
.L16:
	movq	%r14, %r15
	shrq	$2, %r15
	movq	%r14, %r9
	salq	$5, %r15
	andq	$-4, %r9
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L12:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	movq	%r9, -1120(%rbp)
	vmovsd	%xmm10, -1128(%rbp)
	call	timing
	vmovsd	-1128(%rbp), %xmm2
	movq	-1120(%rbp), %rcx
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L21:
	vxorpd	%xmm5, %xmm5, %xmm5
	vcomisd	(%r12), %xmm5
	ja	.L119
.L18:
	testq	%r14, %r14
	jle	.L26
	cmpq	$2, -1112(%rbp)
	jbe	.L34
	leaq	-32(%r15), %rdx
	shrq	$5, %rdx
	incq	%rdx
	vbroadcastsd	%xmm2, %ymm3
	xorl	%edi, %edi
	andl	$7, %edx
	je	.L24
	cmpq	$1, %rdx
	je	.L90
	cmpq	$2, %rdx
	je	.L91
	cmpq	$3, %rdx
	je	.L92
	cmpq	$4, %rdx
	je	.L93
	cmpq	$5, %rdx
	je	.L94
	cmpq	$6, %rdx
	je	.L95
	vmulpd	(%r12), %ymm3, %ymm4
	movl	$32, %edi
	vmovapd	%ymm4, 0(%r13)
.L95:
	vmulpd	(%r12,%rdi), %ymm3, %ymm6
	vmovapd	%ymm6, 0(%r13,%rdi)
	addq	$32, %rdi
.L94:
	vmulpd	(%r12,%rdi), %ymm3, %ymm7
	vmovapd	%ymm7, 0(%r13,%rdi)
	addq	$32, %rdi
.L93:
	vmulpd	(%r12,%rdi), %ymm3, %ymm8
	vmovapd	%ymm8, 0(%r13,%rdi)
	addq	$32, %rdi
.L92:
	vmulpd	(%r12,%rdi), %ymm3, %ymm9
	vmovapd	%ymm9, 0(%r13,%rdi)
	addq	$32, %rdi
.L91:
	vmulpd	(%r12,%rdi), %ymm3, %ymm10
	vmovapd	%ymm10, 0(%r13,%rdi)
	addq	$32, %rdi
.L90:
	vmulpd	(%r12,%rdi), %ymm3, %ymm11
	vmovapd	%ymm11, 0(%r13,%rdi)
	addq	$32, %rdi
	cmpq	%rdi, %r15
	je	.L113
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
    # LLVM-MCA-BEGIN
.L24:
	vmulpd	(%r12,%rdi), %ymm3, %ymm12
	vmulpd	32(%r12,%rdi), %ymm3, %ymm13
	vmulpd	64(%r12,%rdi), %ymm3, %ymm14
	vmulpd	96(%r12,%rdi), %ymm3, %ymm15
	vmulpd	128(%r12,%rdi), %ymm3, %ymm0
	vmulpd	160(%r12,%rdi), %ymm3, %ymm1
	vmulpd	192(%r12,%rdi), %ymm3, %ymm5
	vmulpd	224(%r12,%rdi), %ymm3, %ymm4
	vmovapd	%ymm12, 0(%r13,%rdi)
	vmovapd	%ymm13, 32(%r13,%rdi)
	vmovapd	%ymm14, 64(%r13,%rdi)
	vmovapd	%ymm15, 96(%r13,%rdi)
	vmovapd	%ymm0, 128(%r13,%rdi)
	vmovapd	%ymm1, 160(%r13,%rdi)
	vmovapd	%ymm5, 192(%r13,%rdi)
	vmovapd	%ymm4, 224(%r13,%rdi)
	addq	$256, %rdi
	cmpq	%rdi, %r15
	jne	.L24
    # LLVM-MCA-END
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
.L113:
	movq	%rcx, %rsi
	cmpq	%rcx, %r14
	je	.L26
.L23:
	vmulsd	(%r12,%rsi,8), %xmm2, %xmm3
	leaq	1(%rsi), %r8
	leaq	0(,%rsi,8), %rax
	vmovsd	%xmm3, 0(%r13,%rsi,8)
	cmpq	%r14, %r8
	jge	.L26
	vmulsd	8(%r12,%rax), %xmm2, %xmm6
	addq	$2, %rsi
	vmovsd	%xmm6, 8(%r13,%rax)
	cmpq	%rsi, %r14
	jle	.L26
	vmulsd	16(%r12,%rax), %xmm2, %xmm7
	vmovsd	%xmm7, 16(%r13,%rax)
.L26:
	incl	%r11d
	cmpl	%r11d, %ebx
	jne	.L21
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	movq	%rcx, -1120(%rbp)
	vmovsd	%xmm2, -1128(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm2
	vmovsd	.LC9(%rip), %xmm9
	vsubsd	-1096(%rbp), %xmm2, %xmm8
	addl	%ebx, %ebx
	movq	-1120(%rbp), %r9
	vcomisd	%xmm8, %xmm9
	vmovsd	-1128(%rbp), %xmm10
	ja	.L12
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm8, -1112(%rbp)
	call	gethostname
	movabsq	$7308041938491629923, %r10
	sarl	%ebx
	cmpq	%r10, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L120
	cmpl	$1836212599, -1072(%rbp)
	je	.L121
.L31:
	vmovsd	.LC5(%rip), %xmm11
.L30:
	vxorps	%xmm12, %xmm12, %xmm12
	vcvtsi2sdq	%r14, %xmm12, %xmm4
	vcvtsi2sdl	%ebx, %xmm12, %xmm13
	vmovsd	.LC11(%rip), %xmm7
	movslq	%ebx, %r15
	vmulsd	.LC10(%rip), %xmm4, %xmm15
	vmulsd	%xmm4, %xmm13, %xmm0
	vmulsd	.LC12(%rip), %xmm13, %xmm3
	imulq	%r14, %r15
	vmulsd	%xmm11, %xmm1, %xmm11
	vmulsd	%xmm15, %xmm13, %xmm13
	vdivsd	%xmm1, %xmm0, %xmm5
	vmulsd	%xmm4, %xmm3, %xmm6
	vcvtsi2sdq	%r15, %xmm12, %xmm12
	vmovsd	.LC13(%rip), %xmm9
	movq	%r14, %rdx
	movl	%ebx, %esi
	vmulsd	.LC14(%rip), %xmm12, %xmm14
	movl	$.LC16, %edi
	movl	$6, %eax
	vdivsd	%xmm1, %xmm6, %xmm2
	vmulsd	.LC15(%rip), %xmm13, %xmm6
	vdivsd	%xmm7, %xmm5, %xmm8
	vmulsd	%xmm9, %xmm2, %xmm10
	vmulsd	%xmm9, %xmm10, %xmm4
	vdivsd	%xmm7, %xmm15, %xmm0
	vdivsd	%xmm7, %xmm8, %xmm5
	vdivsd	%xmm14, %xmm11, %xmm3
	vdivsd	%xmm1, %xmm6, %xmm2
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
.L119:
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
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L34:
	xorl	%esi, %esi
	jmp	.L23
.L120:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC3(%rip), %xmm11
	je	.L30
	cmpl	$1836212599, -1072(%rbp)
	jne	.L31
.L121:
	cmpw	$28789, -1068(%rbp)
	jne	.L31
	cmpb	$0, -1066(%rbp)
	vmovsd	.LC4(%rip), %xmm11
	je	.L30
	jmp	.L31
.L118:
	vzeroupper
	jmp	.L16
.L117:
	vmovapd	%ymm0, (%r12)
	leaq	32(%r12), %rsi
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
	call	scale
.L123:
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
	call	scale
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
	call	scale
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
	call	scale
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
	call	scale
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
	call	scale
	cmpl	$36, %ebx
	jne	.L123
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
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC6:
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
