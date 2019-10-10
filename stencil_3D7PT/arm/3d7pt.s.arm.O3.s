	.arch armv8.1-a+crypto+crc
	.file	"3d7pt.c"
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
	.global	stencil
	.type	stencil, %function
stencil:
.LFB25:
	.cfi_startproc
	sub	sp, sp, #1280
	.cfi_def_cfa_offset 1280
	stp	x29, x30, [sp]
	.cfi_offset 29, -1280
	.cfi_offset 30, -1272
	mov	x29, sp
	str	w1, [sp, 148]
	mul	w1, w0, w1
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -1216
	.cfi_offset 26, -1208
	mov	w25, w2
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -1184
	.cfi_offset 73, -1176
	fmov	d9, d0
	mul	w2, w1, w2
	stp	d10, d11, [sp, 112]
	.cfi_offset 74, -1168
	.cfi_offset 75, -1160
	fmov	d10, d1
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -1264
	.cfi_offset 20, -1256
	.cfi_offset 21, -1248
	.cfi_offset 22, -1240
	mov	w21, w0
	sbfiz	x20, x2, 3, 32
	str	w0, [sp, 164]
	mov	x0, 64
	mov	x1, x20
	stp	x23, x24, [sp, 48]
	stp	x27, x28, [sp, 80]
	.cfi_offset 23, -1232
	.cfi_offset 24, -1224
	.cfi_offset 27, -1200
	.cfi_offset 28, -1192
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x20
	bl	aligned_alloc
	mov	x23, x0
	ldr	w0, [sp, 148]
	cmp	w21, 0
	ble	.L104
	cmp	w0, 0
	ble	.L104
	cmp	w25, 0
	ble	.L105
	ldr	w8, [sp, 148]
	adrp	x11, .LC3
	sub	w9, w25, #1
	mov	w7, 0
	ldr	x26, [x11, #:lo12:.LC3]
	mvn	x5, x9
	mov	w6, 0
	str	w9, [sp, 152]
	add	x10, x19, 8
	lsl	x27, x5, 3
	mul	w2, w25, w8
.L10:
	add	x12, x9, x7, sxtw
	mov	w13, 0
	add	x14, x10, x12, lsl 3
.L13:
	add	x15, x27, x14
	sub	x16, x14, x15
	sub	x17, x16, #8
	lsr	x18, x17, 3
	add	x22, x18, 1
	ands	x24, x22, 7
	beq	.L11
	cmp	x24, 1
	beq	.L70
	cmp	x24, 2
	beq	.L71
	cmp	x24, 3
	beq	.L72
	cmp	x24, 4
	beq	.L73
	cmp	x24, 5
	beq	.L74
	cmp	x24, 6
	beq	.L75
	str	x26, [x15], 8
.L75:
	str	x26, [x15], 8
.L74:
	str	x26, [x15], 8
.L73:
	str	x26, [x15], 8
.L72:
	str	x26, [x15], 8
.L71:
	str	x26, [x15], 8
.L70:
	str	x26, [x15], 8
	cmp	x14, x15
	beq	.L96
.L11:
	mov	x28, x15
	str	x26, [x28], 8
	str	x26, [x15, 8]
	str	x26, [x28, 8]
	stp	x26, x26, [x15, 24]
	stp	x26, x26, [x15, 40]
	add	x15, x15, 64
	str	x26, [x15, -8]
	cmp	x14, x15
	bne	.L11
.L96:
	ldr	w30, [sp, 148]
	add	w13, w13, 1
	add	x14, x14, x25, sxtw 3
	cmp	w30, w13
	bne	.L13
	ldr	w21, [sp, 164]
	add	w6, w6, 1
	add	w7, w7, w2
	cmp	w21, w6
	bne	.L10
.L9:
	ldr	w8, [sp, 148]
	ldrsw	x0, [sp, 152]
	adrp	x1, .LC4
	dup	v7.2d, v9.d[0]
	ldr	w15, [sp, 164]
	ldr	d8, [x1, #:lo12:.LC4]
	sxtw	x20, w25
	sxtw	x21, w2
	mov	w18, 1
	neg	x10, x21, lsl 3
	neg	x9, x20, lsl 3
	lsl	x27, x20, 3
	str	w18, [sp, 160]
	smull	x11, w8, w25
	sub	x28, x0, #1
	sub	w12, w8, #1
	and	x4, x28, -2
	sub	w16, w15, #1
	lsr	x3, x28, 1
	add	x5, x4, 1
	sxtw	x17, w16
	lsl	x24, x3, 4
	mov	x22, x4
	sxtw	x26, w12
	str	x17, [sp, 136]
	str	x11, [sp, 128]
	str	x5, [sp, 168]
.L25:
	add	x1, sp, 248
	add	x0, sp, 232
	str	wzr, [sp, 156]
	str	q7, [sp, 176]
	stp	x10, x9, [sp, 192]
	str	w2, [sp, 208]
	bl	timing
	ldp	x14, x13, [sp, 192]
	ldr	w2, [sp, 208]
	ldr	q6, [sp, 176]
.L24:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	ble	.L14
	mov	x0, x19
	str	q6, [sp, 176]
	stp	x14, x13, [sp, 192]
	str	w2, [sp, 208]
	bl	dummy
	ldp	x14, x13, [sp, 192]
	ldr	w2, [sp, 208]
	ldr	q6, [sp, 176]
.L14:
	ldr	x9, [sp, 136]
	cmp	x9, 1
	ble	.L16
	cmp	x26, 1
	ble	.L16
	ldr	w10, [sp, 152]
	mov	x18, 1
	dup	v7.2d, v10.d[0]
	add	x17, x23, 8
	ldr	x30, [sp, 128]
	cmp	w10, 1
	ble	.L16
	ldr	x12, [sp, 168]
	.p2align 4
.L17:
	add	x6, x30, x20
	mov	x16, 1
	add	x7, x6, x16
	add	x1, x19, x7, lsl 3
	.p2align 4
.L20:
	cmp	w25, 3
	beq	.L106
	sub	x3, x24, #16
	add	x5, x1, 8
	add	x4, x1, x14
	ldr	q1, [x1, -8]
	lsr	x11, x3, 4
	add	x9, x1, x2, sxtw 3
	add	x8, x1, x13
	add	x15, x11, 1
	add	x7, x1, x27
	add	x10, x17, x6, lsl 3
	mov	x0, 0
	ands	x3, x15, 3
	beq	.L22
	cmp	x3, 1
	beq	.L76
	cmp	x3, 2
	beq	.L77
	ldr	q3, [x5]
	ldr	q11, [x9]
	mov	x0, 16
	ldr	q17, [x4]
	ldr	q2, [x7]
	ldr	q16, [x8]
	ldr	q4, [x1]
	fadd	v5.2d, v1.2d, v3.2d
	mov	v1.16b, v3.16b
	fadd	v18.2d, v11.2d, v17.2d
	fadd	v19.2d, v2.2d, v16.2d
	fadd	v20.2d, v18.2d, v5.2d
	fadd	v21.2d, v20.2d, v19.2d
	fmul	v22.2d, v21.2d, v7.2d
	fmla	v22.2d, v6.2d, v4.2d
	str	q22, [x10]
.L77:
	ldr	q23, [x5, x0]
	ldr	q24, [x9, x0]
	ldr	q25, [x4, x0]
	ldr	q26, [x7, x0]
	ldr	q27, [x8, x0]
	ldr	q28, [x1, x0]
	fadd	v29.2d, v1.2d, v23.2d
	mov	v1.16b, v23.16b
	fadd	v30.2d, v24.2d, v25.2d
	fadd	v31.2d, v26.2d, v27.2d
	fadd	v0.2d, v30.2d, v29.2d
	fadd	v3.2d, v0.2d, v31.2d
	fmul	v11.2d, v3.2d, v7.2d
	fmla	v11.2d, v6.2d, v28.2d
	str	q11, [x10, x0]
	add	x0, x0, 16
.L76:
	ldr	q18, [x5, x0]
	ldr	q19, [x9, x0]
	ldr	q17, [x4, x0]
	ldr	q2, [x7, x0]
	ldr	q16, [x8, x0]
	ldr	q4, [x1, x0]
	fadd	v5.2d, v1.2d, v18.2d
	mov	v1.16b, v18.16b
	fadd	v20.2d, v19.2d, v17.2d
	fadd	v21.2d, v2.2d, v16.2d
	fadd	v22.2d, v20.2d, v5.2d
	fadd	v23.2d, v22.2d, v21.2d
	fmul	v24.2d, v23.2d, v7.2d
	fmla	v24.2d, v6.2d, v4.2d
	str	q24, [x10, x0]
	add	x0, x0, 16
	cmp	x24, x0
	beq	.L95
.L22:
	ldr	q25, [x5, x0]
	add	x3, x0, 16
	ldr	q26, [x9, x0]
	add	x15, x0, 32
	ldr	q27, [x4, x0]
	ldr	q31, [x5, x3]
	add	x11, x0, 48
	ldr	q29, [x9, x3]
	ldr	q30, [x4, x3]
	ldr	q0, [x5, x15]
	ldr	q11, [x9, x15]
	ldr	q3, [x4, x15]
	fadd	v28.2d, v1.2d, v25.2d
	ldr	q18, [x5, x11]
	ldr	q2, [x9, x11]
	ldr	q1, [x4, x11]
	fadd	v5.2d, v26.2d, v27.2d
	fadd	v25.2d, v25.2d, v31.2d
	fadd	v4.2d, v29.2d, v30.2d
	ldr	q21, [x7, x0]
	ldr	q20, [x8, x0]
	fadd	v24.2d, v31.2d, v0.2d
	ldr	q17, [x7, x3]
	ldr	q19, [x8, x3]
	fadd	v29.2d, v11.2d, v3.2d
	fadd	v23.2d, v0.2d, v18.2d
	ldr	q16, [x7, x15]
	ldr	q27, [x8, x15]
	fadd	v30.2d, v2.2d, v1.2d
	ldr	q31, [x7, x11]
	ldr	q26, [x8, x11]
	mov	v1.16b, v18.16b
	fadd	v22.2d, v21.2d, v20.2d
	ldr	q11, [x1, x0]
	ldr	q21, [x1, x3]
	fadd	v28.2d, v5.2d, v28.2d
	fadd	v20.2d, v17.2d, v19.2d
	ldr	q17, [x1, x15]
	ldr	q18, [x1, x11]
	fadd	v4.2d, v4.2d, v25.2d
	fadd	v25.2d, v16.2d, v27.2d
	fadd	v0.2d, v31.2d, v26.2d
	fadd	v3.2d, v29.2d, v24.2d
	fadd	v2.2d, v30.2d, v23.2d
	fadd	v5.2d, v28.2d, v22.2d
	fadd	v29.2d, v4.2d, v20.2d
	fadd	v19.2d, v3.2d, v25.2d
	fadd	v24.2d, v2.2d, v0.2d
	fmul	v23.2d, v5.2d, v7.2d
	fmul	v16.2d, v29.2d, v7.2d
	fmul	v27.2d, v19.2d, v7.2d
	fmul	v30.2d, v24.2d, v7.2d
	fmla	v23.2d, v6.2d, v11.2d
	fmla	v16.2d, v6.2d, v21.2d
	fmla	v27.2d, v6.2d, v17.2d
	fmla	v30.2d, v6.2d, v18.2d
	str	q23, [x10, x0]
	add	x0, x0, 64
	str	q16, [x10, x3]
	str	q27, [x10, x15]
	str	q30, [x10, x11]
	cmp	x24, x0
	bne	.L22
.L95:
	mov	x0, x12
	cmp	x22, x28
	beq	.L23
.L18:
	add	x9, x6, x0
	lsl	x1, x9, 3
	add	x5, x21, x9
	sub	x4, x9, x21
	add	x8, x19, x1
	ldr	d1, [x19, x5, lsl 3]
	ldr	d31, [x19, x4, lsl 3]
	add	x10, x20, x9
	ldr	d20, [x8, -8]
	ldr	d17, [x8, 8]
	sub	x0, x9, x20
	ldr	d26, [x19, x10, lsl 3]
	ldr	d22, [x19, x0, lsl 3]
	ldr	d11, [x19, x1]
	fadd	d21, d1, d31
	fadd	d18, d17, d20
	fadd	d28, d26, d22
	fadd	d4, d21, d18
	fadd	d25, d4, d28
	fmul	d0, d25, d10
	fmadd	d3, d9, d11, d0
	str	d3, [x23, x1]
.L23:
	add	x16, x16, 1
	add	x6, x6, x20
	mov	x1, x7
	cmp	x16, x26
	bne	.L20
	ldr	x6, [sp, 128]
	ldr	x16, [sp, 136]
	add	x18, x18, 1
	add	x30, x30, x6
	cmp	x16, x18
	bne	.L17
.L16:
	ldp	w18, w17, [sp, 156]
	add	w30, w18, 1
	str	w30, [sp, 156]
	cmp	w30, w17
	bne	.L24
	add	x1, sp, 248
	add	x0, sp, 240
	str	w2, [sp, 176]
	str	q6, [sp, 208]
	stp	x13, x14, [sp, 192]
	bl	timing
	ldp	d2, d5, [sp, 232]
	ldr	w12, [sp, 156]
	ldp	x9, x10, [sp, 192]
	ldr	w2, [sp, 176]
	ldr	q7, [sp, 208]
	fsub	d11, d5, d2
	lsl	w7, w12, 1
	str	w7, [sp, 160]
	fcmpe	d11, d8
	bmi	.L25
	mov	x1, 1024
	add	x0, sp, 256
	asr	w20, w7, 1
	bl	gethostname
	mov	x22, 4629700416936869888
	adrp	x24, .LC5
	adrp	x3, .LC0
	add	x0, sp, 256
	add	x1, x3, :lo12:.LC0
	bl	strcmp
	ldr	w26, [sp, 148]
	ldr	w13, [sp, 164]
	sub	w11, w25, #2
	scvtf	d29, w20
	fmov	d19, 8.0e+0
	fmov	d26, x22
	adrp	x8, .LC7
	add	w1, w25, w25, lsl 1
	adrp	x25, .LC6
	ldr	d23, [x8, #:lo12:.LC7]
	ldr	d22, [x24, #:lo12:.LC5]
	mov	x15, 70368744177664
	cmp	w0, 0
	sub	w27, w26, #2
	ldr	d21, [x25, #:lo12:.LC6]
	movk	x15, 0x408f, lsl 48
	fmov	d1, d11
	sub	w14, w13, #2
	fmov	d24, x15
	lsl	w4, w1, 1
	fmov	d16, 1.25e-1
	mul	w21, w11, w14
	scvtf	d27, w4
	mov	x5, 4562146422526312448
	adrp	x0, .LC2
	fmov	d30, x5
	add	x0, x0, :lo12:.LC2
	mov	w1, w20
	fmul	d28, d29, d26
	fcsel	d20, d22, d21, eq
	mul	w28, w21, w27
	fmul	d17, d11, d20
	fmul	d31, d27, d19
	scvtf	d18, w28
	smull	x6, w20, w28
	sxtw	x2, w28
	scvtf	d4, x6
	fdiv	d0, d31, d24
	fmul	d8, d18, d29
	fmul	d9, d18, d19
	fmul	d6, d28, d18
	fmul	d25, d4, d16
	fdiv	d10, d8, d11
	fmul	d7, d9, d29
	fdiv	d5, d6, d11
	fdiv	d3, d17, d25
	fmul	d2, d7, d23
	fdiv	d2, d2, d11
	fdiv	d11, d10, d24
	fmul	d29, d5, d30
	fmul	d4, d29, d30
	fdiv	d5, d11, d24
	bl	printf
	mov	x0, x19
	bl	free
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	mov	x0, x23
	ldp	x29, x30, [sp]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	add	sp, sp, 1280
	.cfi_remember_state
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
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
	add	x7, x1, x27
	mov	x0, 1
	b	.L18
.L105:
	ldr	w0, [sp, 148]
.L104:
	sub	w3, w25, #1
	mul	w2, w25, w0
	str	w3, [sp, 152]
	b	.L9
	.cfi_endproc
.LFE25:
	.size	stencil, .-stencil
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,15
	.global	main
	.type	main, %function
main:
.LFB26:
	.cfi_startproc
	sub	sp, sp, #2336
	.cfi_def_cfa_offset 2336
	adrp	x2, .LC11
	adrp	x0, .LC3
	stp	x29, x30, [sp]
	.cfi_offset 29, -2336
	.cfi_offset 30, -2328
	mov	x29, sp
	mov	x1, 1024
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -2240
	.cfi_offset 73, -2232
	ldr	d8, [x0, #:lo12:.LC3]
	add	x0, sp, 288
	stp	d10, d11, [sp, 112]
	.cfi_offset 74, -2224
	.cfi_offset 75, -2216
	ldr	d10, [x2, #:lo12:.LC11]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -2320
	.cfi_offset 20, -2312
	.cfi_offset 21, -2304
	.cfi_offset 22, -2296
	.cfi_offset 23, -2288
	.cfi_offset 24, -2280
	mov	x24, 610
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -2272
	.cfi_offset 26, -2264
	mov	x25, 4880
	mov	x26, 1830
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -2256
	.cfi_offset 28, -2248
	mov	x28, 19528
	stp	d12, d13, [sp, 128]
	str	d14, [sp, 144]
	.cfi_offset 76, -2208
	.cfi_offset 77, -2200
	.cfi_offset 78, -2192
	bl	gethostname
	adrp	x3, .LC5
	adrp	x4, .LC6
	adrp	x1, .LC4
	ldr	d9, [x1, #:lo12:.LC4]
	ldr	d12, [x3, #:lo12:.LC5]
	add	x1, sp, 256
	add	x0, sp, 288
	ldr	d11, [x4, #:lo12:.LC6]
	bl	getFreq
	adrp	x5, .LC8
	mov	x6, 24408
	mov	x7, 34168
	add	x0, x5, :lo12:.LC8
	str	x7, [sp, 168]
	str	x6, [sp, 176]
	bl	puts
	mov	x8, 225833675390976
	ldr	d0, [sp, 256]
	adrp	x9, .LC9
	movk	x8, 0x41cd, lsl 48
	add	x1, sp, 288
	add	x0, x9, :lo12:.LC9
	fmov	d1, x8
	scvtf	d2, d0
	fdiv	d0, d2, d1
	bl	printf
	adrp	x10, .LC10
	add	x0, x10, :lo12:.LC10
	bl	puts
	adrp	x11, .LC0
	adrp	x12, .LC2
	add	x13, x11, :lo12:.LC0
	add	x14, x12, :lo12:.LC2
	stp	x13, x14, [sp, 240]
	.p2align 4
.L122:
	scvtf	d1, w24
	mov	x15, 211106232532992
	str	w24, [sp, 228]
	mov	w19, w24
	movk	x15, 0x405f, lsl 48
	fmov	d3, x15
	fcmp	d1, d3
	bge	.L186
.L108:
	add	x20, x25, x25, lsl 3
	mov	x0, 64
	mov	x1, x20
	bl	aligned_alloc
	mov	x27, x0
	mov	x0, 64
	mov	x1, x20
	bl	aligned_alloc
	lsl	x2, x26, 3
	mov	w5, 3
	mov	x21, x0
	mov	x4, x27
	.p2align 4
.L109:
	mov	w18, 3
	mov	x17, x4
	.p2align 4
.L113:
	sub	x22, x25, #8
	add	x23, x25, x17
	lsr	x30, x22, 3
	add	x0, x30, 1
	ands	x1, x0, 7
	beq	.L110
	cmp	x1, 1
	beq	.L161
	cmp	x1, 2
	beq	.L162
	cmp	x1, 3
	beq	.L163
	cmp	x1, 4
	beq	.L164
	cmp	x1, 5
	beq	.L165
	cmp	x1, 6
	beq	.L166
	str	d8, [x17], 8
.L166:
	str	d8, [x17], 8
.L165:
	str	d8, [x17], 8
.L164:
	str	d8, [x17], 8
.L163:
	str	d8, [x17], 8
.L162:
	str	d8, [x17], 8
.L161:
	str	d8, [x17], 8
	cmp	x17, x23
	bne	.L110
.L182:
	subs	w18, w18, #1
	bne	.L113
	add	x4, x4, x2
	subs	w5, w5, #1
	bne	.L109
	mov	x6, 3689348814741910323
	cmp	w19, 2
	sub	x7, x24, #2
	movk	x6, 0x3fe3, lsl 48
	mov	x19, 1
	add	x9, x27, x24, lsl 5
	str	x7, [sp, 232]
	fmov	d13, x6
	csel	x10, x7, x19, gt
	add	x8, x2, 8
	and	x13, x10, -2
	lsr	x11, x10, 1
	lsl	x12, x24, 2
	str	x9, [sp, 192]
	add	x14, x13, 1
	add	x23, x27, x8
	lsl	x20, x11, 4
	str	x12, [sp, 184]
	str	x14, [sp, 200]
	str	x13, [sp, 208]
	str	x10, [sp, 216]
	.p2align 4
.L120:
	add	x0, sp, 264
	add	x1, sp, 280
	mov	w22, 0
	bl	timing
	add	x15, x28, 8
	mov	w17, w19
	add	x0, x27, x15
	mov	x19, x0
	.p2align 4
.L119:
	ldr	d4, [x27]
	fcmpe	d4, #0.0
	ble	.L114
	mov	x0, x27
	str	w17, [sp, 224]
	bl	dummy
	ldr	w17, [sp, 224]
.L114:
	cmp	x24, 2
	bls	.L123
	ldr	x6, [sp, 168]
	ldr	x11, [sp, 176]
	sub	x30, x20, #16
	ldr	x13, [sp, 192]
	lsr	x3, x30, 4
	add	x1, x25, 8
	adrp	x2, .LC13
	adrp	x9, .LC14
	add	x8, x3, 1
	add	x4, x27, x28
	ldr	q28, [x2, #:lo12:.LC13]
	add	x5, x27, x1
	add	x10, x21, x28
	ldr	q29, [x9, #:lo12:.LC14]
	mov	x15, 0
	add	x7, x27, x6
	add	x12, x27, x11
	ldr	q1, [x13]
	ands	x14, x8, 3
	beq	.L117
	cmp	x14, 1
	beq	.L167
	cmp	x14, 2
	beq	.L168
	ldr	q5, [x19]
	ldr	q17, [x7]
	mov	x15, 16
	ldr	q16, [x5]
	ldr	q18, [x12]
	ldr	q14, [x23]
	ldr	q6, [x4]
	fadd	v7.2d, v5.2d, v1.2d
	mov	v1.16b, v5.16b
	fadd	v19.2d, v17.2d, v16.2d
	fadd	v20.2d, v18.2d, v14.2d
	fadd	v21.2d, v19.2d, v7.2d
	fadd	v22.2d, v21.2d, v20.2d
	fmul	v23.2d, v22.2d, v28.2d
	fmla	v23.2d, v6.2d, v29.2d
	str	q23, [x10]
.L168:
	ldr	q24, [x19, x15]
	ldr	q25, [x7, x15]
	ldr	q26, [x5, x15]
	ldr	q27, [x12, x15]
	ldr	q30, [x23, x15]
	ldr	q31, [x4, x15]
	fadd	v2.2d, v24.2d, v1.2d
	mov	v1.16b, v24.16b
	fadd	v0.2d, v25.2d, v26.2d
	fadd	v3.2d, v27.2d, v30.2d
	fadd	v4.2d, v0.2d, v2.2d
	fadd	v5.2d, v4.2d, v3.2d
	fmul	v17.2d, v5.2d, v28.2d
	fmla	v17.2d, v31.2d, v29.2d
	str	q17, [x10, x15]
	add	x15, x15, 16
.L167:
	ldr	q18, [x19, x15]
	ldr	q19, [x7, x15]
	ldr	q16, [x5, x15]
	ldr	q20, [x12, x15]
	ldr	q14, [x23, x15]
	ldr	q6, [x4, x15]
	fadd	v7.2d, v18.2d, v1.2d
	mov	v1.16b, v18.16b
	fadd	v21.2d, v19.2d, v16.2d
	fadd	v22.2d, v20.2d, v14.2d
	fadd	v23.2d, v21.2d, v7.2d
	fadd	v24.2d, v23.2d, v22.2d
	fmul	v25.2d, v24.2d, v28.2d
	fmla	v25.2d, v6.2d, v29.2d
	str	q25, [x10, x15]
	add	x15, x15, 16
	cmp	x20, x15
	beq	.L181
    mov x1, #111
    .byte 213,3,32,31
.L117:
	add	x0, x15, 16
	ldr	q26, [x19, x15]
	ldr	q30, [x7, x15]
	add	x18, x15, 32
	ldr	q31, [x5, x15]
	ldr	q14, [x19, x0]
	add	x16, x15, 48
	ldr	q2, [x7, x0]
	ldr	q3, [x5, x0]
	ldr	q19, [x19, x18]
	ldr	q17, [x7, x18]
	ldr	q4, [x5, x18]
	ldr	q16, [x19, x16]
	fadd	v27.2d, v26.2d, v1.2d
	ldr	q7, [x7, x16]
	ldr	q0, [x5, x16]
	fadd	v6.2d, v30.2d, v31.2d
	fadd	v23.2d, v14.2d, v26.2d
	fadd	v5.2d, v2.2d, v3.2d
	ldr	q18, [x23, x15]
	ldr	q24, [x12, x15]
	fadd	v22.2d, v19.2d, v14.2d
	ldr	q31, [x23, x0]
	ldr	q20, [x12, x0]
	fadd	v30.2d, v17.2d, v4.2d
	fadd	v21.2d, v16.2d, v19.2d
	ldr	q2, [x12, x18]
	ldr	q26, [x23, x18]
	fadd	v3.2d, v7.2d, v0.2d
	ldr	q4, [x12, x16]
	ldr	q25, [x23, x16]
	mov	v1.16b, v16.16b
	fadd	v24.2d, v24.2d, v18.2d
	ldr	q19, [x4, x15]
	ldr	q18, [x4, x0]
	fadd	v27.2d, v6.2d, v27.2d
	fadd	v20.2d, v20.2d, v31.2d
	ldr	q17, [x4, x18]
	ldr	q16, [x4, x16]
	fadd	v5.2d, v5.2d, v23.2d
	fadd	v14.2d, v2.2d, v26.2d
	fadd	v7.2d, v4.2d, v25.2d
	fadd	v23.2d, v30.2d, v22.2d
	fadd	v0.2d, v3.2d, v21.2d
	fadd	v6.2d, v27.2d, v24.2d
	fadd	v30.2d, v5.2d, v20.2d
	fadd	v31.2d, v23.2d, v14.2d
	fadd	v22.2d, v0.2d, v7.2d
	fmul	v21.2d, v6.2d, v28.2d
	fmul	v2.2d, v30.2d, v28.2d
	fmul	v26.2d, v31.2d, v28.2d
	fmul	v3.2d, v22.2d, v28.2d
	fmla	v21.2d, v19.2d, v29.2d
	fmla	v2.2d, v18.2d, v29.2d
	fmla	v26.2d, v17.2d, v29.2d
	fmla	v3.2d, v16.2d, v29.2d
	str	q21, [x10, x15]
	add	x15, x15, 64
	str	q2, [x10, x0]
	str	q26, [x10, x18]
	str	q3, [x10, x16]
	cmp	x20, x15
	bne	.L117
    mov x1, #222
    .byte 213,3,32,31
	.p2align 4
.L181:
	ldp	x30, x1, [sp, 208]
	cmp	x30, x1
	beq	.L118
	ldr	x18, [sp, 200]
.L116:
	ldr	x4, [sp, 184]
	add	x8, x4, x18
	lsl	x10, x8, 3
	add	x5, x26, x8
	sub	x3, x8, x26
	add	x2, x27, x10
	ldr	d28, [x27, x5, lsl 3]
	ldr	d29, [x27, x3, lsl 3]
	add	x6, x24, x8
	ldr	d18, [x2, -8]
	ldr	d27, [x2, 8]
	sub	x7, x8, x24
	ldr	d25, [x27, x6, lsl 3]
	ldr	d4, [x27, x7, lsl 3]
	ldr	d24, [x27, x10]
	fadd	d1, d28, d29
	fadd	d20, d27, d18
	fadd	d19, d25, d4
	fadd	d17, d1, d20
	fadd	d16, d17, d19
	fmul	d5, d16, d10
	fmadd	d14, d24, d13, d5
	str	d14, [x21, x10]
.L118:
	add	w22, w22, 1
	cmp	w22, w17
	bne	.L119
	add	x1, sp, 280
	add	x0, sp, 272
	lsl	w19, w22, 1
	bl	timing
	ldp	d7, d23, [sp, 264]
	fsub	d14, d23, d7
	fcmpe	d14, d9
	bmi	.L120
	mov	x1, 1024
	add	x0, sp, 1312
	asr	w23, w19, 1
	bl	gethostname
	mov	x20, 4629700416936869888
	sub	x24, x24, #32
	ldr	x1, [sp, 240]
	add	x0, sp, 1312
	sub	x28, x28, #1024
	sub	x25, x25, #256
	bl	strcmp
	ldr	w13, [sp, 228]
	scvtf	d30, w23
	fmov	d13, x20
	mov	x17, 70368744177664
	movk	x17, 0x408f, lsl 48
	fmov	d22, 8.0e+0
	ldr	x2, [sp, 232]
	sxtw	x9, w23
	fmov	d31, x17
	lsl	w15, w26, 1
	mov	x12, 4562146422526312448
	cmp	w0, 0
	scvtf	d25, w15
	fmov	d3, x12
	adrp	x11, .LC7
	ldr	x16, [sp, 168]
	sub	w14, w13, #2
	fcsel	d0, d12, d11, eq
	ldr	d21, [x11, #:lo12:.LC7]
	fmov	d26, 1.25e-1
	scvtf	d29, w14
	ldr	x8, [sp, 176]
	ldr	x0, [sp, 248]
	fmov	d1, d14
	mul	x18, x9, x2
	mov	w1, w23
	sub	x26, x26, #96
	fmul	d6, d30, d13
	fmul	d28, d14, d0
	sub	x4, x16, #1792
	str	x4, [sp, 168]
	scvtf	d7, x18
	fmul	d24, d25, d22
	sub	x10, x8, #1280
	str	x10, [sp, 176]
	fmul	d4, d29, d30
	fmul	d2, d29, d22
	fmul	d19, d6, d29
	fdiv	d0, d24, d31
	fmul	d23, d7, d26
	fdiv	d18, d4, d14
	fdiv	d20, d19, d14
	fmul	d27, d2, d30
	fmul	d17, d27, d21
	fdiv	d2, d17, d14
	fdiv	d16, d18, d31
	fmul	d5, d20, d3
	fmul	d4, d5, d3
	fdiv	d3, d28, d23
	fdiv	d5, d16, d31
	bl	printf
	mov	x0, x27
	bl	free
	mov	x0, x21
	bl	free
	cmp	x24, 290
	bne	.L122
	mov	w0, 0
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldr	d14, [sp, 144]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	add	sp, sp, 2336
	.cfi_remember_state
	.cfi_restore 78
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 3
.L110:
	.cfi_restore_state
	mov	x3, x17
	str	d8, [x3], 8
	str	d8, [x17, 8]
	str	d8, [x3, 8]
	stp	d8, d8, [x17, 24]
	stp	d8, d8, [x17, 40]
	add	x17, x17, 64
	str	d8, [x17, -8]
	cmp	x17, x23
	beq	.L182
	b	.L110
	.p2align 3
.L123:
	mov	x18, 1
	b	.L116
.L186:
	adrp	x16, .LC12
	ldr	d0, [x16, #:lo12:.LC12]
	bl	pow
	b	.L108
	.cfi_endproc
.LFE26:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align	4
.LC13:
	.word	398572965
	.word	1068847910
	.word	398572965
	.word	1068847910
.LC14:
	.word	858993459
	.word	1071854387
	.word	858993459
	.word	1071854387
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
	.word	398572965
	.word	1068847910
.LC12:
	.word	3435973837
	.word	1073007820
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
	.string	"3D7PT b[k][j][i] = c0 * a[k][j][i] + c1 * (...), 32 byte/it, 8 Flop/it"
	.zero	1
.LC9:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
.LC10:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size"
	.ident	"GCC: (ARM-build-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
