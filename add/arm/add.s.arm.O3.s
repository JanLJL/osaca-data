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
	mov	x24, x0
	mov	x0, 64
	lsl	x22, x24, 3
	mov	x1, x22
	stp	x19, x20, [sp, 16]
	stp	x25, x26, [sp, 64]
	stp	d8, d9, [sp, 80]
	.cfi_offset 19, -1136
	.cfi_offset 20, -1128
	.cfi_offset 25, -1088
	.cfi_offset 26, -1080
	.cfi_offset 72, -1072
	.cfi_offset 73, -1064
	bl	aligned_alloc
	mov	x19, x0
	mov	x0, 64
	mov	x1, x22
	bl	aligned_alloc
	mov	x21, x0
	mov	x0, 64
	mov	x1, x22
	bl	aligned_alloc
	mov	x20, x0
	cmp	x24, 0
	ble	.L11
	adrp	x1, .LC3
	mov	x0, 0
	ldr	x2, [x1, #:lo12:.LC3]
	adrp	x1, .LC4
	ldr	x1, [x1, #:lo12:.LC4]
	.p2align 4
.L9:
	str	x2, [x21, x0]
	str	x1, [x20, x0]
	add	x0, x0, 8
	cmp	x22, x0
	bne	.L9
.L11:
	adrp	x0, .LC5
	lsr	x22, x24, 1
	and	x25, x24, -2
	ldr	d8, [x0, #:lo12:.LC5]
	mov	w26, 1
	lsl	x22, x22, 4
	.p2align 4
.L10:
	add	x1, sp, 120
	add	x0, sp, 104
	mov	w23, 0
	bl	timing
	.p2align 4
.L15:
	ldr	d0, [x19]
	fcmpe	d0, #0.0
	bmi	.L34
.L12:
	cmp	x24, 0
	ble	.L20
	mov	x0, 0
	cmp	x24, 1
	beq	.L17
	.p2align 4
    mov x1, #111        //OSACA START MARKER
    .byte 213,3,32,31   //OSACA START MARKER
.L18:
	ldr	q0, [x20, x0]
	ldr	q1, [x21, x0]
	fadd	v0.2d, v0.2d, v1.2d
	str	q0, [x19, x0]
	add	x0, x0, 16
	cmp	x22, x0
	bne	.L18            
    mov x1, #222        //OSACA END MARKER
    .byte 213,3,32,31   //OSACA END MARKER
	cmp	x24, x25
	beq	.L20
	mov	x0, x25
.L17:
	lsl	x0, x0, 3
	ldr	d0, [x20, x0]
	ldr	d1, [x21, x0]
	fadd	d0, d0, d1
	str	d0, [x19, x0]
.L20:
	add	w23, w23, 1
	cmp	w23, w26
	bne	.L15
	add	x1, sp, 120
	add	x0, sp, 112
	lsl	w26, w23, 1
	bl	timing
	ldp	d2, d9, [sp, 104]
	fsub	d9, d9, d2
	fcmpe	d9, d8
	bmi	.L10
	mov	x1, 1024
	add	x0, sp, 128
	asr	w26, w26, 1
	bl	gethostname
	adrp	x1, .LC0
	add	x0, sp, 128
	add	x1, x1, :lo12:.LC0
	bl	strcmp
	scvtf	d16, x24
	scvtf	d2, w26
	mov	x1, 4629700416936869888
	sxtw	x3, w26
	fmov	d6, x1
	mov	x1, 70368744177664
	fmov	d0, 8.0e+0
	mul	x3, x3, x24
	movk	x1, 0x408f, lsl 48
	cmp	w0, 0
	adrp	x0, .LC6
	fmov	d18, 1.25e-1
	fmov	d5, x1
	ldr	d8, [x0, #:lo12:.LC6]
	adrp	x0, .LC7
	mov	x1, 4562146422526312448
	ldr	d19, [x0, #:lo12:.LC7]
	adrp	x0, .LC8
	fmov	d4, x1
	fmov	d1, d9
	scvtf	d3, x3
	ldr	d17, [x0, #:lo12:.LC8]
	adrp	x0, .LC2
	mov	w1, w26
	add	x0, x0, :lo12:.LC2
	mov	x2, x24
	fmul	d7, d16, d2
	fmul	d6, d2, d6
	fmul	d0, d16, d0
	fcsel	d8, d8, d19, eq
	fmul	d3, d3, d18
	fmul	d8, d9, d8
	fdiv	d7, d7, d9
	fmul	d6, d6, d16
	fmul	d2, d0, d2
	fdiv	d0, d0, d5
	fdiv	d3, d8, d3
	fdiv	d6, d6, d9
	fmul	d2, d2, d17
	fdiv	d2, d2, d9
	fdiv	d7, d7, d5
	fmul	d6, d6, d4
	fmul	d4, d6, d4
	fdiv	d5, d7, d5
	bl	printf
	mov	x0, x19
	bl	free
	mov	x0, x21
	bl	free
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	mov	x0, x20
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x25, x26, [sp, 64]
	ldp	d8, d9, [sp, 80]
	add	sp, sp, 1152
	.cfi_remember_state
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
.L34:
	.cfi_restore_state
	mov	x0, x19
	bl	dummy
	b	.L12
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
	adrp	x0, .LC12
	mov	x1, 1024
	stp	x29, x30, [sp]
	.cfi_offset 29, -1072
	.cfi_offset 30, -1064
	mov	x29, sp
	str	d8, [sp, 24]
	.cfi_offset 72, -1048
	ldr	d8, [x0, #:lo12:.LC12]
	add	x0, sp, 48
	str	x19, [sp, 16]
	.cfi_offset 19, -1056
	mov	w19, 20
	bl	gethostname
	add	x1, sp, 40
	add	x0, sp, 48
	bl	getFreq
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	mov	x0, 225833675390976
	ldr	d0, [sp, 40]
	add	x1, sp, 48
	movk	x0, 0x41cd, lsl 48
	fmov	d1, x0
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	scvtf	d0, d0
	fdiv	d0, d0, d1
	bl	printf
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	puts
	.p2align 4
.L36:
	scvtf	d1, w19
	fmov	d0, d8
	add	w19, w19, 1
	bl	pow
	fcvtzs	w0, d0
	and	w0, w0, -64
	sxtw	x0, w0
	bl	copy
	cmp	w19, 36
	bne	.L36
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
	.string	"COPY a[i] = b[i] + c[i], 8 byte/it, 0 Flop/it"
	.zero	2
.LC10:
	.string	"Checking for %s. Frequency *must* be set to %4.2f GHz for valid cy/CL.\n"
.LC11:
	.string	"Size (KByte) |   runtime   |  MFlop/s  |  cy/CL  |  MB/s   |  MLUP/s | repeat | size"
	.ident	"GCC: (ARM-build-8) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
