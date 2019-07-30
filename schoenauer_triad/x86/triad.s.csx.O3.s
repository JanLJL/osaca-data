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
	movq	%rax, %r14
	call	aligned_alloc
	movq	%r15, %rsi
	movl	$64, %edi
	movq	%rax, %r13
	call	aligned_alloc
	movq	%rax, %r15
	leaq	-1(%rbx), %rax
	movq	%rax, -1112(%rbp)
	testq	%rbx, %rbx
	jle	.L14
	cmpq	$2, %rax
	jbe	.L29
	movq	%rbx, %rdx
	shrq	$2, %rdx
	vmovapd	.LC4(%rip), %ymm2
	vmovapd	.LC5(%rip), %ymm1
	vmovapd	.LC6(%rip), %ymm0
	salq	$5, %rdx
	xorl	%eax, %eax
.L12:
	vmovapd	%ymm2, (%r14,%rax)
	vmovapd	%ymm1, 0(%r13,%rax)
	vmovapd	%ymm0, (%r15,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L12
	movq	%rbx, %rdx
	andq	$-4, %rdx
	movl	%edx, %eax
	cmpq	%rdx, %rbx
	je	.L40
	vzeroupper
.L11:
	vmovsd	.LC7(%rip), %xmm2
	vmovsd	.LC8(%rip), %xmm1
	vmovsd	.LC9(%rip), %xmm0
	movslq	%eax, %rdx
	vmovsd	%xmm2, (%r14,%rdx,8)
	vmovsd	%xmm1, 0(%r13,%rdx,8)
	vmovsd	%xmm0, (%r15,%rdx,8)
	leal	1(%rax), %edx
	movslq	%edx, %rdx
	cmpq	%rdx, %rbx
	jle	.L14
	addl	$2, %eax
	cltq
	vmovsd	%xmm2, (%r14,%rdx,8)
	vmovsd	%xmm1, 0(%r13,%rdx,8)
	vmovsd	%xmm0, (%r15,%rdx,8)
	cmpq	%rax, %rbx
	jle	.L14
	vmovsd	%xmm2, (%r14,%rax,8)
	vmovsd	%xmm1, 0(%r13,%rax,8)
	vmovsd	%xmm0, (%r15,%rax,8)
.L14:
	movq	%rbx, %rdx
	shrq	$2, %rdx
	movq	%rbx, %r9
	salq	$5, %rdx
	andq	$-4, %r9
	movl	$1, %r10d
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	movl	%r10d, -1132(%rbp)
	movq	%r9, -1128(%rbp)
	movq	%rdx, -1120(%rbp)
	call	timing
	movl	-1132(%rbp), %r10d
	movq	-1128(%rbp), %r9
	movq	-1120(%rbp), %rdx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L19:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcomisd	(%r12), %xmm6
	ja	.L41
.L16:
	testq	%rbx, %rbx
	jle	.L24
	xorl	%eax, %eax
	cmpq	$2, -1112(%rbp)
	jbe	.L21
	.p2align 4,,10
	.p2align 3
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L22:
	vmovapd	0(%r13,%rax), %ymm0
	vmovapd	(%r14,%rax), %ymm5
	vfmadd132pd	(%r15,%rax), %ymm5, %ymm0
	vmovapd	%ymm0, (%r12,%rax)
	addq	$32, %rax
	cmpq	%rax, %rdx
	jne	.L22
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
	cmpq	%r9, %rbx
	je	.L24
	movq	%r9, %rax
.L21:
	vmovsd	0(%r13,%rax,8), %xmm0
	vmovsd	(%r14,%rax,8), %xmm7
	leaq	0(,%rax,8), %rsi
	vfmadd132sd	(%r15,%rax,8), %xmm7, %xmm0
	leaq	1(%rax), %rdi
	vmovsd	%xmm0, (%r12,%rsi)
	cmpq	%rbx, %rdi
	jge	.L24
	vmovsd	8(%r13,%rsi), %xmm0
	vmovsd	8(%r14,%rsi), %xmm4
	addq	$2, %rax
	vfmadd132sd	8(%r15,%rsi), %xmm4, %xmm0
	vmovsd	%xmm0, 8(%r12,%rsi)
	cmpq	%rax, %rbx
	jle	.L24
	vmovsd	16(%r15,%rsi), %xmm0
	vmovsd	16(%r14,%rsi), %xmm3
	vfmadd132sd	16(%r13,%rsi), %xmm3, %xmm0
	vmovsd	%xmm0, 16(%r12,%rsi)
.L24:
	incl	%ecx
	cmpl	%r10d, %ecx
	jne	.L19
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	movl	%ecx, -1132(%rbp)
	movq	%r9, -1128(%rbp)
	movq	%rdx, -1120(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm1
	vmovsd	.LC11(%rip), %xmm2
	vsubsd	-1096(%rbp), %xmm1, %xmm1
	movl	-1132(%rbp), %ecx
	movq	-1120(%rbp), %rdx
	vcomisd	%xmm1, %xmm2
	movq	-1128(%rbp), %r9
	leal	(%rcx,%rcx), %r10d
	ja	.L10
	sarl	%r10d
	movl	$1024, %esi
	leaq	-1072(%rbp), %rdi
	vmovsd	%xmm1, -1112(%rbp)
	movl	%r10d, %r15d
	call	gethostname
	movabsq	$7308041938491629923, %rax
	cmpq	%rax, -1072(%rbp)
	vmovsd	-1112(%rbp), %xmm1
	je	.L42
.L26:
	vmovsd	.LC3(%rip), %xmm7
.L28:
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%r15d, %xmm2, %xmm0
	vcvtsi2sdq	%rbx, %xmm2, %xmm3
	vmovsd	.LC13(%rip), %xmm8
	movslq	%r15d, %rax
	imulq	%rbx, %rax
	vmulsd	.LC12(%rip), %xmm3, %xmm6
	vmovapd	%xmm3, %xmm4
	vmulsd	%xmm3, %xmm0, %xmm3
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	vmovsd	.LC15(%rip), %xmm9
	vmulsd	%xmm7, %xmm1, %xmm7
	movq	%rbx, %rdx
	vdivsd	%xmm1, %xmm3, %xmm3
	movl	%r15d, %esi
	movl	$.LC18, %edi
	movl	$6, %eax
	vdivsd	%xmm8, %xmm3, %xmm5
	vmulsd	.LC14(%rip), %xmm0, %xmm3
	vmulsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm3, %xmm3
	vdivsd	%xmm1, %xmm3, %xmm3
	vdivsd	%xmm8, %xmm5, %xmm5
	vmulsd	%xmm9, %xmm3, %xmm4
	vmulsd	.LC16(%rip), %xmm2, %xmm3
	vmulsd	.LC17(%rip), %xmm0, %xmm2
	vmulsd	%xmm9, %xmm4, %xmm4
	vdivsd	%xmm8, %xmm6, %xmm0
	vdivsd	%xmm3, %xmm7, %xmm3
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r14, %rdi
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
.L41:
	.cfi_restore_state
	movq	%r12, %rdi
	movl	%ecx, -1136(%rbp)
	movl	%r10d, -1132(%rbp)
	movq	%r9, -1128(%rbp)
	movq	%rdx, -1120(%rbp)
	vzeroupper
	call	dummy
	movl	-1136(%rbp), %ecx
	movl	-1132(%rbp), %r10d
	movq	-1128(%rbp), %r9
	movq	-1120(%rbp), %rdx
	jmp	.L16
.L42:
	cmpl	$3305587, -1064(%rbp)
	vmovsd	.LC2(%rip), %xmm7
	jne	.L26
	jmp	.L28
.L40:
	vzeroupper
	jmp	.L14
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
	movl	$20, %ebx
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
	.p2align 4,,10
	.p2align 3
.L44:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	movq	.LC23(%rip), %rax
	incl	%ebx
	vmovq	%rax, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %edi
	andl	$-64, %edi
	movslq	%edi, %rdi
	call	triad
	cmpl	$36, %ebx
	jne	.L44
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
