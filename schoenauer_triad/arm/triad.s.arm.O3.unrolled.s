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
	sub	sp, sp, #1168
	.cfi_def_cfa_offset 1168
	stp	x29, x30, [sp]
	.cfi_offset 29, -1168
	.cfi_offset 30, -1160
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -1120
	.cfi_offset 24, -1112
	mov	x24, x0
	mov	x0, 64
	lsl	x23, x24, 3
	mov	x1, x23
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	stp	d8, d9, [sp, 96]
	.cfi_offset 19, -1152
	.cfi_offset 20, -1144
	.cfi_offset 21, -1136
	.cfi_offset 22, -1128
	.cfi_offset 25, -1104
	.cfi_offset 26, -1096
	.cfi_offset 27, -1088
	.cfi_offset 72, -1072
	.cfi_offset 73, -1064
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x23
	bl	aligned_alloc
	mov	x20, x0
	mov	x0, 64
	mov	x1, x23
	bl	aligned_alloc
	mov	x21, x0
	mov	x0, 64
	mov	x1, x23
	bl	aligned_alloc
	mov	x22, x0
	cmp	x24, 0
	ble	.L11
	sub	x4, x23, #8
	adrp	x1, .LC3
	adrp	x2, .LC4
	lsr	x5, x4, 3
	adrp	x6, .LC5
	mov	x0, 0
	add	x7, x5, 1
	ldr	x3, [x1, #:lo12:.LC3]
	ldr	x11, [x2, #:lo12:.LC4]
	ldr	x12, [x6, #:lo12:.LC5]
	ands	x8, x7, 7
	beq	.L9
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
	bne	.L105
.L79:
	str	x3, [x20, x0]
	str	x11, [x21, x0]
	str	x12, [x22, x0]
	add	x0, x0, 8
.L78:
	str	x3, [x20, x0]
	str	x11, [x21, x0]
	str	x12, [x22, x0]
	add	x0, x0, 8
.L77:
	str	x3, [x20, x0]
	str	x11, [x21, x0]
	str	x12, [x22, x0]
	add	x0, x0, 8
.L76:
	str	x3, [x20, x0]
	str	x11, [x21, x0]
	str	x12, [x22, x0]
	add	x0, x0, 8
.L75:
	str	x3, [x20, x0]
	str	x11, [x21, x0]
	str	x12, [x22, x0]
	add	x0, x0, 8
.L74:
	str	x3, [x20, x0]
	str	x11, [x21, x0]
	str	x12, [x22, x0]
	add	x0, x0, 8
	cmp	x23, x0
	beq	.L11
.L9:
	add	x13, x0, 8
	str	x3, [x20, x0]
	add	x10, x0, 16
	add	x9, x0, 24
	str	x11, [x21, x0]
	add	x14, x0, 32
	add	x15, x0, 40
	add	x16, x0, 48
	str	x12, [x22, x0]
	add	x17, x0, 56
	add	x0, x0, 64
	str	x3, [x20, x13]
	str	x11, [x21, x13]
	str	x12, [x22, x13]
	str	x3, [x20, x10]
	str	x11, [x21, x10]
	str	x12, [x22, x10]
	str	x3, [x20, x9]
	str	x11, [x21, x9]
	str	x12, [x22, x9]
	str	x3, [x20, x14]
	str	x11, [x21, x14]
	str	x12, [x22, x14]
	str	x3, [x20, x15]
	str	x11, [x21, x15]
	str	x12, [x22, x15]
	str	x3, [x20, x16]
	str	x11, [x21, x16]
	str	x12, [x22, x16]
	str	x3, [x20, x17]
	str	x11, [x21, x17]
	str	x12, [x22, x17]
	cmp	x23, x0
	bne	.L9
.L11:
	adrp	x18, .LC6
	lsr	x25, x24, 1
	and	x26, x24, -2
	ldr	d8, [x18, #:lo12:.LC6]
	mov	w27, 1
	lsl	x25, x25, 4
	.p2align 4
.L10:
	add	x1, sp, 136
	add	x0, sp, 120
	mov	w23, 0
	bl	timing
	.p2align 4
.L15:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	bmi	.L106
.L12:
	cmp	x24, 0
	ble	.L20
	cmp	x24, 1
	beq	.L24
	sub	x4, x25, #16
	mov	x11, 0
	lsr	x1, x4, 4
	add	x3, x1, 1
	ands	x2, x3, 7
	beq	.L18
	cmp	x2, 1
	beq	.L80
	cmp	x2, 2
	beq	.L81
	cmp	x2, 3
	beq	.L82
	cmp	x2, 4
	beq	.L83
	cmp	x2, 5
	beq	.L84
	cmp	x2, 6
	beq	.L85
	ldr	q2, [x21]
	ldr	q1, [x22]
	mov	x11, 16
	ldr	q3, [x20]
	fmla	v3.2d, v2.2d, v1.2d
	str	q3, [x19]
.L85:
	ldr	q4, [x21, x11]
	ldr	q5, [x22, x11]
	ldr	q6, [x20, x11]
	fmla	v6.2d, v4.2d, v5.2d
	str	q6, [x19, x11]
	add	x11, x11, 16
.L84:
	ldr	q7, [x21, x11]
	ldr	q9, [x22, x11]
	ldr	q16, [x20, x11]
	fmla	v16.2d, v7.2d, v9.2d
	str	q16, [x19, x11]
	add	x11, x11, 16
.L83:
	ldr	q17, [x21, x11]
	ldr	q18, [x22, x11]
	ldr	q19, [x20, x11]
	fmla	v19.2d, v17.2d, v18.2d
	str	q19, [x19, x11]
	add	x11, x11, 16
.L82:
	ldr	q20, [x21, x11]
	ldr	q21, [x22, x11]
	ldr	q22, [x20, x11]
	fmla	v22.2d, v20.2d, v21.2d
	str	q22, [x19, x11]
	add	x11, x11, 16
.L81:
	ldr	q23, [x21, x11]
	ldr	q24, [x22, x11]
	ldr	q25, [x20, x11]
	fmla	v25.2d, v23.2d, v24.2d
	str	q25, [x19, x11]
	add	x11, x11, 16
.L80:
	ldr	q26, [x21, x11]
	ldr	q27, [x22, x11]
	ldr	q28, [x20, x11]
	fmla	v28.2d, v26.2d, v27.2d
	str	q28, [x19, x11]
	add	x11, x11, 16
	cmp	x25, x11
	beq	.L103
    mov x1, #111        //OSACA START
    .byte 213,3,32,31   //OSACA START
.L18:
	add	x12, x11, 16
	ldr	q29, [x21, x11]
	ldr	q30, [x22, x11]
	add	x7, x11, 32
	ldr	q31, [x20, x11]
	ldr	q3, [x21, x12]
	add	x6, x11, 48
	add	x5, x11, 64
	ldr	q2, [x22, x12]
	ldr	q6, [x20, x12]
	add	x8, x11, 80
	add	x0, x11, 96
	ldr	q7, [x21, x7]
	ldr	q9, [x22, x7]
	add	x13, x11, 112
	ldr	q5, [x20, x7]
	ldr	q1, [x21, x6]
	ldr	q0, [x22, x6]
	ldr	q4, [x20, x6]
	fmla	v31.2d, v29.2d, v30.2d
	ldr	q23, [x21, x5]
	ldr	q22, [x22, x5]
	fmla	v6.2d, v3.2d, v2.2d
	ldr	q24, [x20, x5]
	ldr	q21, [x21, x8]
	ldr	q20, [x22, x8]
	ldr	q25, [x20, x8]
	fmla	v5.2d, v7.2d, v9.2d
	ldr	q19, [x21, x0]
	ldr	q18, [x22, x0]
	fmla	v4.2d, v1.2d, v0.2d
	ldr	q26, [x20, x0]
	ldr	q17, [x21, x13]
	ldr	q16, [x22, x13]
	ldr	q27, [x20, x13]
	fmla	v24.2d, v23.2d, v22.2d
	fmla	v25.2d, v21.2d, v20.2d
	str	q31, [x19, x11]
	add	x11, x11, 128
	str	q6, [x19, x12]
	fmla	v26.2d, v19.2d, v18.2d
	str	q5, [x19, x7]
	fmla	v27.2d, v17.2d, v16.2d
	str	q4, [x19, x6]
	str	q24, [x19, x5]
	str	q25, [x19, x8]
	str	q26, [x19, x0]
	str	q27, [x19, x13]
	cmp	x25, x11
	bne	.L18
    mov x1, #222        //OSACA END
    .byte 213,3,32,31   //OSACA END
.L103:
	mov	x30, x26
	cmp	x24, x26
	beq	.L20
.L17:
	lsl	x9, x30, 3
	ldr	d28, [x22, x9]
	ldr	d29, [x21, x9]
	ldr	d30, [x20, x9]
	fmadd	d31, d28, d29, d30
	str	d31, [x19, x9]
.L20:
	add	w23, w23, 1
	cmp	w23, w27
	bne	.L15
	add	x1, sp, 136
	add	x0, sp, 128
	lsl	w27, w23, 1
	bl	timing
	ldp	d3, d2, [sp, 120]
	fsub	d9, d2, d3
	fcmpe	d9, d8
	bmi	.L10
	mov	x1, 1024
	add	x0, sp, 144
	asr	w22, w27, 1
	bl	gethostname
	adrp	x25, .LC9
	mov	x26, 4562146422526312448
	adrp	x14, .LC0
	add	x0, sp, 144
	add	x1, x14, :lo12:.LC0
	bl	strcmp
	scvtf	d22, x24
	scvtf	d23, w22
	mov	x10, 4629700416936869888
	ldr	d21, [x25, #:lo12:.LC9]
	fmov	d7, 8.0e+0
	fmov	d6, x10
	adrp	x16, .LC7
	adrp	x18, .LC8
	ldr	d8, [x16, #:lo12:.LC7]
	ldr	d24, [x18, #:lo12:.LC8]
	mov	x15, 70368744177664
	cmp	w0, 0
	movk	x15, 0x408f, lsl 48
	fmov	d1, d9
	sxtw	x17, w22
	fmov	d20, 1.25e-1
	fmov	d5, x15
	mul	x4, x17, x24
	fmov	d4, x26
	adrp	x3, .LC2
	add	x0, x3, :lo12:.LC2
	mov	w1, w22
	mov	x2, x24
	fcsel	d26, d8, d24, eq
	fmul	d25, d22, d23
	fmul	d0, d22, d7
	fmul	d19, d23, d6
	scvtf	d18, x4
	fmul	d27, d9, d26
	fdiv	d28, d25, d9
	fmul	d16, d0, d23
	fmul	d29, d19, d22
	fmul	d17, d18, d20
	fdiv	d0, d0, d5
	fmul	d30, d16, d21
	fdiv	d31, d29, d9
	fdiv	d3, d27, d17
	fdiv	d2, d30, d9
	fdiv	d9, d28, d5
	fmul	d23, d31, d4
	fmul	d4, d23, d4
	fdiv	d5, d9, d5
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
	ldr	x27, [sp, 80]
	ldp	d8, d9, [sp, 96]
	add	sp, sp, 1168
	.cfi_remember_state
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
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
	bl	dummy
	b	.L12
	.p2align 3
.L24:
	mov	x30, 0
	b	.L17
.L105:
	mov	x0, 8
	str	x3, [x20]
	str	x11, [x21]
	str	x12, [x22]
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
	adrp	x0, .LC13
	mov	x1, 1024
	stp	x29, x30, [sp]
	.cfi_offset 29, -1088
	.cfi_offset 30, -1080
	mov	x29, sp
	str	d8, [sp, 32]
	.cfi_offset 72, -1056
	ldr	d8, [x0, #:lo12:.LC13]
	add	x0, sp, 64
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1072
	.cfi_offset 20, -1064
	mov	w19, 21
	bl	gethostname
	add	x1, sp, 56
	add	x0, sp, 64
	bl	getFreq
	adrp	x1, .LC10
	add	x0, x1, :lo12:.LC10
	bl	puts
	mov	x2, 225833675390976
	ldr	d0, [sp, 56]
	adrp	x3, .LC11
	movk	x2, 0x41cd, lsl 48
	add	x1, sp, 64
	add	x0, x3, :lo12:.LC11
	fmov	d1, x2
	scvtf	d2, d0
	fdiv	d0, d2, d1
	bl	printf
	adrp	x4, .LC12
	add	x0, x4, :lo12:.LC12
	bl	puts
	fmov	d0, d8
	fmov	d1, 2.0e+1
	bl	pow
	fcvtzs	w5, d0
	and	w6, w5, -64
	sxtw	x0, w6
	bl	triad
.L108:
	scvtf	d1, w19
	fmov	d0, d8
	add	w20, w19, 1
	bl	pow
	fcvtzs	w7, d0
	and	w8, w7, -64
	sxtw	x0, w8
	bl	triad
	scvtf	d1, w20
	fmov	d0, d8
	bl	pow
	fcvtzs	w9, d0
	and	w10, w9, -64
	sxtw	x0, w10
	bl	triad
	add	w11, w20, 1
	fmov	d0, d8
	scvtf	d1, w11
	bl	pow
	fcvtzs	w12, d0
	and	w13, w12, -64
	sxtw	x0, w13
	bl	triad
	add	w14, w19, 3
	fmov	d0, d8
	scvtf	d1, w14
	bl	pow
	fcvtzs	w15, d0
	and	w16, w15, -64
	sxtw	x0, w16
	bl	triad
	add	w17, w19, 4
	fmov	d0, d8
	add	w19, w19, 5
	scvtf	d1, w17
	bl	pow
	fcvtzs	w18, d0
	and	w0, w18, -64
	sxtw	x0, w0
	bl	triad
	cmp	w19, 36
	bne	.L108
	mov	w0, 0
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldr	d8, [sp, 32]
	add	sp, sp, 1088
	.cfi_restore 72
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
	.word	619800931
	.word	1057026584
.LC6:
	.word	2576980378
	.word	1070176665
.LC7:
	.word	536870912
	.word	1105371231
.LC8:
	.word	3221225472
	.word	1105224746
.LC9:
	.word	2696277389
	.word	1051772663
.LC13:
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
.LC10:
	.string	"TRIAD a[i] = b[i] + c[i] * d[i], 32 byte/it, 2 Flop/it"
	.zero	1
.LC11:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
.LC12:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size"
	.ident	"GCC: (ARM-build-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
