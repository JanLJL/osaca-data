	.arch armv8.1-a+crypto+crc
	.file	"2d5pt.c"
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
	sub	sp, sp, #1216
	.cfi_def_cfa_offset 1216
	stp	x29, x30, [sp]
	.cfi_offset 29, -1216
	.cfi_offset 30, -1208
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -1184
	.cfi_offset 22, -1176
	mov	w21, w0
	str	w0, [sp, 152]
	mul	w0, w0, w1
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -1120
	.cfi_offset 73, -1112
	fmov	d9, d0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1200
	.cfi_offset 20, -1192
	sbfiz	x20, x0, 3, 32
	str	w0, [sp, 156]
	mov	x0, 64
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 23, -1168
	.cfi_offset 24, -1160
	.cfi_offset 25, -1152
	.cfi_offset 26, -1144
	mov	w26, w1
	mov	x1, x20
	stp	x27, x28, [sp, 80]
	str	d10, [sp, 112]
	.cfi_offset 27, -1136
	.cfi_offset 28, -1128
	.cfi_offset 74, -1104
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x20
	bl	aligned_alloc
	mov	x23, x0
	sub	w7, w26, #1
	cmp	w21, 0
	ble	.L9
	cmp	w26, 0
	ble	.L9
	adrp	x2, .LC3
	ubfiz	x3, x7, 3, 32
	sbfiz	x6, x26, 3, 32
	mov	x4, x19
	ldr	x15, [x2, #:lo12:.LC3]
	add	x8, x3, 8
	mov	w5, 0
	add	x17, x8, x19
.L10:
	sub	x9, x17, x4
	mov	x14, x4
	sub	x10, x9, #8
	lsr	x11, x10, 3
	add	x12, x11, 1
	ands	x13, x12, 7
	beq	.L11
	cmp	x13, 1
	beq	.L65
	cmp	x13, 2
	beq	.L66
	cmp	x13, 3
	beq	.L67
	cmp	x13, 4
	beq	.L68
	cmp	x13, 5
	beq	.L69
	cmp	x13, 6
	beq	.L70
	str	x15, [x14], 8
.L70:
	str	x15, [x14], 8
.L69:
	str	x15, [x14], 8
.L68:
	str	x15, [x14], 8
.L67:
	str	x15, [x14], 8
.L66:
	str	x15, [x14], 8
.L65:
	str	x15, [x14], 8
	cmp	x14, x17
	beq	.L90
.L11:
	mov	x16, x14
	str	x15, [x16], 8
	str	x15, [x14, 8]
	str	x15, [x16, 8]
	stp	x15, x15, [x14, 24]
	stp	x15, x15, [x14, 40]
	add	x14, x14, 64
	str	x15, [x14, -8]
	cmp	x14, x17
	bne	.L11
.L90:
	ldr	w18, [sp, 152]
	add	w5, w5, 1
	add	x4, x4, x6
	add	x17, x17, x6
	cmp	w18, w5
	bne	.L10
.L9:
	ldr	w25, [sp, 152]
	dup	v1.2d, v9.d[0]
	sxtw	x27, w7
	adrp	x22, .LC4
	sub	x27, x27, #1
	ldr	d8, [x22, #:lo12:.LC4]
	mov	w22, 1
	lsr	x24, x27, 1
	and	x28, x27, -2
	lsl	x24, x24, 4
	add	x21, x28, 1
	sub	w30, w25, #1
	sxtw	x25, w30
.L23:
	mov	w3, 0
	add	x1, sp, 184
	add	x0, sp, 168
	str	q1, [sp, 128]
	stp	w3, w7, [sp, 144]
	bl	timing
	sxtw	x20, w26
	ldp	w5, w7, [sp, 144]
	ldr	q4, [sp, 128]
	.p2align 4
.L15:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	ble	.L12
	mov	x0, x19
	str	q4, [sp, 128]
	stp	w5, w7, [sp, 144]
	bl	dummy
	ldp	w5, w7, [sp, 144]
	ldr	q4, [sp, 128]
.L12:
	cmp	x25, 1
	ble	.L17
	cmp	w7, 1
	ble	.L17
	mov	x9, 1
	.p2align 4
.L20:
	mul	x10, x20, x9
	cmp	w26, 3
	beq	.L92
	sub	x8, x24, #16
	add	x2, x10, 1
	add	x1, x19, x10, lsl 3
	lsr	x11, x8, 4
	lsl	x12, x2, 3
	sub	x6, x2, x20
	add	x16, x20, x2
	add	x4, x10, 2
	ldr	q6, [x1]
	add	x15, x11, 1
	add	x14, x19, x12
	add	x13, x23, x12
	add	x17, x19, x6, lsl 3
	add	x18, x19, x16, lsl 3
	add	x30, x19, x4, lsl 3
	mov	x0, 0
	ands	x3, x15, 3
	beq	.L21
	cmp	x3, 1
	beq	.L71
	cmp	x3, 2
	beq	.L72
	ldr	q5, [x14]
	ldr	q3, [x17]
	mov	x0, 16
	ldr	q2, [x18]
	ldr	q1, [x30]
	fadd	v7.2d, v5.2d, v6.2d
	mov	v6.16b, v1.16b
	fadd	v10.2d, v7.2d, v3.2d
	fadd	v16.2d, v10.2d, v2.2d
	fadd	v17.2d, v16.2d, v1.2d
	fmul	v18.2d, v17.2d, v4.2d
	str	q18, [x13]
.L72:
	ldr	q19, [x14, x0]
	ldr	q20, [x17, x0]
	ldr	q21, [x18, x0]
	ldr	q22, [x30, x0]
	fadd	v23.2d, v19.2d, v6.2d
	mov	v6.16b, v22.16b
	fadd	v24.2d, v23.2d, v20.2d
	fadd	v25.2d, v24.2d, v21.2d
	fadd	v26.2d, v25.2d, v22.2d
	fmul	v27.2d, v26.2d, v4.2d
	str	q27, [x13, x0]
	add	x0, x0, 16
.L71:
	ldr	q28, [x14, x0]
	ldr	q29, [x17, x0]
	ldr	q30, [x18, x0]
	ldr	q31, [x30, x0]
	fadd	v0.2d, v28.2d, v6.2d
	mov	v6.16b, v31.16b
	fadd	v5.2d, v0.2d, v29.2d
	fadd	v3.2d, v5.2d, v30.2d
	fadd	v2.2d, v3.2d, v31.2d
	fmul	v1.2d, v2.2d, v4.2d
	str	q1, [x13, x0]
	add	x0, x0, 16
	cmp	x24, x0
	beq	.L89
    mov x1, #111        //OSACA START MARKER
    .byte 213,3,32,31   //OSACA START MARKER
.L21:
	add	x8, x0, 16
	ldr	q10, [x14, x0]
	add	x1, x0, 32
	ldr	q17, [x30, x0]
	ldr	q18, [x14, x8]
	add	x2, x0, 48
	ldr	q16, [x30, x8]
	ldr	q19, [x14, x1]
	ldr	q7, [x30, x1]
	ldr	q25, [x14, x2]
	ldr	q24, [x17, x0]
	fadd	v26.2d, v10.2d, v6.2d
	ldr	q27, [x17, x8]
	ldr	q23, [x17, x1]
	fadd	v28.2d, v18.2d, v17.2d
	ldr	q22, [x17, x2]
	ldr	q21, [x18, x0]
	fadd	v29.2d, v19.2d, v16.2d
	ldr	q20, [x18, x8]
	ldr	q30, [x18, x1]
	fadd	v31.2d, v25.2d, v7.2d
	ldr	q10, [x18, x2]
	ldr	q0, [x30, x2]
	fadd	v5.2d, v26.2d, v24.2d
	fadd	v3.2d, v28.2d, v27.2d
	mov	v6.16b, v0.16b
	fadd	v2.2d, v29.2d, v23.2d
	fadd	v1.2d, v31.2d, v22.2d
	fadd	v18.2d, v5.2d, v21.2d
	fadd	v19.2d, v3.2d, v20.2d
	fadd	v25.2d, v2.2d, v30.2d
	fadd	v24.2d, v1.2d, v10.2d
	fadd	v17.2d, v18.2d, v17.2d
	fadd	v16.2d, v19.2d, v16.2d
	fadd	v7.2d, v25.2d, v7.2d
	fadd	v26.2d, v24.2d, v0.2d
	fmul	v27.2d, v17.2d, v4.2d
	fmul	v23.2d, v16.2d, v4.2d
	fmul	v28.2d, v7.2d, v4.2d
	fmul	v22.2d, v26.2d, v4.2d
	str	q27, [x13, x0]
	add	x0, x0, 64
	str	q23, [x13, x8]
	str	q28, [x13, x1]
	str	q22, [x13, x2]
	cmp	x24, x0
	bne	.L21
    mov x1, #222        //OSACA END MARKER
    .byte 213,3,32,31   //OSACA END MARKER
.L89:
	mov	x0, x21
	cmp	x28, x27
	beq	.L22
.L18:
	add	x10, x10, x0
	lsl	x11, x10, 3
	sub	x12, x10, x20
	add	x15, x20, x10
	add	x6, x19, x11
	ldr	d6, [x19, x11]
	ldr	d21, [x19, x12, lsl 3]
	ldr	d20, [x6, -8]
	ldr	d29, [x19, x15, lsl 3]
	ldr	d30, [x6, 8]
	fadd	d31, d20, d6
	fadd	d10, d31, d21
	fadd	d0, d10, d29
	fadd	d5, d0, d30
	fmul	d3, d5, d9
	str	d3, [x23, x11]
.L22:
	add	x9, x9, 1
	cmp	x25, x9
	bgt	.L20
.L17:
	add	w5, w5, 1
	cmp	w5, w22
	bne	.L15
	add	x1, sp, 184
	add	x0, sp, 176
	str	q4, [sp, 128]
	stp	w5, w7, [sp, 144]
	bl	timing
	ldp	d2, d18, [sp, 168]
	ldp	w22, w7, [sp, 144]
	ldr	q1, [sp, 128]
	fsub	d10, d18, d2
	lsl	w22, w22, 1
	fcmpe	d10, d8
	bmi	.L23
	mov	x1, 1024
	add	x0, sp, 192
	asr	w20, w22, 1
	bl	gethostname
	adrp	x16, .LC0
	add	x0, sp, 192
	add	x1, x16, :lo12:.LC0
	bl	strcmp
	ldr	w8, [sp, 152]
	sub	w4, w26, #2
	scvtf	d19, w20
	mov	x1, 4629700416936869888
	fmov	d28, x1
	mov	x14, 70368744177664
	fmov	d25, 8.0e+0
	ldr	w12, [sp, 156]
	movk	x14, 0x408f, lsl 48
	adrp	x13, .LC5
	adrp	x17, .LC6
	fmov	d7, 1.25e-1
	fmov	d24, x14
	ldr	d17, [x13, #:lo12:.LC5]
	ldr	d16, [x17, #:lo12:.LC6]
	cmp	w0, 0
	sub	w2, w8, #2
	adrp	x6, .LC7
	mov	x18, 4562146422526312448
	fmov	d1, d10
	mul	w10, w2, w4
	sub	w15, w12, #4
	ldr	d9, [x6, #:lo12:.LC7]
	fmov	d26, x18
	scvtf	d8, w15
	adrp	x3, .LC2
	mov	w1, w20
	fmul	d6, d19, d28
	fcsel	d27, d17, d16, eq
	add	x0, x3, :lo12:.LC2
	scvtf	d22, w10
	smull	x11, w20, w10
	sxtw	x2, w10
	fmul	d23, d10, d27
	scvtf	d21, x11
	fmul	d18, d8, d25
	fmul	d20, d22, d19
	fmul	d30, d6, d22
	fmul	d2, d22, d25
	fmul	d29, d21, d7
	fdiv	d31, d20, d10
	fdiv	d0, d30, d10
	fmul	d19, d2, d19
	fdiv	d3, d23, d29
	fmul	d25, d19, d9
	fdiv	d2, d25, d10
	fdiv	d5, d31, d24
	fmul	d4, d0, d26
	fdiv	d0, d18, d24
	fmul	d4, d4, d26
	fdiv	d5, d5, d24
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
	ldr	d10, [sp, 112]
	add	sp, sp, 1216
	.cfi_remember_state
	.cfi_restore 74
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
.L92:
	.cfi_restore_state
	mov	x0, 1
	b	.L18
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
	sub	sp, sp, #2288
	.cfi_def_cfa_offset 2288
	adrp	x2, .LC11
	adrp	x0, .LC3
	stp	x29, x30, [sp]
	.cfi_offset 29, -2288
	.cfi_offset 30, -2280
	mov	x29, sp
	mov	x1, 1024
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -2192
	.cfi_offset 73, -2184
	ldr	d8, [x0, #:lo12:.LC3]
	add	x0, sp, 240
	stp	d10, d11, [sp, 112]
	.cfi_offset 74, -2176
	.cfi_offset 75, -2168
	ldr	d10, [x2, #:lo12:.LC11]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -2272
	.cfi_offset 20, -2264
	mov	x20, 1250
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -2256
	.cfi_offset 22, -2248
	mov	x21, 10000
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -2240
	.cfi_offset 24, -2232
	mov	x24, 10008
	mov	x23, 1248
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d12, d13, [sp, 128]
	.cfi_offset 25, -2224
	.cfi_offset 26, -2216
	.cfi_offset 27, -2208
	.cfi_offset 28, -2200
	.cfi_offset 76, -2160
	.cfi_offset 77, -2152
	bl	gethostname
	adrp	x3, .LC5
	adrp	x4, .LC6
	adrp	x1, .LC4
	ldr	d9, [x1, #:lo12:.LC4]
	ldr	d12, [x3, #:lo12:.LC5]
	mov	x5, 20008
	add	x1, sp, 208
	ldr	d11, [x4, #:lo12:.LC6]
	add	x0, sp, 240
	str	x5, [sp, 144]
	bl	getFreq
	adrp	x6, .LC8
	add	x0, x6, :lo12:.LC8
	bl	puts
	mov	x7, 225833675390976
	ldr	d0, [sp, 208]
	adrp	x8, .LC9
	movk	x7, 0x41cd, lsl 48
	mov	w9, 3746
	add	x1, sp, 240
	fmov	d1, x7
	add	x0, x8, :lo12:.LC9
	str	w9, [sp, 188]
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
	stp	x13, x14, [sp, 192]
	.p2align 4
.L106:
	scvtf	d1, w20
	mov	x15, 211106232532992
	mov	w19, w20
	movk	x15, 0x405f, lsl 48
	fmov	d3, x15
	fcmp	d1, d3
	bge	.L168
.L94:
	add	x22, x21, x21, lsl 1
	mov	x0, 64
	mov	x1, x22
	bl	aligned_alloc
	mov	x28, x0
	mov	x0, 64
	mov	x1, x22
	bl	aligned_alloc
	mov	w2, 3
	mov	x25, x0
	mov	x0, x28
	.p2align 4
.L95:
	sub	x17, x21, #8
	add	x18, x21, x0
	lsr	x26, x17, 3
	add	x27, x26, 1
	ands	x30, x27, 7
	beq	.L96
	cmp	x30, 1
	beq	.L145
	cmp	x30, 2
	beq	.L146
	cmp	x30, 3
	beq	.L147
	cmp	x30, 4
	beq	.L148
	cmp	x30, 5
	beq	.L149
	cmp	x30, 6
	beq	.L150
	str	d8, [x0], 8
.L150:
	str	d8, [x0], 8
.L149:
	str	d8, [x0], 8
.L148:
	str	d8, [x0], 8
.L147:
	str	d8, [x0], 8
.L146:
	str	d8, [x0], 8
.L145:
	str	d8, [x0], 8
	cmp	x0, x18
	beq	.L166
.L96:
	mov	x1, x0
	str	d8, [x1], 8
	str	d8, [x0, 8]
	str	d8, [x1, 8]
	stp	d8, d8, [x0, 24]
	stp	d8, d8, [x0, 40]
	add	x0, x0, 64
	str	d8, [x0, -8]
	cmp	x0, x18
	bne	.L96
.L166:
	subs	w2, w2, #1
	bne	.L95
	cmp	w19, 2
	mov	x19, 1
	add	x3, x21, 16
	csel	x4, x23, x19, gt
	add	x27, x28, x3
	and	x6, x4, -2
	lsr	x5, x4, 1
	str	x4, [sp, 176]
	add	x7, x6, 1
	lsl	x22, x5, 4
	str	x6, [sp, 168]
	str	x7, [sp, 160]
	.p2align 4
.L104:
	add	x1, sp, 232
	add	x0, sp, 216
	mov	w26, 0
	bl	timing
	add	x8, x28, x24
	.p2align 4
.L103:
	ldr	d4, [x28]
	fcmpe	d4, #0.0
	ble	.L98
	mov	x0, x28
	str	x8, [sp, 152]
	bl	dummy
	ldr	x8, [sp, 152]
.L98:
	cmp	x20, 2
	bls	.L107
	ldr	x15, [sp, 144]
	sub	x10, x22, #16
	adrp	x17, .LC13
	ldr	q0, [x28, x21]
	lsr	x12, x10, 4
	add	x11, x28, 8
	add	x13, x25, x24
	ldr	q24, [x17, #:lo12:.LC13]
	add	x14, x12, 1
	mov	x30, 0
	add	x16, x28, x15
	ands	x18, x14, 3
	beq	.L101
	cmp	x18, 1
	beq	.L151
	cmp	x18, 2
	beq	.L152
	ldr	q5, [x8]
	ldr	q6, [x28, 8]
	mov	x30, 16
	ldr	q7, [x16]
	fadd	v13.2d, v5.2d, v0.2d
	ldr	q0, [x27]
	fadd	v16.2d, v13.2d, v6.2d
	fadd	v17.2d, v16.2d, v7.2d
	fadd	v18.2d, v0.2d, v17.2d
	fmul	v19.2d, v18.2d, v24.2d
	str	q19, [x13]
.L152:
	ldr	q20, [x8, x30]
	ldr	q21, [x11, x30]
	ldr	q22, [x16, x30]
	fadd	v23.2d, v20.2d, v0.2d
	ldr	q0, [x27, x30]
	fadd	v25.2d, v23.2d, v21.2d
	fadd	v26.2d, v25.2d, v22.2d
	fadd	v27.2d, v0.2d, v26.2d
	fmul	v28.2d, v27.2d, v24.2d
	str	q28, [x13, x30]
	add	x30, x30, 16
.L151:
	ldr	q29, [x8, x30]
	ldr	q30, [x11, x30]
	ldr	q31, [x16, x30]
	fadd	v1.2d, v29.2d, v0.2d
	ldr	q0, [x27, x30]
	fadd	v2.2d, v1.2d, v30.2d
	fadd	v3.2d, v2.2d, v31.2d
	fadd	v4.2d, v0.2d, v3.2d
	fmul	v5.2d, v4.2d, v24.2d
	str	q5, [x13, x30]
	add	x30, x30, 16
	cmp	x22, x30
	beq	.L165
.L101:
	add	x1, x30, 16
	ldr	q16, [x8, x30]
	add	x2, x30, 32
	ldr	q13, [x27, x30]
	ldr	q17, [x8, x1]
	add	x0, x30, 48
	ldr	q7, [x27, x1]
	ldr	q18, [x8, x2]
	ldr	q6, [x27, x2]
	ldr	q25, [x8, x0]
	ldr	q23, [x11, x30]
	fadd	v26.2d, v16.2d, v0.2d
	ldr	q22, [x11, x1]
	ldr	q21, [x11, x2]
	fadd	v27.2d, v17.2d, v13.2d
	ldr	q20, [x11, x0]
	ldr	q19, [x16, x30]
	fadd	v28.2d, v18.2d, v7.2d
	ldr	q29, [x16, x1]
	ldr	q30, [x16, x2]
	fadd	v31.2d, v25.2d, v6.2d
	ldr	q2, [x16, x0]
	ldr	q0, [x27, x0]
	fadd	v5.2d, v26.2d, v23.2d
	fadd	v4.2d, v27.2d, v22.2d
	fadd	v3.2d, v28.2d, v21.2d
	fadd	v1.2d, v31.2d, v20.2d
	fadd	v16.2d, v5.2d, v19.2d
	fadd	v17.2d, v4.2d, v29.2d
	fadd	v18.2d, v3.2d, v30.2d
	fadd	v25.2d, v1.2d, v2.2d
	fadd	v13.2d, v13.2d, v16.2d
	fadd	v7.2d, v7.2d, v17.2d
	fadd	v6.2d, v6.2d, v18.2d
	fadd	v23.2d, v0.2d, v25.2d
	fmul	v26.2d, v13.2d, v24.2d
	fmul	v22.2d, v7.2d, v24.2d
	fmul	v21.2d, v6.2d, v24.2d
	fmul	v27.2d, v23.2d, v24.2d
	str	q26, [x13, x30]
	add	x30, x30, 64
	str	q22, [x13, x1]
	str	q21, [x13, x2]
	str	q27, [x13, x0]
	cmp	x22, x30
	bne	.L101
	.p2align 4
.L165:
	ldp	x3, x4, [sp, 168]
	cmp	x3, x4
	beq	.L102
	ldr	x9, [sp, 160]
.L100:
	add	x5, x9, x20
	ldr	d24, [x28, x9, lsl 3]
	lsl	x6, x5, 3
	add	x7, x20, x5
	add	x9, x28, x6
	ldr	d20, [x28, x6]
	ldr	d19, [x28, x7, lsl 3]
	ldr	d0, [x9, -8]
	ldr	d28, [x9, 8]
	fadd	d29, d0, d20
	fadd	d30, d29, d24
	fadd	d31, d30, d19
	fadd	d2, d31, d28
	fmul	d5, d2, d10
	str	d5, [x25, x6]
.L102:
	add	w26, w26, 1
	cmp	w19, w26
	bne	.L103
	add	x1, sp, 232
	add	x0, sp, 224
	lsl	w19, w19, 1
	bl	timing
	ldp	d4, d3, [sp, 216]
	fsub	d13, d3, d4
	fcmpe	d13, d9
	bmi	.L104
	mov	x1, 1024
	add	x0, sp, 1264
	asr	w27, w19, 1
	bl	gethostname
	mov	x22, 4629700416936869888
	sub	x20, x20, #64
	ldr	x1, [sp, 192]
	add	x0, sp, 1264
	sub	x24, x24, #512
	sub	x21, x21, #512
	bl	strcmp
	scvtf	d25, w23
	scvtf	d18, w27
	mov	x8, 70368744177664
	adrp	x12, .LC7
	fmov	d23, 8.0e+0
	fmov	d7, x22
	movk	x8, 0x408f, lsl 48
	ldr	d26, [x12, #:lo12:.LC7]
	fmov	d16, x8
	cmp	w0, 0
	sxtw	x10, w27
	ldr	w14, [sp, 188]
	fcsel	d17, d12, d11, eq
	mul	x13, x10, x23
	fmov	d1, d13
	mov	x11, 4562146422526312448
	fmov	d22, 1.25e-1
	fmov	d21, x11
	ldr	x16, [sp, 144]
	ldr	x0, [sp, 200]
	mov	x2, x23
	mov	w1, w27
	sub	x23, x23, #64
	sub	w15, w14, #192
	fmul	d27, d25, d18
	fmul	d20, d25, d23
	str	w15, [sp, 188]
	fmul	d6, d18, d7
	fmul	d19, d13, d17
	scvtf	d24, x13
	sub	x17, x16, #1024
	str	x17, [sp, 144]
	fdiv	d28, d27, d13
	fmul	d30, d20, d18
	fmul	d29, d6, d25
	fmul	d0, d24, d22
	fmul	d2, d30, d26
	fdiv	d31, d29, d13
	fdiv	d3, d19, d0
	fdiv	d2, d2, d13
	scvtf	d13, w14
	fmul	d18, d13, d23
	fdiv	d5, d28, d16
	fdiv	d0, d18, d16
	fmul	d4, d31, d21
	fmul	d4, d4, d21
	fdiv	d5, d5, d16
	bl	printf
	mov	x0, x28
	bl	free
	mov	x0, x25
	bl	free
	cmp	x20, 162
	bne	.L106
	mov	w0, 0
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	add	sp, sp, 2288
	.cfi_remember_state
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
.L107:
	.cfi_restore_state
	mov	x9, 1
	b	.L100
.L168:
	adrp	x16, .LC12
	ldr	d0, [x16, #:lo12:.LC12]
	bl	pow
	b	.L94
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
	.string	"2D5PT b[j][i] = c0 * (a[j][i] + a[j][i-1] + ...), 64 byte/it, 5 Flop/it"
.LC9:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
.LC10:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size"
	.ident	"GCC: (ARM-build-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
