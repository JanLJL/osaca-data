	.arch armv8.1-a+crypto+crc
	.file	"triad.c"
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
	.global	triad
	.type	triad, %function
triad:
.LFB25:
	.cfi_startproc
	sub	sp, sp, #1184
	.cfi_def_cfa_offset 1184
	stp	x29, x30, [sp]
	.cfi_offset 29, -1184
	.cfi_offset 30, -1176
	mov	x29, sp
	stp	d8, d9, [sp, 80]
	.cfi_offset 72, -1104
	.cfi_offset 73, -1096
	fmov	d8, d0
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -1152
	.cfi_offset 22, -1144
	.cfi_offset 23, -1136
	.cfi_offset 24, -1128
	mov	x23, x0
	mov	x0, 64
	lsl	x22, x23, 3
	mov	x1, x22
	stp	x19, x20, [sp, 16]
	stp	x25, x26, [sp, 64]
	str	d10, [sp, 96]
	.cfi_offset 19, -1168
	.cfi_offset 20, -1160
	.cfi_offset 25, -1120
	.cfi_offset 26, -1112
	.cfi_offset 74, -1088
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x22
	bl	aligned_alloc
	mov	x20, x0
	mov	x0, 64
	mov	x1, x22
	bl	aligned_alloc
	mov	x21, x0
	cmp	x23, 0
	ble	.L11
	sub	x3, x22, #8
	adrp	x1, .LC3
	adrp	x4, .LC4
	lsr	x5, x3, 3
	mov	x0, 0
	ldr	x2, [x1, #:lo12:.LC3]
	add	x6, x5, 1
	ldr	x10, [x4, #:lo12:.LC4]
	ands	x7, x6, 7
	beq	.L9
	cmp	x7, 1
	beq	.L74
	cmp	x7, 2
	beq	.L75
	cmp	x7, 3
	beq	.L76
	cmp	x7, 4
	beq	.L77
	cmp	x7, 5
	beq	.L78
	cmp	x7, 6
	bne	.L105
.L79:
	str	x2, [x20, x0]
	str	x10, [x21, x0]
	add	x0, x0, 8
.L78:
	str	x2, [x20, x0]
	str	x10, [x21, x0]
	add	x0, x0, 8
.L77:
	str	x2, [x20, x0]
	str	x10, [x21, x0]
	add	x0, x0, 8
.L76:
	str	x2, [x20, x0]
	str	x10, [x21, x0]
	add	x0, x0, 8
.L75:
	str	x2, [x20, x0]
	str	x10, [x21, x0]
	add	x0, x0, 8
.L74:
	str	x2, [x20, x0]
	str	x10, [x21, x0]
	add	x0, x0, 8
	cmp	x22, x0
	beq	.L11
.L9:
	add	x11, x0, 8
	str	x2, [x20, x0]
	add	x9, x0, 16
	add	x8, x0, 24
	str	x10, [x21, x0]
	add	x12, x0, 32
	add	x13, x0, 40
	add	x14, x0, 48
	str	x2, [x20, x11]
	add	x15, x0, 56
	add	x0, x0, 64
	str	x10, [x21, x11]
	str	x2, [x20, x9]
	str	x10, [x21, x9]
	str	x2, [x20, x8]
	str	x10, [x21, x8]
	str	x2, [x20, x12]
	str	x10, [x21, x12]
	str	x2, [x20, x13]
	str	x10, [x21, x13]
	str	x2, [x20, x14]
	str	x10, [x21, x14]
	str	x2, [x20, x15]
	str	x10, [x21, x15]
	cmp	x22, x0
	bne	.L9
.L11:
	adrp	x16, .LC5
	dup	v3.2d, v8.d[0]
	lsr	x24, x23, 1
	and	x25, x23, -2
	ldr	d9, [x16, #:lo12:.LC5]
	mov	w26, 1
	lsl	x24, x24, 4
	.p2align 4
.L10:
	add	x1, sp, 152
	add	x0, sp, 136
	str	q3, [sp, 112]
	mov	w22, 0
	bl	timing
	ldr	q3, [sp, 112]
	.p2align 4
.L15:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	bmi	.L106
.L12:
	cmp	x23, 0
	ble	.L20
	cmp	x23, 1
	beq	.L24
	sub	x18, x24, #16
	mov	x10, 0
	lsr	x30, x18, 4
	add	x3, x30, 1
	ands	x1, x3, 7
	beq	.L18
	cmp	x1, 1
	beq	.L80
	cmp	x1, 2
	beq	.L81
	cmp	x1, 3
	beq	.L82
	cmp	x1, 4
	beq	.L83
	cmp	x1, 5
	beq	.L84
	cmp	x1, 6
	beq	.L85
	ldr	q1, [x21]
	ldr	q2, [x20]
	mov	x10, 16
	fmla	v2.2d, v1.2d, v3.2d
	str	q2, [x19]
.L85:
	ldr	q4, [x21, x10]
	ldr	q5, [x20, x10]
	fmla	v5.2d, v4.2d, v3.2d
	str	q5, [x19, x10]
	add	x10, x10, 16
.L84:
	ldr	q6, [x21, x10]
	ldr	q7, [x20, x10]
	fmla	v7.2d, v6.2d, v3.2d
	str	q7, [x19, x10]
	add	x10, x10, 16
.L83:
	ldr	q10, [x21, x10]
	ldr	q16, [x20, x10]
	fmla	v16.2d, v10.2d, v3.2d
	str	q16, [x19, x10]
	add	x10, x10, 16
.L82:
	ldr	q17, [x21, x10]
	ldr	q18, [x20, x10]
	fmla	v18.2d, v17.2d, v3.2d
	str	q18, [x19, x10]
	add	x10, x10, 16
.L81:
	ldr	q19, [x21, x10]
	ldr	q20, [x20, x10]
	fmla	v20.2d, v19.2d, v3.2d
	str	q20, [x19, x10]
	add	x10, x10, 16
.L80:
	ldr	q21, [x21, x10]
	ldr	q22, [x20, x10]
	fmla	v22.2d, v21.2d, v3.2d
	str	q22, [x19, x10]
	add	x10, x10, 16
	cmp	x24, x10
	beq	.L103
    mov x1, #111
    .byte 213,3,32,31
.L18:
	add	x0, x10, 16
	ldr	q23, [x21, x10]
	ldr	q24, [x20, x10]
	add	x7, x10, 32
	ldr	q25, [x21, x0]
	ldr	q26, [x20, x0]
	add	x6, x10, 48
	add	x5, x10, 64
	ldr	q27, [x21, x7]
	ldr	q28, [x20, x7]
	add	x4, x10, 80
	add	x11, x10, 96
	ldr	q29, [x21, x6]
	ldr	q30, [x20, x6]
	add	x2, x10, 112
	fmla	v24.2d, v23.2d, v3.2d
	ldr	q31, [x21, x5]
	ldr	q4, [x20, x5]
	fmla	v26.2d, v25.2d, v3.2d
	ldr	q5, [x21, x4]
	ldr	q2, [x20, x4]
	fmla	v28.2d, v27.2d, v3.2d
	ldr	q6, [x21, x11]
	ldr	q1, [x20, x11]
	fmla	v30.2d, v29.2d, v3.2d
	ldr	q7, [x21, x2]
	ldr	q0, [x20, x2]
	fmla	v4.2d, v31.2d, v3.2d
	fmla	v2.2d, v5.2d, v3.2d
	fmla	v1.2d, v6.2d, v3.2d
	str	q24, [x19, x10]
	add	x10, x10, 128
	fmla	v0.2d, v7.2d, v3.2d
	str	q26, [x19, x0]
	str	q28, [x19, x7]
	str	q30, [x19, x6]
	str	q4, [x19, x5]
	str	q2, [x19, x4]
	str	q1, [x19, x11]
	str	q0, [x19, x2]
	cmp	x24, x10
	bne	.L18
    mov x1, #222
    .byte 213,3,32,31
.L103:
	mov	x17, x25
	cmp	x23, x25
	beq	.L20
.L17:
	lsl	x8, x17, 3
	ldr	d10, [x21, x8]
	ldr	d16, [x20, x8]
	fmadd	d17, d8, d10, d16
	str	d17, [x19, x8]
.L20:
	add	w22, w22, 1
	cmp	w22, w26
	bne	.L15
	add	x1, sp, 152
	add	x0, sp, 144
	str	q3, [sp, 112]
	lsl	w26, w22, 1
	bl	timing
	ldp	d18, d19, [sp, 136]
	ldr	q3, [sp, 112]
	fsub	d10, d19, d18
	fcmpe	d10, d9
	bmi	.L10
	mov	x1, 1024
	add	x0, sp, 160
	asr	w25, w26, 1
	bl	gethostname
	mov	x24, 4562146422526312448
	adrp	x12, .LC0
	add	x0, sp, 160
	add	x1, x12, :lo12:.LC0
	bl	strcmp
	scvtf	d20, w25
	scvtf	d9, x23
	mov	x9, 4629700416936869888
	mov	x13, 70368744177664
	fmov	d21, x9
	movk	x13, 0x408f, lsl 48
	fmov	d22, 8.0e+0
	sxtw	x15, w25
	fmov	d23, x13
	mul	x18, x15, x23
	adrp	x14, .LC6
	adrp	x16, .LC7
	ldr	d8, [x14, #:lo12:.LC6]
	ldr	d24, [x16, #:lo12:.LC7]
	cmp	w0, 0
	adrp	x17, .LC8
	ldr	d25, [x17, #:lo12:.LC8]
	fmov	d26, 1.25e-1
	fmov	d27, x24
	adrp	x3, .LC2
	fmov	d1, d10
	add	x0, x3, :lo12:.LC2
	mov	w1, w25
	mov	x2, x23
	scvtf	d31, x18
	fmul	d29, d9, d20
	fmul	d30, d20, d21
	fmul	d28, d9, d22
	fcsel	d4, d8, d24, eq
	fmul	d16, d10, d4
	fdiv	d7, d29, d10
	fmul	d6, d30, d9
	fmul	d2, d28, d20
	fmul	d5, d31, d26
	fdiv	d0, d28, d23
	fdiv	d18, d6, d10
	fmul	d17, d2, d25
	fdiv	d3, d16, d5
	fdiv	d2, d17, d10
	fdiv	d19, d7, d23
	fmul	d10, d18, d27
	fmul	d4, d10, d27
	fdiv	d5, d19, d23
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	mov	x0, x21
	ldp	x29, x30, [sp]
	ldp	x21, x22, [sp, 32]
	ldp	x25, x26, [sp, 64]
	ldp	d8, d9, [sp, 80]
	ldr	d10, [sp, 96]
	add	sp, sp, 1184
	.cfi_remember_state
	.cfi_restore 74
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	free
	.p2align 3
.L106:
	.cfi_restore_state
	mov	x0, x19
	str	q3, [sp, 112]
	bl	dummy
	ldr	q3, [sp, 112]
	b	.L12
	.p2align 3
.L24:
	mov	x17, 0
	b	.L17
.L105:
	mov	x0, 8
	str	x2, [x20]
	str	x10, [x21]
	b	.L79
	.cfi_endproc
.LFE25:
	.size	triad, .-triad
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
	adrp	x2, .LC13
	adrp	x0, .LC12
	stp	x29, x30, [sp]
	.cfi_offset 29, -1088
	.cfi_offset 30, -1080
	mov	x29, sp
	mov	x1, 1024
	stp	d8, d9, [sp, 32]
	.cfi_offset 72, -1056
	.cfi_offset 73, -1048
	ldr	d9, [x0, #:lo12:.LC12]
	add	x0, sp, 64
	ldr	d8, [x2, #:lo12:.LC13]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1072
	.cfi_offset 20, -1064
	mov	w19, 21
	bl	gethostname
	add	x1, sp, 56
	add	x0, sp, 64
	bl	getFreq
	adrp	x1, .LC9
	add	x0, x1, :lo12:.LC9
	bl	puts
	mov	x3, 225833675390976
	ldr	d0, [sp, 56]
	adrp	x4, .LC10
	movk	x3, 0x41cd, lsl 48
	add	x1, sp, 64
	add	x0, x4, :lo12:.LC10
	fmov	d1, x3
	scvtf	d2, d0
	fdiv	d0, d2, d1
	bl	printf
	adrp	x5, .LC11
	add	x0, x5, :lo12:.LC11
	bl	puts
	fmov	d0, d9
	fmov	d1, 2.0e+1
	bl	pow
	fcvtzs	w6, d0
	fmov	d0, d8
	and	w7, w6, -64
	sxtw	x0, w7
	bl	triad
.L108:
	scvtf	d1, w19
	fmov	d0, d9
	add	w20, w19, 1
	bl	pow
	fcvtzs	w8, d0
	fmov	d0, d8
	and	w9, w8, -64
	sxtw	x0, w9
	bl	triad
	scvtf	d1, w20
	fmov	d0, d9
	bl	pow
	fcvtzs	w10, d0
	fmov	d0, d8
	and	w11, w10, -64
	sxtw	x0, w11
	bl	triad
	add	w12, w20, 1
	fmov	d0, d9
	scvtf	d1, w12
	bl	pow
	fcvtzs	w13, d0
	fmov	d0, d8
	and	w14, w13, -64
	sxtw	x0, w14
	bl	triad
	add	w15, w19, 3
	fmov	d0, d9
	scvtf	d1, w15
	bl	pow
	fcvtzs	w16, d0
	fmov	d0, d8
	and	w17, w16, -64
	sxtw	x0, w17
	bl	triad
	add	w18, w19, 4
	fmov	d0, d9
	add	w19, w19, 5
	scvtf	d1, w18
	bl	pow
	fcvtzs	w0, d0
	fmov	d0, d8
	and	w2, w0, -64
	sxtw	x0, w2
	bl	triad
	cmp	w19, 36
	bne	.L108
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
	.word	1524087310
	.word	1055485069
.LC5:
	.word	2576980378
	.word	1070176665
.LC6:
	.word	536870912
	.word	1105371231
.LC7:
	.word	3221225472
	.word	1105224746
.LC8:
	.word	2696277389
	.word	1051772663
.LC12:
	.word	3435973837
	.word	1073007820
.LC13:
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
.LC9:
	.string	"TRIAD a[i] = b[i] + s * c[i], 24 byte/it, 2 Flop/it"
	.zero	4
.LC10:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
.LC11:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size"
	.ident	"GCC: (ARM-build-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
