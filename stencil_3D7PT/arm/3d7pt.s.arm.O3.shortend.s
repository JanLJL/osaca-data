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
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -1248
	.cfi_offset 22, -1240
	mov	w22, w1
	mul	w1, w0, w1
	mov	w21, w0
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -1184
	.cfi_offset 73, -1176
	fmov	d9, d0
	stp	d10, d11, [sp, 112]
	.cfi_offset 74, -1168
	.cfi_offset 75, -1160
	fmov	d10, d1
	mul	w1, w1, w2
	stp	x19, x20, [sp, 16]
	str	w0, [sp, 152]
	mov	x0, 64
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -1264
	.cfi_offset 20, -1256
	.cfi_offset 23, -1232
	.cfi_offset 24, -1224
	sbfiz	x20, x1, 3, 32
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -1216
	.cfi_offset 26, -1208
	mov	w25, w2
	mov	x1, x20
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -1200
	.cfi_offset 28, -1192
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x20
	bl	aligned_alloc
	mov	x23, x0
	cmp	w21, 0
	ble	.L50
	cmp	w22, 0
	ble	.L50
	cmp	w25, 0
	ble	.L50
	adrp	x1, .LC3
	mul	w2, w25, w22
	sub	w8, w25, #1
	ldr	x3, [x1, #:lo12:.LC3]
	mvn	x4, x8
	mov	w6, 0
	str	w8, [sp, 132]
	mov	w5, 0
	add	x9, x19, 8
	lsl	x4, x4, 3
.L10:
	add	x1, x8, x6, sxtw
	mov	w7, 0
	add	x1, x9, x1, lsl 3
.L13:
	add	x0, x4, x1
	.p2align 4
.L11:
	str	x3, [x0], 8
	cmp	x1, x0
	bne	.L11
	add	w7, w7, 1
	add	x1, x1, x25, sxtw 3
	cmp	w22, w7
	bne	.L13
	ldr	w0, [sp, 152]
	add	w5, w5, 1
	add	w6, w6, w2
	cmp	w0, w5
	bne	.L10
.L9:
	adrp	x0, .LC4
	ldrsw	x28, [sp, 132]
	dup	v16.2d, v9.d[0]
	smull	x14, w22, w25
	ldr	d8, [x0, #:lo12:.LC4]
	ldr	w0, [sp, 152]
	sxtw	x20, w25
	sxtw	x21, w2
	sub	w26, w22, #1
	neg	x11, x21, lsl 3
	neg	x10, x20, lsl 3
	str	w22, [sp, 156]
	lsl	x27, x20, 3
	sub	x28, x28, #1
	sxtw	x26, w26
	mov	x22, x14
	lsr	x24, x28, 1
	and	x9, x28, -2
	sub	w13, w0, #1
	str	x28, [sp, 144]
	mov	w0, 1
	lsl	x24, x24, 4
	add	x12, x9, 1
	mov	x28, x9
	sxtw	x13, w13
	str	w0, [sp, 140]
.L25:
	add	x0, sp, 232
	add	x1, sp, 248
	str	wzr, [sp, 136]
	str	q16, [sp, 160]
	stp	x13, x12, [sp, 176]
	stp	x11, x10, [sp, 192]
	str	w2, [sp, 208]
	bl	timing
	ldp	x13, x12, [sp, 176]
	ldp	x11, x10, [sp, 192]
	ldr	w2, [sp, 208]
	ldr	q16, [sp, 160]
	mov	x0, x21
	mov	x21, x22
	mov	x22, x0
.L24:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	ble	.L14
	mov	x0, x19
	str	q16, [sp, 160]
	stp	x13, x12, [sp, 176]
	stp	x11, x10, [sp, 192]
	str	w2, [sp, 208]
	bl	dummy
	ldp	x13, x12, [sp, 176]
	ldp	x11, x10, [sp, 192]
	ldr	w2, [sp, 208]
	ldr	q16, [sp, 160]
.L14:
	cmp	x13, 1
	ble	.L16
	cmp	x26, 1
	ble	.L16
	ldr	w0, [sp, 132]
	mov	x14, x21
	mov	x8, 1
	dup	v0.2d, v10.d[0]
	add	x7, x23, 8
	cmp	w0, 1
	ble	.L16
	ldr	x9, [sp, 144]
	.p2align 4
.L17:
	add	x5, x14, x20
	mov	x6, 1
	add	x1, x5, x6
	add	x1, x19, x1, lsl 3
	.p2align 4
.L20:
	cmp	w25, 3
	beq	.L51
	ldr	q5, [x1, -8]
	add	x18, x1, x2, sxtw 3
	add	x17, x7, x5, lsl 3
	add	x16, x1, 8
	add	x4, x1, x11
	add	x3, x1, x10
	add	x15, x1, x27
	mov	x0, 0
    // initialize all registers with first value
    // and keep only critical path in loop
	ldr	q2, [x18, x0]
	ldr	q1, [x4, x0]
	ldr	q3, [x15, x0]
	ldr	q17, [x3, x0]
	ldr	q6, [x1, x0]
	.p2align 4
.L22:
	ldr	q4, [x16, x0]
	// ldr	q2, [x18, x0]
	// ldr	q1, [x4, x0]
	// ldr	q3, [x15, x0]
	// ldr	q17, [x3, x0]
	// ldr	q6, [x1, x0]
	// fadd	v7.2d, v5.2d, v4.2d
	// mov	v5.16b, v4.16b
	// fadd	v2.2d, v2.2d, v1.2d
	fadd	v4.2d, v4.2d, v4.2d
	fadd	v4.2d, v4.2d, v4.2d
	fadd	v4.2d, v4.2d, v4.2d
	fmul	v4.2d, v4.2d, v4.2d
	fmla	v4.2d, v4.2d, v4.2d
	// str	q2, [x17, x0]
	add	x0, x0, 16
	cmp	x24, x0
	bne	.L22
	mov	x0, x12
	cmp	x28, x9
	beq	.L23
.L18:
	add	x0, x5, x0
	lsl	x1, x0, 3
	sub	x4, x0, x22
	add	x16, x22, x0
	add	x3, x19, x1
	ldr	d17, [x19, x4, lsl 3]
	ldr	d3, [x19, x16, lsl 3]
	add	x4, x20, x0
	ldr	d7, [x3, -8]
	ldr	d2, [x3, 8]
	sub	x0, x0, x20
	ldr	d5, [x19, x4, lsl 3]
	ldr	d6, [x19, x0, lsl 3]
	ldr	d4, [x19, x1]
	fadd	d3, d3, d17
	fadd	d2, d2, d7
	fadd	d5, d5, d6
	fadd	d2, d3, d2
	fadd	d2, d2, d5
	fmul	d2, d2, d10
	fmadd	d2, d9, d4, d2
	str	d2, [x23, x1]
.L23:
	add	x6, x6, 1
	add	x5, x5, x20
	mov	x1, x15
	cmp	x6, x26
	bne	.L20
	add	x8, x8, 1
	add	x14, x14, x21
	cmp	x13, x8
	bne	.L17
.L16:
	ldp	w0, w1, [sp, 136]
	add	w0, w0, 1
	str	w0, [sp, 136]
	cmp	w0, w1
	bne	.L24
	mov	x0, x22
	add	x1, sp, 248
	mov	x22, x21
	mov	x21, x0
	add	x0, sp, 240
	str	w2, [sp, 160]
	str	q16, [sp, 208]
	stp	x10, x11, [sp, 176]
	stp	x12, x13, [sp, 192]
	bl	timing
	ldp	d2, d11, [sp, 232]
	ldr	w0, [sp, 136]
	ldp	x10, x11, [sp, 176]
	ldp	x12, x13, [sp, 192]
	ldr	w2, [sp, 160]
	ldr	q16, [sp, 208]
	fsub	d11, d11, d2
	lsl	w0, w0, 1
	str	w0, [sp, 140]
	fcmpe	d11, d8
	bmi	.L25
	asr	w20, w0, 1
	mov	x1, 1024
	add	x0, sp, 256
	ldr	w22, [sp, 156]
	bl	gethostname
	adrp	x1, .LC0
	add	x0, sp, 256
	add	x1, x1, :lo12:.LC0
	bl	strcmp
	ldr	w1, [sp, 152]
	sub	w2, w25, #2
	scvtf	d9, w20
	cmp	w0, 0
	fmov	d7, 1.25e-1
	mov	x4, 70368744177664
	add	w25, w25, w25, lsl 1
	fmov	d2, 8.0e+0
	movk	x4, 0x408f, lsl 48
	adrp	x0, .LC7
	fmov	d1, d11
	fmov	d5, x4
	lsl	w25, w25, 1
	ldr	d16, [x0, #:lo12:.LC7]
	mov	x4, 4562146422526312448
	sub	w3, w1, #2
	sub	w1, w22, #2
	scvtf	d0, w25
	fmov	d4, x4
	mul	w3, w2, w3
	mov	x2, 4629700416936869888
	adrp	x0, .LC2
	fmov	d6, x2
	adrp	x2, .LC5
	add	x0, x0, :lo12:.LC2
	ldr	d8, [x2, #:lo12:.LC5]
	adrp	x2, .LC6
	ldr	d3, [x2, #:lo12:.LC6]
	mul	w2, w3, w1
	mov	w1, w20
	fmul	d6, d9, d6
	fmul	d0, d0, d2
	fcsel	d8, d8, d3, eq
	smull	x20, w20, w2
	scvtf	d10, w2
	sxtw	x2, w2
	fmul	d8, d11, d8
	scvtf	d3, x20
	fdiv	d0, d0, d5
	fmul	d2, d10, d2
	fmul	d6, d6, d10
	fmul	d3, d3, d7
	fmul	d7, d10, d9
	fmul	d2, d2, d9
	fdiv	d6, d6, d11
	fdiv	d7, d7, d11
	fmul	d2, d2, d16
	fdiv	d3, d8, d3
	fdiv	d2, d2, d11
	fmul	d6, d6, d4
	fdiv	d7, d7, d5
	fmul	d4, d6, d4
	fdiv	d5, d7, d5
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
.L51:
	.cfi_restore_state
	add	x15, x1, x27
	mov	x0, 1
	b	.L18
.L50:
	sub	w0, w25, #1
	mul	w2, w25, w22
	str	w0, [sp, 132]
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
	adrp	x0, .LC3
	mov	x1, 1024
	stp	x29, x30, [sp]
	.cfi_offset 29, -2336
	.cfi_offset 30, -2328
	mov	x29, sp
	stp	d10, d11, [sp, 112]
	.cfi_offset 74, -2224
	.cfi_offset 75, -2216
	ldr	d11, [x0, #:lo12:.LC3]
	adrp	x0, .LC11
	ldr	d10, [x0, #:lo12:.LC11]
	add	x0, sp, 288
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -2320
	.cfi_offset 20, -2312
	.cfi_offset 21, -2304
	.cfi_offset 22, -2296
	mov	x22, 4880
	mov	x21, 1830
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -2288
	.cfi_offset 24, -2280
	mov	x23, 19528
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 25, -2272
	.cfi_offset 26, -2264
	.cfi_offset 27, -2256
	.cfi_offset 28, -2248
	mov	x27, 610
	stp	d8, d9, [sp, 96]
	stp	d12, d13, [sp, 128]
	str	d14, [sp, 144]
	.cfi_offset 72, -2240
	.cfi_offset 73, -2232
	.cfi_offset 76, -2208
	.cfi_offset 77, -2200
	.cfi_offset 78, -2192
	bl	gethostname
	adrp	x0, .LC4
	adrp	x2, .LC6
	add	x1, sp, 256
	ldr	d9, [x0, #:lo12:.LC4]
	adrp	x0, .LC5
	ldr	d12, [x2, #:lo12:.LC6]
	ldr	d13, [x0, #:lo12:.LC5]
	add	x0, sp, 288
	bl	getFreq
	mov	x1, 24408
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	str	x1, [sp, 168]
	mov	x1, 34168
	str	x1, [sp, 160]
	bl	puts
	mov	x0, 225833675390976
	ldr	d0, [sp, 256]
	add	x1, sp, 288
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
	adrp	x1, .LC0
	adrp	x0, .LC2
	add	x1, x1, :lo12:.LC0
	add	x0, x0, :lo12:.LC2
	stp	x1, x0, [sp, 240]
	.p2align 4
.L67:
	scvtf	d1, w27
	mov	x0, 211106232532992
	str	w27, [sp, 236]
	mov	w19, w27
	movk	x0, 0x405f, lsl 48
	fmov	d0, x0
	fcmp	d1, d0
	bge	.L77
.L53:
	add	x20, x22, x22, lsl 3
	mov	x0, 64
	mov	x1, x20
	bl	aligned_alloc
	mov	x28, x0
	mov	x0, 64
	mov	x1, x20
	lsl	x20, x21, 3
	bl	aligned_alloc
	mov	w2, 3
	mov	x24, x0
	mov	x5, x28
	.p2align 4
.L54:
	mov	w1, 3
	mov	x0, x5
	.p2align 4
.L58:
	add	x6, x22, x0
.L55:
	str	d11, [x0], 8
	cmp	x0, x6
	bne	.L55
	subs	w1, w1, #1
	bne	.L58
	add	x5, x5, x20
	subs	w2, w2, #1
	bne	.L54
	mov	x0, 3689348814741910323
	cmp	w19, 2
	sub	x26, x27, #2
	movk	x0, 0x3fe3, lsl 48
	mov	x19, 1
	add	x20, x20, 8
	fmov	d8, x0
	add	x0, x28, x27, lsl 5
	lsl	x2, x27, 2
	csel	x25, x26, x19, gt
	and	x1, x25, -2
	stp	x2, x0, [sp, 200]
	add	x0, x28, x20
	str	x0, [sp, 192]
	lsr	x0, x25, 1
	lsl	x0, x0, 4
	str	x1, [sp, 224]
	str	x0, [sp, 184]
	add	x0, x1, 1
	str	x0, [sp, 216]
	.p2align 4
.L65:
	add	x1, sp, 280
	add	x0, sp, 264
	mov	w20, 0
	bl	timing
	add	x5, x23, 8
	add	x5, x28, x5
	.p2align 4
.L64:
	ldr	d0, [x28]
	fcmpe	d0, #0.0
	ble	.L59
	mov	x0, x28
	str	x5, [sp, 176]
	bl	dummy
	ldr	x5, [sp, 176]
.L59:
	cmp	x27, 2
	bls	.L68
	adrp	x0, .LC13
	add	x1, x22, 8
	add	x9, x28, x23
	ldr	q5, [x0, #:lo12:.LC13]
	adrp	x0, .LC14
	add	x1, x28, x1
	add	x6, x24, x23
	ldr	q4, [x0, #:lo12:.LC14]
	ldr	x0, [sp, 208]
	ldr	q2, [x0]
	ldr	x0, [sp, 160]
	add	x8, x28, x0
	ldr	x0, [sp, 168]
	add	x7, x28, x0
	mov	x0, 0
.L62:
	ldr	q3, [x5, x0]
	ldr	q0, [x8, x0]
	ldr	x2, [sp, 192]
	ldr	q16, [x1, x0]
	ldr	q1, [x7, x0]
	ldr	q6, [x9, x0]
	fadd	v7.2d, v3.2d, v2.2d
	mov	v2.16b, v3.16b
	fadd	v0.2d, v0.2d, v16.2d
	ldr	q14, [x2, x0]
	ldr	x2, [sp, 184]
	fadd	v1.2d, v1.2d, v14.2d
	fadd	v0.2d, v0.2d, v7.2d
	fadd	v0.2d, v0.2d, v1.2d
	fmul	v0.2d, v0.2d, v5.2d
	fmla	v0.2d, v6.2d, v4.2d
	str	q0, [x6, x0]
	add	x0, x0, 16
	cmp	x2, x0
	bne	.L62
	ldr	x0, [sp, 224]
	cmp	x0, x25
	beq	.L63
	ldr	x0, [sp, 216]
.L61:
	ldr	x1, [sp, 200]
	add	x0, x1, x0
	lsl	x1, x0, 3
	sub	x7, x0, x21
	add	x8, x21, x0
	add	x6, x28, x1
	ldr	d6, [x28, x7, lsl 3]
	ldr	d1, [x28, x8, lsl 3]
	add	x7, x27, x0
	ldr	d5, [x6, -8]
	ldr	d0, [x6, 8]
	sub	x0, x0, x27
	ldr	d3, [x28, x7, lsl 3]
	ldr	d4, [x28, x0, lsl 3]
	ldr	d2, [x28, x1]
	fadd	d1, d1, d6
	fadd	d0, d0, d5
	fadd	d3, d3, d4
	fadd	d0, d1, d0
	fadd	d0, d0, d3
	fmul	d0, d0, d10
	fmadd	d0, d2, d8, d0
	str	d0, [x24, x1]
.L63:
	add	w20, w20, 1
	cmp	w20, w19
	bne	.L64
	add	x1, sp, 280
	add	x0, sp, 272
	lsl	w19, w20, 1
	bl	timing
	ldp	d2, d14, [sp, 264]
	fsub	d14, d14, d2
	fcmpe	d14, d9
	bmi	.L65
	mov	x1, 1024
	add	x0, sp, 1312
	asr	w19, w19, 1
	bl	gethostname
	sub	x27, x27, #32
	sub	x23, x23, #1024
	ldr	x1, [sp, 240]
	add	x0, sp, 1312
	sub	x22, x22, #256
	bl	strcmp
	ldr	w1, [sp, 236]
	scvtf	d18, w19
	fmov	d19, 8.0e+0
	sxtw	x5, w19
	mul	x5, x5, x26
	cmp	w0, 0
	adrp	x0, .LC7
	fmov	d3, 1.25e-1
	ldr	d20, [x0, #:lo12:.LC7]
	fcsel	d17, d13, d12, eq
	mov	x0, 4562146422526312448
	ldr	x3, [sp, 160]
	fmov	d4, x0
	ldr	x0, [sp, 248]
	fmov	d1, d14
	sub	w2, w1, #2
	mov	x1, 4629700416936869888
	scvtf	d8, w2
	mov	x2, 70368744177664
	fmov	d6, x1
	lsl	w1, w21, 1
	movk	x2, 0x408f, lsl 48
	scvtf	d7, x5
	scvtf	d0, w1
	mov	w1, w19
	fmov	d16, x2
	fmul	d17, d14, d17
	sub	x3, x3, #1792
	mov	x2, x26
	str	x3, [sp, 160]
	ldr	x3, [sp, 168]
	sub	x21, x21, #96
	fmul	d6, d18, d6
	fmul	d5, d8, d18
	fmul	d2, d8, d19
	fmul	d3, d7, d3
	fmul	d0, d0, d19
	sub	x3, x3, #1280
	str	x3, [sp, 168]
	fmul	d6, d6, d8
	fdiv	d5, d5, d14
	fmul	d2, d2, d18
	fdiv	d3, d17, d3
	fdiv	d6, d6, d14
	fmul	d2, d2, d20
	fdiv	d0, d0, d16
	fdiv	d2, d2, d14
	fdiv	d5, d5, d16
	fmul	d6, d6, d4
	fmul	d4, d6, d4
	fdiv	d5, d5, d16
	bl	printf
	mov	x0, x28
	bl	free
	mov	x0, x24
	bl	free
	cmp	x27, 290
	bne	.L67
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
.L68:
	.cfi_restore_state
	mov	x0, 1
	b	.L61
.L77:
	adrp	x0, .LC12
	ldr	d0, [x0, #:lo12:.LC12]
	bl	pow
	b	.L53
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
