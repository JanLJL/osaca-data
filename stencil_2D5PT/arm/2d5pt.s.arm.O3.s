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
	sub	sp, sp, #1216
	.cfi_def_cfa_offset 1216
	stp	x29, x30, [sp]
	.cfi_offset 29, -1216
	.cfi_offset 30, -1208
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -1200
	.cfi_offset 20, -1192
	mov	w20, w0
	str	w0, [sp, 152]
	mul	w0, w0, w1
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -1120
	.cfi_offset 73, -1112
	fmov	d9, d0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -1184
	.cfi_offset 22, -1176
	sbfiz	x22, x0, 3, 32
	str	w0, [sp, 156]
	mov	x0, 64
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 23, -1168
	.cfi_offset 24, -1160
	.cfi_offset 25, -1152
	.cfi_offset 26, -1144
	mov	w26, w1
	mov	x1, x22
	stp	x27, x28, [sp, 80]
	str	d10, [sp, 112]
	.cfi_offset 27, -1136
	.cfi_offset 28, -1128
	.cfi_offset 74, -1104
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x22
	bl	aligned_alloc
	mov	x23, x0
	sub	w7, w26, #1
	cmp	w20, 0
	ble	.L9
	cmp	w26, 0
	ble	.L9
	adrp	x0, .LC3
	ubfiz	x1, x7, 3, 32
	sbfiz	x5, x26, 3, 32
	mov	x4, x19
	ldr	x2, [x0, #:lo12:.LC3]
	add	x1, x1, 8
	mov	w3, 0
	add	x1, x1, x19
.L10:
	mov	x0, x4
	.p2align 4
.L11:
	str	x2, [x0], 8
	cmp	x0, x1
	bne	.L11
	ldr	w0, [sp, 152]
	add	w3, w3, 1
	add	x4, x4, x5
	add	x1, x1, x5
	cmp	w0, w3
	bne	.L10
.L9:
	adrp	x0, .LC4
	dup	v0.2d, v9.d[0]
	sxtw	x27, w7
	mov	w21, 1
	ldr	d8, [x0, #:lo12:.LC4]
	ldr	w0, [sp, 152]
	sub	x27, x27, #1
	lsr	x24, x27, 1
	and	x28, x27, -2
	lsl	x24, x24, 4
	add	x20, x28, 1
	sub	w25, w0, #1
	sxtw	x25, w25
.L23:
	mov	w5, 0
	add	x1, sp, 184
	add	x0, sp, 168
	str	q0, [sp, 128]
	stp	w5, w7, [sp, 144]
	bl	timing
	sxtw	x22, w26
	ldp	w5, w7, [sp, 144]
	ldr	q0, [sp, 128]
	.p2align 4
.L15:
	ldr	d1, [x19]
	fcmpe	d1, #0.0
	ble	.L12
	mov	x0, x19
	str	q0, [sp, 128]
	stp	w5, w7, [sp, 144]
	bl	dummy
	ldp	w5, w7, [sp, 144]
	ldr	q0, [sp, 128]
.L12:
	cmp	x25, 1
	ble	.L17
	cmp	w7, 1
	ble	.L17
	mov	x9, 1
	.p2align 4
.L20:
	mul	x1, x22, x9
	cmp	w26, 3
	beq	.L40
	add	x2, x1, 1
	add	x0, x19, x1, lsl 3
	add	x3, x1, 2
	sub	x10, x2, x22
	add	x8, x22, x2
	add	x10, x19, x10, lsl 3
	lsl	x2, x2, 3
	add	x8, x19, x8, lsl 3
	ldr	q3, [x0]
	add	x3, x19, x3, lsl 3
	add	x11, x19, x2
	mov	x0, 0
	add	x2, x23, x2
	.p2align 4
    mov x1, #111        //OSACA START MARKER
    .byte 213,3,32,31   //OSACA START MARKER
.L21:
	ldr	q1, [x11, x0]
	ldr	q5, [x10, x0]
	ldr	q4, [x8, x0]
	ldr	q2, [x3, x0]
	fadd	v1.2d, v1.2d, v3.2d
	mov	v3.16b, v2.16b
	fadd	v1.2d, v1.2d, v5.2d
	fadd	v1.2d, v1.2d, v4.2d
	fadd	v1.2d, v1.2d, v2.2d
	fmul	v1.2d, v1.2d, v0.2d
	str	q1, [x2, x0]
	add	x0, x0, 16
	cmp	x24, x0
	bne	.L21
    mov x1, #222        //OSACA END MARKER
    .byte 213,3,32,31   //OSACA END MARKER
	mov	x0, x20
	cmp	x28, x27
	beq	.L22
.L18:
	add	x0, x1, x0
	lsl	x1, x0, 3
	sub	x3, x0, x22
	add	x0, x22, x0
	add	x2, x19, x1
	ldr	d5, [x19, x1]
	ldr	d4, [x19, x3, lsl 3]
	ldr	d1, [x2, -8]
	ldr	d3, [x19, x0, lsl 3]
	ldr	d2, [x2, 8]
	fadd	d1, d1, d5
	fadd	d1, d1, d4
	fadd	d1, d1, d3
	fadd	d1, d1, d2
	fmul	d1, d1, d9
	str	d1, [x23, x1]
.L22:
	add	x9, x9, 1
	cmp	x25, x9
	bgt	.L20
.L17:
	add	w5, w5, 1
	cmp	w5, w21
	bne	.L15
	add	x1, sp, 184
	add	x0, sp, 176
	str	q0, [sp, 128]
	stp	w5, w7, [sp, 144]
	bl	timing
	ldp	d2, d10, [sp, 168]
	ldp	w5, w7, [sp, 144]
	ldr	q0, [sp, 128]
	fsub	d10, d10, d2
	lsl	w21, w5, 1
	fcmpe	d10, d8
	bmi	.L23
	mov	x1, 1024
	add	x0, sp, 192
	sub	w26, w26, #2
	bl	gethostname
	asr	w22, w21, 1
	adrp	x1, .LC0
	add	x0, sp, 192
	add	x1, x1, :lo12:.LC0
	bl	strcmp
	ldr	w1, [sp, 152]
	cmp	w0, 0
	adrp	x0, .LC5
	scvtf	d9, w22
	ldr	d8, [x0, #:lo12:.LC5]
	adrp	x0, .LC6
	fmov	d7, 1.25e-1
	mov	x2, 70368744177664
	ldr	d3, [x0, #:lo12:.LC6]
	movk	x2, 0x408f, lsl 48
	fmov	d2, 8.0e+0
	mov	x3, 4562146422526312448
	fmov	d5, x2
	fmov	d4, x3
	adrp	x0, .LC2
	sub	w20, w1, #2
	mov	x1, 4629700416936869888
	fmov	d1, d10
	add	x0, x0, :lo12:.LC2
	mul	w26, w20, w26
	fmov	d6, x1
	ldr	w1, [sp, 156]
	fcsel	d8, d8, d3, eq
	smull	x6, w22, w26
	scvtf	d16, w26
	sub	w21, w1, #4
	adrp	x1, .LC7
	scvtf	d0, w21
	fmul	d6, d9, d6
	ldr	d17, [x1, #:lo12:.LC7]
	sxtw	x2, w26
	fmul	d8, d10, d8
	mov	w1, w22
	scvtf	d3, x6
	fmul	d6, d6, d16
	fmul	d0, d0, d2
	fmul	d2, d16, d2
	fmul	d3, d3, d7
	fmul	d7, d16, d9
	fdiv	d6, d6, d10
	fmul	d2, d2, d9
	fdiv	d0, d0, d5
	fdiv	d7, d7, d10
	fmul	d2, d2, d17
	fdiv	d3, d8, d3
	fdiv	d2, d2, d10
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
.L40:
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
	adrp	x0, .LC3
	mov	x1, 1024
	stp	x29, x30, [sp]
	.cfi_offset 29, -2288
	.cfi_offset 30, -2280
	mov	x29, sp
	stp	d10, d11, [sp, 112]
	.cfi_offset 74, -2176
	.cfi_offset 75, -2168
	ldr	d10, [x0, #:lo12:.LC3]
	adrp	x0, .LC11
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -2192
	.cfi_offset 73, -2184
	ldr	d9, [x0, #:lo12:.LC11]
	add	x0, sp, 240
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -2272
	.cfi_offset 20, -2264
	mov	x20, 1250
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -2256
	.cfi_offset 22, -2248
	mov	x21, 10000
	mov	x22, 1248
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -2240
	.cfi_offset 24, -2232
	mov	x23, 10008
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -2224
	.cfi_offset 26, -2216
	mov	x26, 20008
	stp	x27, x28, [sp, 80]
	stp	d12, d13, [sp, 128]
	.cfi_offset 27, -2208
	.cfi_offset 28, -2200
	.cfi_offset 76, -2160
	.cfi_offset 77, -2152
	bl	gethostname
	adrp	x0, .LC4
	adrp	x2, .LC6
	add	x1, sp, 208
	ldr	d8, [x0, #:lo12:.LC4]
	adrp	x0, .LC5
	ldr	d11, [x2, #:lo12:.LC6]
	ldr	d12, [x0, #:lo12:.LC5]
	add	x0, sp, 240
	bl	getFreq
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	mov	x0, 225833675390976
	ldr	d0, [sp, 208]
	add	x1, sp, 240
	movk	x0, 0x41cd, lsl 48
	mov	w2, 3746
	fmov	d1, x0
	adrp	x0, .LC9
	str	w2, [sp, 188]
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
	stp	x1, x0, [sp, 192]
	.p2align 4
.L54:
	scvtf	d1, w20
	mov	x0, 211106232532992
	mov	w19, w20
	movk	x0, 0x405f, lsl 48
	fmov	d0, x0
	fcmp	d1, d0
	bge	.L64
.L42:
	add	x24, x21, x21, lsl 1
	mov	x0, 64
	mov	x1, x24
	bl	aligned_alloc
	mov	x28, x0
	mov	x0, 64
	mov	x1, x24
	bl	aligned_alloc
	mov	w1, 3
	mov	x24, x0
	mov	x0, x28
	.p2align 4
.L43:
	add	x2, x21, x0
	.p2align 4
.L44:
	str	d10, [x0], 8
	cmp	x0, x2
	bne	.L44
	subs	w1, w1, #1
	bne	.L43
	cmp	w19, 2
	mov	x19, 1
	add	x0, x21, 16
	csel	x25, x22, x19, gt
	add	x0, x28, x0
	and	x1, x25, -2
	stp	x1, x0, [sp, 168]
	lsr	x0, x25, 1
	lsl	x0, x0, 4
	str	x0, [sp, 152]
	add	x0, x1, 1
	str	x0, [sp, 160]
	.p2align 4
.L52:
	add	x1, sp, 232
	add	x0, sp, 216
	mov	w27, 0
	bl	timing
	add	x5, x28, x23
	.p2align 4
.L51:
	ldr	d0, [x28]
	fcmpe	d0, #0.0
	ble	.L46
	mov	x0, x28
	str	x5, [sp, 144]
	bl	dummy
	ldr	x5, [sp, 144]
.L46:
	cmp	x20, 2
	bls	.L55
	ldr	q1, [x28, x21]
	adrp	x0, .LC13
	add	x6, x28, 8
	add	x4, x28, x26
	ldr	q2, [x0, #:lo12:.LC13]
	add	x1, x24, x23
	mov	x0, 0
.L49:
	ldr	q0, [x5, x0]
	ldr	q4, [x6, x0]
	ldr	x2, [sp, 176]
	ldr	q3, [x4, x0]
	fadd	v0.2d, v0.2d, v1.2d
	ldr	q1, [x2, x0]
	ldr	x2, [sp, 152]
	fadd	v0.2d, v0.2d, v4.2d
	fadd	v0.2d, v0.2d, v3.2d
	fadd	v0.2d, v1.2d, v0.2d
	fmul	v0.2d, v0.2d, v2.2d
	str	q0, [x1, x0]
	add	x0, x0, 16
	cmp	x2, x0
	bne	.L49
	ldr	x0, [sp, 168]
	cmp	x0, x25
	beq	.L50
	ldr	x1, [sp, 160]
.L48:
	add	x0, x1, x20
	ldr	d3, [x28, x1, lsl 3]
	lsl	x1, x0, 3
	add	x0, x20, x0
	add	x4, x28, x1
	ldr	d4, [x28, x1]
	ldr	d2, [x28, x0, lsl 3]
	ldr	d0, [x4, -8]
	ldr	d1, [x4, 8]
	fadd	d0, d0, d4
	fadd	d0, d0, d3
	fadd	d0, d0, d2
	fadd	d0, d0, d1
	fmul	d0, d0, d9
	str	d0, [x24, x1]
.L50:
	add	w27, w27, 1
	cmp	w19, w27
	bne	.L51
	add	x1, sp, 232
	add	x0, sp, 224
	lsl	w19, w19, 1
	bl	timing
	ldp	d2, d13, [sp, 216]
	fsub	d13, d13, d2
	fcmpe	d13, d8
	bmi	.L52
	mov	x1, 1024
	add	x0, sp, 1264
	asr	w19, w19, 1
	bl	gethostname
	sub	x20, x20, #64
	sub	x23, x23, #512
	ldr	x1, [sp, 192]
	add	x0, sp, 1264
	sub	x21, x21, #512
	sub	x26, x26, #1024
	bl	strcmp
	scvtf	d19, w22
	scvtf	d18, w19
	mov	x1, 4629700416936869888
	sxtw	x4, w19
	fmov	d6, x1
	mov	x1, 70368744177664
	fmov	d20, 8.0e+0
	mul	x4, x4, x22
	movk	x1, 0x408f, lsl 48
	ldr	w3, [sp, 188]
	cmp	w0, 0
	fmov	d3, 1.25e-1
	fmov	d16, x1
	adrp	x1, .LC7
	fcsel	d17, d12, d11, eq
	mov	x0, 4562146422526312448
	ldr	d21, [x1, #:lo12:.LC7]
	fmov	d4, x0
	ldr	x0, [sp, 200]
	fmov	d1, d13
	scvtf	d7, x4
	mov	x2, x22
	mov	w1, w19
	sub	x22, x22, #64
	scvtf	d0, w3
	sub	w3, w3, #192
	fmul	d5, d19, d18
	fmul	d6, d18, d6
	str	w3, [sp, 188]
	fmul	d2, d19, d20
	fmul	d17, d13, d17
	fmul	d3, d7, d3
	fdiv	d5, d5, d13
	fmul	d6, d6, d19
	fmul	d2, d2, d18
	fmul	d0, d0, d20
	fdiv	d3, d17, d3
	fdiv	d6, d6, d13
	fmul	d2, d2, d21
	fdiv	d0, d0, d16
	fdiv	d2, d2, d13
	fdiv	d5, d5, d16
	fmul	d6, d6, d4
	fmul	d4, d6, d4
	fdiv	d5, d5, d16
	bl	printf
	mov	x0, x28
	bl	free
	mov	x0, x24
	bl	free
	cmp	x20, 162
	bne	.L54
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
.L55:
	.cfi_restore_state
	mov	x1, 1
	b	.L48
.L64:
	adrp	x0, .LC12
	ldr	d0, [x0, #:lo12:.LC12]
	bl	pow
	b	.L42
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
