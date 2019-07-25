	.arch armv8.1-a+crypto+crc
	.file	"scale.c"
	.text
	.align	2
	.p2align 4,,15
	.global	getFreq
	.type	getFreq, %function
getFreq:
.LFB24:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	adrp	x2, .LC0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x19, x1
	add	x1, x2, :lo12:.LC0
	mov	x20, x0
	bl	strcmp
	cbz	w0, .L7
	adrp	x1, .LC1
	mov	x0, x20
	add	x1, x1, :lo12:.LC1
	bl	strcmp
	cbnz	w0, .L4
	mov	x1, 22016
	movk	x1, 0x8321, lsl 16
	str	x1, [x19]
.L1:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 3
.L7:
	.cfi_restore_state
	mov	x1, 63744
	movk	x1, 0x9502, lsl 16
	str	x1, [x19]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 3
.L4:
	.cfi_restore_state
	mov	w0, -1
	b	.L1
	.cfi_endproc
.LFE24:
	.size	getFreq, .-getFreq
	.align	2
	.p2align 4,,15
	.global	scale
	.type	scale, %function
scale:
.LFB25:
	.cfi_startproc
	sub	sp, sp, #1168
	.cfi_def_cfa_offset 1168
	stp	x29, x30, [sp]
	.cfi_offset 29, -1168
	.cfi_offset 30, -1160
	mov	x29, sp
	stp	d8, d9, [sp, 80]
	.cfi_offset 72, -1088
	.cfi_offset 73, -1080
	fmov	d8, d0
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -1136
	.cfi_offset 22, -1128
	.cfi_offset 23, -1120
	.cfi_offset 24, -1112
	mov	x23, x0
	mov	x0, 64
	lsl	x21, x23, 3
	mov	x1, x21
	stp	x19, x20, [sp, 16]
	str	x25, [sp, 64]
	str	d10, [sp, 72]
	.cfi_offset 19, -1152
	.cfi_offset 20, -1144
	.cfi_offset 25, -1104
	.cfi_offset 74, -1096
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x21
	bl	aligned_alloc
	mov	x20, x0
	add	x1, x21, x19
	cmp	x23, 0
	ble	.L12
	adrp	x2, .LC3
	mov	x0, x19
	ldr	x2, [x2, #:lo12:.LC3]
	.p2align 4
.L11:
	str	x2, [x0], 8
	cmp	x0, x1
	bne	.L11
.L12:
	adrp	x0, .LC4
	dup	v0.2d, v8.d[0]
	lsr	x21, x23, 1
	and	x24, x23, -2
	ldr	d10, [x0, #:lo12:.LC4]
	mov	w25, 1
	lsl	x21, x21, 4
	.p2align 4
.L10:
	add	x1, sp, 136
	add	x0, sp, 120
	str	q0, [sp, 96]
	mov	w22, 0
	bl	timing
	ldr	q0, [sp, 96]
	.p2align 4
.L16:
	ldr	d1, [x19]
	fcmpe	d1, #0.0
	bmi	.L34
.L13:
	cmp	x23, 0
	ble	.L21
	mov	x0, 0
	cmp	x23, 1
	beq	.L18
	.p2align 4
    mov x1, #111
    .byte 213,3,32,31
.L19:
	ldr	q1, [x19, x0]
	fmul	v1.2d, v1.2d, v0.2d
	str	q1, [x20, x0]
	add	x0, x0, 16
	cmp	x21, x0
	bne	.L19
    mov x1, #222
    .byte 213,3,32,31
	cmp	x23, x24
	beq	.L21
	mov	x0, x24
.L18:
	lsl	x0, x0, 3
	ldr	d1, [x19, x0]
	fmul	d1, d1, d8
	str	d1, [x20, x0]
.L21:
	add	w22, w22, 1
	cmp	w22, w25
	bne	.L16
	add	x1, sp, 136
	add	x0, sp, 128
	str	q0, [sp, 96]
	lsl	w25, w22, 1
	bl	timing
	ldp	d2, d9, [sp, 120]
	ldr	q0, [sp, 96]
	fsub	d9, d9, d2
	fcmpe	d9, d10
	bmi	.L10
	mov	x1, 1024
	add	x0, sp, 144
	asr	w25, w25, 1
	bl	gethostname
	adrp	x1, .LC0
	add	x0, sp, 144
	add	x1, x1, :lo12:.LC0
	bl	strcmp
	scvtf	d10, x23
	scvtf	d2, w25
	mov	x1, 4629700416936869888
	sxtw	x3, w25
	fmov	d6, x1
	mov	x1, 70368744177664
	fmov	d0, 8.0e+0
	mul	x3, x3, x23
	movk	x1, 0x408f, lsl 48
	cmp	w0, 0
	adrp	x0, .LC5
	fmov	d17, 1.25e-1
	fmov	d5, x1
	ldr	d8, [x0, #:lo12:.LC5]
	adrp	x0, .LC6
	mov	x1, 4562146422526312448
	ldr	d18, [x0, #:lo12:.LC6]
	adrp	x0, .LC7
	fmov	d4, x1
	fmov	d1, d9
	scvtf	d3, x3
	ldr	d16, [x0, #:lo12:.LC7]
	adrp	x0, .LC2
	mov	w1, w25
	add	x0, x0, :lo12:.LC2
	mov	x2, x23
	fmul	d7, d10, d2
	fmul	d6, d2, d6
	fmul	d0, d10, d0
	fcsel	d8, d8, d18, eq
	fmul	d3, d3, d17
	fmul	d8, d9, d8
	fdiv	d7, d7, d9
	fmul	d6, d6, d10
	fmul	d2, d0, d2
	fdiv	d0, d0, d5
	fdiv	d3, d8, d3
	fdiv	d6, d6, d9
	fmul	d2, d2, d16
	fdiv	d2, d2, d9
	fdiv	d7, d7, d5
	fmul	d6, d6, d4
	fmul	d4, d6, d4
	fdiv	d5, d7, d5
	bl	printf
	mov	x0, x19
	bl	free
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	x0, x20
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldr	x25, [sp, 64]
	ldr	d10, [sp, 72]
	ldp	d8, d9, [sp, 80]
	add	sp, sp, 1168
	.cfi_remember_state
	.cfi_restore 74
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 25
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	free
	.p2align 3
.L34:
	.cfi_restore_state
	mov	x0, x19
	str	q0, [sp, 96]
	bl	dummy
	ldr	q0, [sp, 96]
	b	.L13
	.cfi_endproc
.LFE25:
	.size	scale, .-scale
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,15
	.global	main
	.type	main, %function
main:
.LFB26:
	.cfi_startproc
	sub	sp, sp, #1088
	.cfi_def_cfa_offset 1088
	adrp	x0, .LC11
	mov	x1, 1024
	stp	x29, x30, [sp]
	.cfi_offset 29, -1088
	.cfi_offset 30, -1080
	mov	x29, sp
	stp	d8, d9, [sp, 32]
	.cfi_offset 72, -1056
	.cfi_offset 73, -1048
	ldr	d9, [x0, #:lo12:.LC11]
	adrp	x0, .LC12
	ldr	d8, [x0, #:lo12:.LC12]
	add	x0, sp, 64
	str	x19, [sp, 16]
	.cfi_offset 19, -1072
	mov	w19, 20
	bl	gethostname
	add	x1, sp, 56
	add	x0, sp, 64
	bl	getFreq
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	mov	x0, 225833675390976
	ldr	d0, [sp, 56]
	add	x1, sp, 64
	movk	x0, 0x41cd, lsl 48
	fmov	d1, x0
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	scvtf	d0, d0
	fdiv	d0, d0, d1
	bl	printf
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	puts
	.p2align 4
.L36:
	scvtf	d1, w19
	fmov	d0, d9
	add	w19, w19, 1
	bl	pow
	fcvtzs	w0, d0
	fmov	d0, d8
	and	w0, w0, -64
	sxtw	x0, w0
	bl	scale
	cmp	w19, 36
	bne	.L36
	mov	w0, 0
	ldp	x29, x30, [sp]
	ldr	x19, [sp, 16]
	ldp	d8, d9, [sp, 32]
	add	sp, sp, 1088
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC3:
	.word	1907715710
	.word	1048610426
.LC4:
	.word	2576980378
	.word	1070176665
.LC5:
	.word	536870912
	.word	1105371231
.LC6:
	.word	3221225472
	.word	1105224746
.LC7:
	.word	2696277389
	.word	1051772663
.LC11:
	.word	3435973837
	.word	1073007820
.LC12:
	.word	981314128
	.word	1072935710
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"casclakesp2"
	.zero	4
.LC1:
	.string	"warmup"
	.zero	1
.LC2:
	.string	"%12.1f | %11.8f | %9.3f | %7.2f | %7.1f | %7.1f | %6d | %4ld \n"
	.zero	1
.LC8:
	.string	"SCALE b[i] = s * a[i], 16 byte/it, 1 Flop/it"
	.zero	3
.LC9:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
.LC10:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size"
	.ident	"GCC: (ARM-build-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
