	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"brain.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"r\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 30024
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #29952
	sub	sp, sp, #72
	sub	r3, fp, #28672
	sub	r3, r3, #4
	str	r0, [r3, #-1348]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	sub	r3, fp, #28672
	sub	r3, r3, #4
	sub	r3, r3, #1328
	sub	r3, r3, #12
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, .L7
	cmp	r3, r2
	ble	.L3
	sub	r3, fp, #28672
	sub	r3, r3, #4
	ldr	r0, [r3, #-1348]
	ldr	r1, .L7+4
	bl	fopen
	str	r0, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L4
.L6:
	sub	r3, fp, #28672
	sub	r3, r3, #4
	sub	r3, r3, #1328
	sub	r3, r3, #12
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	ldrb	r2, [fp, #-13]
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r0, [fp, #-12]
	bl	fgetc
	mov	r3, r0
	strb	r3, [fp, #-13]
	b	.L6
.L8:
	.align	2
.L7:
	.word	29999
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
