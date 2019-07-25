	.arch armv8.1-a+crypto+crc
	.file	"copy.c"
	.text
	.align	2
	.p2align 4,,15
	.global	getFreq
	.type	getFreq, %function
getFreq:
.LFB24:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	adrp	x2, .LC0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x20, x1
	add	x1, x2, :lo12:.LC0
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	mov	x21, x0
	bl	strcmp
	cbz	w0, .L7
	adrp	x1, .LC1
	mov	x0, x21
	add	x1, x1, :lo12:.LC1
	bl	strcmp
	mov	w19, w0
	cbnz	w0, .L4
	fmov	d1, 9.0e+0
	fmov	d0, 1.0e+1
	bl	pow
	adrp	x0, .LC2
	ldr	d1, [x0, #:lo12:.LC2]
	fmul	d0, d0, d1
	fcvtzs	d0, d0
	str	d0, [x20]
.L1:
	mov	w0, w19
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 3
.L7:
	.cfi_restore_state
	fmov	d1, 9.0e+0
	fmov	d0, 1.0e+1
	mov	w19, w0
	bl	pow
	ldr	x21, [sp, 32]
	fmov	d1, 2.5e+0
	mov	w0, w19
	fmul	d0, d0, d1
	fcvtzs	d0, d0
	str	d0, [x20]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 3
.L4:
	.cfi_restore_state
	mov	w19, -1
	b	.L1
	.cfi_endproc
.LFE24:
	.size	getFreq, .-getFreq
	.align	2
	.p2align 4,,15
	.global	copy
	.type	copy, %function
copy:
.LFB25:
	.cfi_startproc
	sub	sp, sp, #1152
	.cfi_def_cfa_offset 1152
	stp	x29, x30, [sp]
	.cfi_offset 29, -1152
	.cfi_offset 30, -1144
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -1120
	.cfi_offset 22, -1112
	.cfi_offset 23, -1104
	.cfi_offset 24, -1096
	mov	x23, x0
	mov	x0, 64
	lsl	x21, x23, 3
	mov	x1, x21
	stp	x19, x20, [sp, 16]
	str	x25, [sp, 64]
	str	d10, [sp, 72]
	stp	d8, d9, [sp, 80]
	.cfi_offset 19, -1136
	.cfi_offset 20, -1128
	.cfi_offset 25, -1088
	.cfi_offset 74, -1080
	.cfi_offset 72, -1072
	.cfi_offset 73, -1064
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x21
	bl	aligned_alloc
	mov	x20, x0
	cmp	x23, 0
	ble	.L9
	adrp	x0, .LC4
	add	x1, x21, x19
	ldr	x2, [x0, #:lo12:.LC4]
	mov	x0, x19
	.p2align 4
.L10:
	str	x2, [x0], 8
	cmp	x0, x1
	bne	.L10
.L9:
	adrp	x0, .LC5
	lsr	x21, x23, 1
	and	x24, x23, -2
	ldr	d9, [x0, #:lo12:.LC5]
	mov	w25, 1
	lsl	x21, x21, 4
	.p2align 4
.L18:
	add	x1, sp, 120
	add	x0, sp, 104
	mov	w22, 0
	bl	timing
	.p2align 4
.L17:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	bmi	.L28
.L11:
	cmp	x23, 0
	ble	.L13
	mov	x0, 0
	cmp	x23, 1
	beq	.L14
	.p2align 4
    mov x1, #111        //OSACA START
    .byte 213,3,32,31   //OSACA START
.L15:
	ldr	q0, [x19, x0]
	str	q0, [x20, x0]
	add	x0, x0, 16
	cmp	x21, x0
	bne	.L15
    mov x1, #222        //OSACA END 
    .byte 213,3,32,31   //OSACA END  
	cmp	x23, x24
	beq	.L13
	mov	x0, x24
.L14:
	lsl	x0, x0, 3
	ldr	x1, [x19, x0]
	str	x1, [x20, x0]
.L13:
	add	w22, w22, 1
	cmp	w22, w25
	bne	.L17
	add	x1, sp, 120
	add	x0, sp, 112
	lsl	w25, w22, 1
	bl	timing
	ldp	d2, d8, [sp, 104]
	fsub	d8, d8, d2
	fcmpe	d8, d9
	bmi	.L18
	mov	x1, 1024
	add	x0, sp, 128
	asr	w25, w25, 1
	bl	gethostname
	adrp	x1, .LC0
	add	x0, sp, 128
	add	x1, x1, :lo12:.LC0
	bl	strcmp
	cbz	w0, .L29
	adrp	x1, .LC1
	add	x0, sp, 128
	add	x1, x1, :lo12:.LC1
	bl	strcmp
	cbnz	w0, .L20
	fmov	d1, 9.0e+0
	fmov	d0, 1.0e+1
	bl	pow
	adrp	x0, .LC2
	ldr	d10, [x0, #:lo12:.LC2]
	fmul	d10, d0, d10
	fcvtzs	d10, d10
.L20:
	scvtf	d9, x23
	scvtf	d2, w25
	mov	x0, 4629700416936869888
	mov	x1, 70368744177664
	movk	x1, 0x408f, lsl 48
	fmov	d6, x0
	fmov	d0, 8.0e+0
	sxtw	x3, w25
	fmov	d5, x1
	mul	x3, x3, x23
	adrp	x0, .LC6
	fmov	d17, 1.25e-1
	ldr	d16, [x0, #:lo12:.LC6]
	scvtf	d10, d10
	fmul	d10, d10, d8
	mov	x2, 4562146422526312448
	fmov	d4, x2
	fmov	d1, d8
	adrp	x0, .LC3
	mov	w1, w25
	add	x0, x0, :lo12:.LC3
	mov	x2, x23
	scvtf	d3, x3
	fmul	d7, d9, d2
	fmul	d6, d2, d6
	fmul	d0, d9, d0
	fdiv	d7, d7, d8
	fmul	d6, d6, d9
	fmul	d2, d0, d2
	fmul	d3, d3, d17
	fdiv	d0, d0, d5
	fdiv	d6, d6, d8
	fmul	d2, d2, d16
	fdiv	d3, d10, d3
	fdiv	d2, d2, d8
	fdiv	d7, d7, d5
	fmul	d6, d6, d4
	fmul	d4, d6, d4
	fdiv	d5, d7, d5
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x20
	bl	free
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp]
	ldp	x23, x24, [sp, 48]
	ldr	x25, [sp, 64]
	ldr	d10, [sp, 72]
	ldp	d8, d9, [sp, 80]
	add	sp, sp, 1152
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
	ret
	.p2align 3
.L28:
	.cfi_restore_state
	mov	x0, x19
	bl	dummy
	b	.L11
.L29:
	fmov	d1, 9.0e+0
	fmov	d0, 1.0e+1
	bl	pow
	fmov	d10, 2.5e+0
	fmul	d10, d0, d10
	fcvtzs	d10, d10
	b	.L20
	.cfi_endproc
.LFE25:
	.size	copy, .-copy
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,15
	.global	main
	.type	main, %function
main:
.LFB26:
	.cfi_startproc
	sub	sp, sp, #1072
	.cfi_def_cfa_offset 1072
	adrp	x0, .LC10
	mov	x1, 1024
	stp	x29, x30, [sp]
	.cfi_offset 29, -1072
	.cfi_offset 30, -1064
	mov	x29, sp
	str	d8, [sp, 24]
	.cfi_offset 72, -1048
	ldr	d8, [x0, #:lo12:.LC10]
	add	x0, sp, 48
	str	x19, [sp, 16]
	.cfi_offset 19, -1056
	mov	w19, 20
	bl	gethostname
	add	x1, sp, 40
	add	x0, sp, 48
	bl	getFreq
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	printf
	mov	x0, 225833675390976
	ldr	d0, [sp, 40]
	add	x1, sp, 48
	movk	x0, 0x41cd, lsl 48
	fmov	d1, x0
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	scvtf	d0, d0
	fdiv	d0, d0, d1
	bl	printf
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	printf
	.p2align 4
.L31:
	scvtf	d1, w19
	fmov	d0, d8
	add	w19, w19, 1
	bl	pow
	fcvtzs	w1, d0
	cmp	w1, 0
	add	w0, w1, 63
	csel	w0, w0, w1, lt
	and	w0, w0, -64
	sxtw	x0, w0
	bl	copy
	cmp	w19, 36
	bne	.L31
	mov	w0, 0
	ldp	x29, x30, [sp]
	ldr	x19, [sp, 16]
	ldr	d8, [sp, 24]
	add	sp, sp, 1072
	.cfi_restore 72
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
.LC2:
	.word	2576980378
	.word	1073846681
.LC4:
	.word	1907715710
	.word	1048610426
.LC5:
	.word	2576980378
	.word	1070176665
.LC6:
	.word	2696277389
	.word	1051772663
.LC10:
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
.LC3:
	.string	"%12.1f | %11.8f | %9.3f | %7.2f | %7.1f | %7.1f | %6d | %4ld \n"
	.zero	1
.LC7:
	.string	"COPY b[i] = a[i], 8 byte/it, 0 Flop/it\n"
.LC8:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
.LC9:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size\n"
	.ident	"GCC: (ARM-build-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
