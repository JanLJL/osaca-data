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
	mov	x3, 22016
	movk	x3, 0x8321, lsl 16
	str	x3, [x19]
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
	mov	x4, 63744
	movk	x4, 0x9502, lsl 16
	str	x4, [x19]
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
	.cfi_offset 21, -1136
	.cfi_offset 22, -1128
	mov	x22, x0
	mov	x0, 64
	lsl	x21, x22, 3
	mov	x1, x21
	stp	x19, x20, [sp, 16]
	stp	x23, x24, [sp, 48]
	str	x25, [sp, 64]
	str	d10, [sp, 72]
	.cfi_offset 19, -1152
	.cfi_offset 20, -1144
	.cfi_offset 23, -1120
	.cfi_offset 24, -1112
	.cfi_offset 25, -1104
	.cfi_offset 74, -1096
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x21
	bl	aligned_alloc
	mov	x20, x0
	add	x3, x21, x19
	cmp	x22, 0
	ble	.L12
	sub	x1, x3, x19
	adrp	x2, .LC3
	mov	x0, x19
	sub	x5, x1, #8
	ldr	x4, [x2, #:lo12:.LC3]
	lsr	x6, x5, 3
	add	x7, x6, 1
	ands	x8, x7, 7
	beq	.L11
	cmp	x8, 1
	beq	.L74
	cmp	x8, 2
	beq	.L75
	cmp	x8, 3
	beq	.L76
	cmp	x8, 4
	beq	.L77
	cmp	x8, 5
	beq	.L78
	cmp	x8, 6
	beq	.L79
	str	x4, [x0], 8
.L79:
	str	x4, [x0], 8
.L78:
	str	x4, [x0], 8
.L77:
	str	x4, [x0], 8
.L76:
	str	x4, [x0], 8
.L75:
	str	x4, [x0], 8
.L74:
	str	x4, [x0], 8
	cmp	x0, x3
	beq	.L12
.L11:
	mov	x9, x0
	str	x4, [x9], 8
	str	x4, [x0, 8]
	str	x4, [x9, 8]
	stp	x4, x4, [x0, 24]
	stp	x4, x4, [x0, 40]
	add	x0, x0, 64
	str	x4, [x0, -8]
	cmp	x0, x3
	bne	.L11
.L12:
	adrp	x10, .LC4
	dup	v3.2d, v8.d[0]
	lsr	x23, x22, 1
	and	x24, x22, -2
	ldr	d9, [x10, #:lo12:.LC4]
	mov	w25, 1
	lsl	x23, x23, 4
	.p2align 4
.L10:
	add	x1, sp, 136
	add	x0, sp, 120
	str	q3, [sp, 96]
	mov	w21, 0
	bl	timing
	ldr	q3, [sp, 96]
	.p2align 4
.L16:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	bmi	.L105
.L13:
	cmp	x22, 0
	ble	.L21
	cmp	x22, 1
	beq	.L24
	sub	x12, x23, #16
	mov	x16, 0
	lsr	x13, x12, 4
	add	x14, x13, 1
	ands	x15, x14, 7
	beq	.L19
	cmp	x15, 1
	beq	.L80
	cmp	x15, 2
	beq	.L81
	cmp	x15, 3
	beq	.L82
	cmp	x15, 4
	beq	.L83
	cmp	x15, 5
	beq	.L84
	cmp	x15, 6
	beq	.L85
	ldr	q1, [x19]
	mov	x16, 16
	fmul	v2.2d, v1.2d, v3.2d
	str	q2, [x20]
.L85:
	ldr	q4, [x19, x16]
	fmul	v5.2d, v4.2d, v3.2d
	str	q5, [x20, x16]
	add	x16, x16, 16
.L84:
	ldr	q6, [x19, x16]
	fmul	v7.2d, v6.2d, v3.2d
	str	q7, [x20, x16]
	add	x16, x16, 16
.L83:
	ldr	q10, [x19, x16]
	fmul	v16.2d, v10.2d, v3.2d
	str	q16, [x20, x16]
	add	x16, x16, 16
.L82:
	ldr	q17, [x19, x16]
	fmul	v18.2d, v17.2d, v3.2d
	str	q18, [x20, x16]
	add	x16, x16, 16
.L81:
	ldr	q19, [x19, x16]
	fmul	v20.2d, v19.2d, v3.2d
	str	q20, [x20, x16]
	add	x16, x16, 16
.L80:
	ldr	q21, [x19, x16]
	fmul	v22.2d, v21.2d, v3.2d
	str	q22, [x20, x16]
	add	x16, x16, 16
	cmp	x23, x16
	beq	.L103
    mov x1, #111
    .byte 213,3,32,31
.L19:
	add	x17, x16, 16
	ldr	q23, [x19, x16]
	add	x1, x16, 32
	add	x18, x16, 48
	ldr	q24, [x19, x17]
	ldr	q26, [x19, x1]
	add	x30, x16, 64
	add	x4, x16, 80
	ldr	q25, [x19, x18]
	ldr	q27, [x19, x30]
	add	x3, x16, 96
	add	x2, x16, 112
	ldr	q28, [x19, x4]
	ldr	q29, [x19, x3]
	fmul	v30.2d, v23.2d, v3.2d
	ldr	q31, [x19, x2]
	fmul	v7.2d, v24.2d, v3.2d
	fmul	v6.2d, v26.2d, v3.2d
	fmul	v5.2d, v25.2d, v3.2d
	fmul	v4.2d, v27.2d, v3.2d
	fmul	v2.2d, v28.2d, v3.2d
	fmul	v1.2d, v29.2d, v3.2d
	fmul	v0.2d, v31.2d, v3.2d
	str	q30, [x20, x16]
	add	x16, x16, 128
	str	q7, [x20, x17]
	str	q6, [x20, x1]
	str	q5, [x20, x18]
	str	q4, [x20, x30]
	str	q2, [x20, x4]
	str	q1, [x20, x3]
	str	q0, [x20, x2]
	cmp	x23, x16
	bne	.L19
    mov x1, #222
    .byte 213,3,32,31
.L103:
	mov	x11, x24
	cmp	x22, x24
	beq	.L21
.L18:
	lsl	x5, x11, 3
	ldr	d10, [x19, x5]
	fmul	d16, d10, d8
	str	d16, [x20, x5]
.L21:
	add	w21, w21, 1
	cmp	w21, w25
	bne	.L16
	add	x1, sp, 136
	add	x0, sp, 128
	str	q3, [sp, 96]
	lsl	w25, w21, 1
	bl	timing
	ldp	d17, d18, [sp, 120]
	ldr	q3, [sp, 96]
	fsub	d10, d18, d17
	fcmpe	d10, d9
	bmi	.L10
	mov	x1, 1024
	add	x0, sp, 144
	asr	w24, w25, 1
	bl	gethostname
	mov	x23, 4562146422526312448
	adrp	x6, .LC0
	add	x0, sp, 144
	add	x1, x6, :lo12:.LC0
	bl	strcmp
	scvtf	d19, w24
	scvtf	d9, x22
	mov	x7, 4629700416936869888
	mov	x8, 70368744177664
	fmov	d20, x7
	movk	x8, 0x408f, lsl 48
	fmov	d21, 8.0e+0
	sxtw	x9, w24
	fmov	d22, x8
	mul	x12, x9, x22
	cmp	w0, 0
	adrp	x10, .LC6
	adrp	x0, .LC5
	ldr	d23, [x10, #:lo12:.LC6]
	adrp	x11, .LC7
	fmov	d25, 1.25e-1
	ldr	d8, [x0, #:lo12:.LC5]
	ldr	d24, [x11, #:lo12:.LC7]
	fmov	d26, x23
	fmov	d1, d10
	adrp	x13, .LC2
	mov	w1, w24
	mov	x2, x22
	scvtf	d30, x12
	add	x0, x13, :lo12:.LC2
	fmul	d28, d9, d19
	fmul	d29, d19, d20
	fmul	d27, d9, d21
	fcsel	d31, d8, d23, eq
	fmul	d16, d10, d31
	fdiv	d7, d28, d10
	fmul	d6, d29, d9
	fmul	d4, d27, d19
	fmul	d5, d30, d25
	fdiv	d0, d27, d22
	fdiv	d17, d6, d10
	fmul	d2, d4, d24
	fdiv	d3, d16, d5
	fdiv	d2, d2, d10
	fdiv	d18, d7, d22
	fmul	d10, d17, d26
	fmul	d4, d10, d26
	fdiv	d5, d18, d22
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
.L105:
	.cfi_restore_state
	mov	x0, x19
	str	q3, [sp, 96]
	bl	dummy
	ldr	q3, [sp, 96]
	b	.L13
	.p2align 3
.L24:
	mov	x11, 0
	b	.L18
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
	adrp	x2, .LC12
	adrp	x0, .LC11
	stp	x29, x30, [sp]
	.cfi_offset 29, -1088
	.cfi_offset 30, -1080
	mov	x29, sp
	mov	x1, 1024
	stp	d8, d9, [sp, 32]
	.cfi_offset 72, -1056
	.cfi_offset 73, -1048
	ldr	d9, [x0, #:lo12:.LC11]
	add	x0, sp, 64
	ldr	d8, [x2, #:lo12:.LC12]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1072
	.cfi_offset 20, -1064
	mov	w19, 21
	bl	gethostname
	add	x1, sp, 56
	add	x0, sp, 64
	bl	getFreq
	adrp	x1, .LC8
	add	x0, x1, :lo12:.LC8
	bl	puts
	mov	x3, 225833675390976
	ldr	d0, [sp, 56]
	adrp	x4, .LC9
	movk	x3, 0x41cd, lsl 48
	add	x1, sp, 64
	add	x0, x4, :lo12:.LC9
	fmov	d1, x3
	scvtf	d2, d0
	fdiv	d0, d2, d1
	bl	printf
	adrp	x5, .LC10
	add	x0, x5, :lo12:.LC10
	bl	puts
	fmov	d0, d9
	fmov	d1, 2.0e+1
	bl	pow
	fcvtzs	w6, d0
	fmov	d0, d8
	and	w7, w6, -64
	sxtw	x0, w7
	bl	scale
.L107:
	scvtf	d1, w19
	fmov	d0, d9
	add	w20, w19, 1
	bl	pow
	fcvtzs	w8, d0
	fmov	d0, d8
	and	w9, w8, -64
	sxtw	x0, w9
	bl	scale
	scvtf	d1, w20
	fmov	d0, d9
	bl	pow
	fcvtzs	w10, d0
	fmov	d0, d8
	and	w11, w10, -64
	sxtw	x0, w11
	bl	scale
	add	w12, w20, 1
	fmov	d0, d9
	scvtf	d1, w12
	bl	pow
	fcvtzs	w13, d0
	fmov	d0, d8
	and	w14, w13, -64
	sxtw	x0, w14
	bl	scale
	add	w15, w19, 3
	fmov	d0, d9
	scvtf	d1, w15
	bl	pow
	fcvtzs	w16, d0
	fmov	d0, d8
	and	w17, w16, -64
	sxtw	x0, w17
	bl	scale
	add	w18, w19, 4
	fmov	d0, d9
	add	w19, w19, 5
	scvtf	d1, w18
	bl	pow
	fcvtzs	w0, d0
	fmov	d0, d8
	and	w2, w0, -64
	sxtw	x0, w2
	bl	scale
	cmp	w19, 36
	bne	.L107
	mov	w0, 0
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 32]
	add	sp, sp, 1088
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 19
	.cfi_restore 20
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
