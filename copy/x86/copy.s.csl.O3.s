	.file	"copy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"casclakesp2"
	.text
	.p2align 4
	.globl	getFreq
	.type	getFreq, @function
getFreq:
.LFB24:
	.cfi_startproc
	movq	%rdi, %r8
	movq	%rsi, %rdx
	movl	$.LC0, %edi
	movl	$12, %ecx
	movq	%r8, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L2
	movl	$2500000000, %eax
	movq	%rax, (%rdx)
.L2:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	getFreq, .-getFreq
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC12:
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
	pushq	%r13
	.cfi_escape 0xf,0x3,0x76,0x68,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rdi, %r13
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	leaq	0(,%rdi,8), %r12
	movq	%r12, %rsi
	pushq	%rbx
	movl	$64, %edi
	subq	$1128, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x58
	call	aligned_alloc
	movq	%r12, %rsi
	movl	$64, %edi
	movq	%rax, %r15
	call	aligned_alloc
	movq	%rax, %r14
	leaq	-1(%r13), %rax
	movq	%rax, -1120(%rbp)
	testq	%r13, %r13
	jle	.L8
	cmpq	$2, %rax
	jbe	.L20
	movq	%r13, %rdx
	shrq	$2, %rdx
	salq	$5, %rdx
	vmovapd	.LC1(%rip), %ymm0
	movq	%r15, %rax
	addq	%r15, %rdx
.L10:
	vmovapd	%ymm0, (%rax)
	addq	$32, %rax
	cmpq	%rdx, %rax
	jne	.L10
	movq	%r13, %rdx
	andq	$-4, %rdx
	movl	%edx, %eax
	cmpq	%rdx, %r13
	je	.L31
	vzeroupper
.L9:
	vmovsd	.LC2(%rip), %xmm0
	movslq	%eax, %rdx
	vmovsd	%xmm0, (%r15,%rdx,8)
	leal	1(%rax), %edx
	movslq	%edx, %rdx
	cmpq	%rdx, %r13
	jle	.L8
	addl	$2, %eax
	cltq
	vmovsd	%xmm0, (%r15,%rdx,8)
	cmpq	%rax, %r13
	jle	.L8
	vmovsd	%xmm0, (%r15,%rax,8)
.L8:
	leaq	-2(%r13), %rax
	movq	%rax, -1112(%rbp)
	movq	-1120(%rbp), %rax
	movl	$1, %r12d
	movq	%rax, %rdx
	andq	$-4, %rax
	movq	%rax, -1128(%rbp)
	incq	%rax
	shrq	$2, %rdx
	movq	%rax, -1136(%rbp)
	salq	$5, %rdx
	leaq	8(%rdx), %rbx
	.p2align 4,,10
	.p2align 3
.L19:
	leaq	-1080(%rbp), %rsi
	leaq	-1096(%rbp), %rdi
	call	timing
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L18:
	vxorpd	%xmm6, %xmm6, %xmm6
	vcomisd	(%r15), %xmm6
	ja	.L32
.L12:
	cmpq	$1, %r13
	jle	.L14
	cmpq	$2, -1112(%rbp)
	jbe	.L21
	movl	$8, %eax
	.p2align 4,,10
	.p2align 3
    movl    $111,%ebx       #IACA START MARKER
    .byte   100,103,144     #IACA START MARKER
.L16:
	vmovupd	(%r15,%rax), %ymm5
	vmovupd	%ymm5, (%r14,%rax)
	addq	$32, %rax
	cmpq	%rax, %rbx
	jne	.L16
    movl    $222,%ebx       #IACA END MARKER
    .byte   100,103,144     #IACA END MARKER
	movq	-1120(%rbp), %rdx
	cmpq	%rdx, -1128(%rbp)
	je	.L14
	movq	-1136(%rbp), %rax
.L15:
	vmovsd	(%r15,%rax,8), %xmm0
	leaq	1(%rax), %rdi
	leaq	0(,%rax,8), %rsi
	vmovsd	%xmm0, (%r14,%rax,8)
	cmpq	%r13, %rdi
	jge	.L14
	vmovsd	8(%r15,%rsi), %xmm0
	addq	$2, %rax
	vmovsd	%xmm0, 8(%r14,%rsi)
	cmpq	%rax, %r13
	jle	.L14
	vmovsd	16(%r15,%rsi), %xmm0
	vmovsd	%xmm0, 16(%r14,%rsi)
.L14:
	incl	%ecx
	cmpl	%r12d, %ecx
	jne	.L18
	leaq	-1080(%rbp), %rsi
	leaq	-1088(%rbp), %rdi
	movl	%ecx, -1140(%rbp)
	vzeroupper
	call	timing
	vmovsd	-1088(%rbp), %xmm1
	vmovsd	.LC4(%rip), %xmm7
	vsubsd	-1096(%rbp), %xmm1, %xmm1
	movl	-1140(%rbp), %ecx
	vcomisd	%xmm1, %xmm7
	leal	(%rcx,%rcx), %r12d
	ja	.L19
	leaq	-1072(%rbp), %rdi
	movl	$1024, %esi
	sarl	%r12d
	vmovsd	%xmm1, -1112(%rbp)
	call	gethostname
	vxorps	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%r12d, %xmm2, %xmm0
	vcvtsi2sdq	%r13, %xmm2, %xmm3
	vmovsd	-1112(%rbp), %xmm1
	vmovsd	.LC6(%rip), %xmm7
	movslq	%r12d, %rax
	vmulsd	.LC5(%rip), %xmm3, %xmm6
	vmovapd	%xmm3, %xmm4
	vmulsd	%xmm3, %xmm0, %xmm3
	imulq	%r13, %rax
	vmovsd	.LC8(%rip), %xmm8
	vmulsd	.LC9(%rip), %xmm1, %xmm9
	vcvtsi2sdq	%rax, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm3, %xmm3
	movq	%r13, %rdx
	movl	%r12d, %esi
	movl	$.LC12, %edi
	movl	$6, %eax
	vdivsd	%xmm7, %xmm3, %xmm5
	vmulsd	.LC7(%rip), %xmm0, %xmm3
	vmulsd	%xmm6, %xmm0, %xmm0
	vmulsd	%xmm4, %xmm3, %xmm3
	vdivsd	%xmm1, %xmm3, %xmm3
	vdivsd	%xmm7, %xmm5, %xmm5
	vmulsd	%xmm8, %xmm3, %xmm4
	vmulsd	.LC10(%rip), %xmm2, %xmm3
	vmulsd	.LC11(%rip), %xmm0, %xmm2
	vmulsd	%xmm8, %xmm4, %xmm4
	vdivsd	%xmm7, %xmm6, %xmm0
	vdivsd	%xmm3, %xmm9, %xmm3
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r15, %rdi
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
.L32:
	.cfi_restore_state
	movq	%r15, %rdi
	movl	%ecx, -1140(%rbp)
	vzeroupper
	call	dummy
	movl	-1140(%rbp), %ecx
	jmp	.L12
.L21:
	movl	$1, %eax
	jmp	.L15
.L31:
	vzeroupper
	jmp	.L8
.L20:
	xorl	%eax, %eax
	jmp	.L9
	.cfi_endproc
.LFE25:
	.size	copy, .-copy
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"COPY b[i] = a[i], 4 byte/it, 0 Flop/it"
	.align 8
.LC15:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
	.align 8
.LC16:
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
	subq	$1024, %rsp
	.cfi_def_cfa_offset 1040
	movq	%rsp, %rdi
	call	gethostname
	movl	$.LC13, %edi
	call	puts
	vmovsd	.LC14(%rip), %xmm0
	movq	%rsp, %rsi
	movl	$.LC15, %edi
	movl	$1, %eax
	call	printf
	movl	$.LC16, %edi
	call	puts
	.p2align 4,,10
	.p2align 3
.L34:
	vxorpd	%xmm2, %xmm2, %xmm2
	vcvtsi2sdl	%ebx, %xmm2, %xmm1
	movq	.LC17(%rip), %rax
	incl	%ebx
	vmovq	%rax, %xmm0
	call	pow
	vcvttsd2sil	%xmm0, %edi
	movslq	%edi, %rdi
	call	copy
	cmpl	$36, %ebx
	jne	.L34
	addq	$1024, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC1:
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	1907715710
	.long	1048610426
	.align 8
.LC4:
	.long	2576980378
	.long	1070176665
	.align 8
.LC5:
	.long	0
	.long	1075838976
	.align 8
.LC6:
	.long	0
	.long	1083129856
	.align 8
.LC7:
	.long	0
	.long	1077936128
	.align 8
.LC8:
	.long	0
	.long	1062207488
	.align 8
.LC9:
	.long	536870912
	.long	1105371231
	.align 8
.LC10:
	.long	0
	.long	1069547520
	.align 8
.LC11:
	.long	2696277389
	.long	1051772663
	.align 8
.LC14:
	.long	0
	.long	1074003968
	.align 8
.LC17:
	.long	3435973837
	.long	1073007820
	.ident	"GCC: (GNU) 9.1.0"
	.section	.note.GNU-stack,"",@progbits
