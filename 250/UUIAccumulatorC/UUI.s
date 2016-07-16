	.file	"UUI.c"
	.text
	.globl	newUUI
	.def	newUUI;	.scl	2;	.type	32;	.endef
	.seh_proc	newUUI
newUUI:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "%s\0"
	.text
	.globl	printUUI
	.def	printUUI;	.scl	2;	.type	32;	.endef
	.seh_proc	printUUI
printUUI:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	.LC0(%rip), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	printUUIf
	.def	printUUIf;	.scl	2;	.type	32;	.endef
	.seh_proc	printUUIf
printUUIf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	leaq	.LC0(%rip), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "Fatal error: %s\12\0"
.LC2:
	.ascii "Fatal error.\0"
	.text
	.globl	die
	.def	die;	.scl	2;	.type	32;	.endef
	.seh_proc	die
die:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_setframe	%rbp, 32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	cmpq	$0, 16(%rbp)
	je	.L5
	leaq	.LC1(%rip), %rax
	movq	16(%rbp), %rdx
	movq	%rax, %rcx
	call	printf
	jmp	.L6
.L5:
	leaq	.LC2(%rip), %rcx
	call	puts
.L6:
	movl	$1, %ecx
	call	exit
	nop
	.seh_endproc
	.globl	getSize
	.def	getSize;	.scl	2;	.type	32;	.endef
	.seh_proc	getSize
getSize:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_setframe	%rbp, 16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
.L9:
	movl	-4(%rbp), %eax
	cltq
	addq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -5(%rbp)
	addl	$1, -4(%rbp)
	cmpb	$0, -5(%rbp)
	je	.L8
	cmpb	$10, -5(%rbp)
	jne	.L9
.L8:
	movl	-4(%rbp), %eax
	subl	$1, %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Memory allocation unsuccessful\0"
	.text
	.globl	makeArray
	.def	makeArray;	.scl	2;	.type	32;	.endef
	.seh_proc	makeArray
makeArray:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_setframe	%rbp, 64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movq	16(%rbp), %rcx
	call	getSize
	cltq
	movq	%rax, -16(%rbp)
	addl	$1, 24(%rbp)
	movl	24(%rbp), %eax
	cltq
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L11
	leaq	.LC3(%rip), %rcx
	call	die
.L11:
	movq	-24(%rbp), %rax
	movb	$48, (%rax)
	movl	$1, -4(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movb	$48, (%rax)
	addl	$1, -4(%rbp)
.L12:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movl	24(%rbp), %eax
	cltq
	subq	-16(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L13
	movl	$0, -8(%rbp)
	movl	24(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -4(%rbp)
	jmp	.L14
.L15:
	movl	-8(%rbp), %eax
	cltq
	addq	16(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, -25(%rbp)
	movl	-4(%rbp), %eax
	cltq
	addq	-24(%rbp), %rax
	movzbl	-25(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -8(%rbp)
	addl	$1, -4(%rbp)
.L14:
	movl	-4(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L15
	movq	-24(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "Mem allocate unsuccessful\0"
	.text
	.globl	readUUI
	.def	readUUI;	.scl	2;	.type	32;	.endef
	.seh_proc	readUUI
readUUI:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_setframe	%rbp, 64
	.seh_endprologue
	movq	$1, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L17
	leaq	.LC4(%rip), %rcx
	call	die
.L17:
	movl	$0, -20(%rbp)
	jmp	.L22
.L23:
	nop
.L22:
	movq	__imp___iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	call	fgetc
	movb	%al, -21(%rbp)
	movl	-20(%rbp), %eax
	cltq
	addq	-16(%rbp), %rax
	movzbl	-21(%rbp), %edx
	movb	%dl, (%rax)
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	cltq
	cmpq	-8(%rbp), %rax
	jb	.L18
	addq	$1, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	realloc
	movq	%rax, -16(%rbp)
.L18:
	cmpb	$10, -21(%rbp)
	je	.L19
	cmpb	$-1, -21(%rbp)
	jne	.L23
.L19:
	movl	-20(%rbp), %eax
	cltq
	addq	-16(%rbp), %rax
	movb	$0, (%rax)
	nop
	movq	-16(%rbp), %rax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	toInt
	.def	toInt;	.scl	2;	.type	32;	.endef
	.seh_proc	toInt
toInt:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, %eax
	movb	%al, 16(%rbp)
	movsbl	16(%rbp), %eax
	subl	$48, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	toChar
	.def	toChar;	.scl	2;	.type	32;	.endef
	.seh_proc	toChar
toChar:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	16(%rbp), %eax
	addl	$48, %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	NE
	.def	NE;	.scl	2;	.type	32;	.endef
	.seh_proc	NE
NE:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L27
	movq	24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L27
	movq	16(%rbp), %rcx
	call	getSize
	movl	%eax, %ebx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	getSize
	cmpl	%eax, %ebx
	jne	.L27
	movl	$0, %eax
	jmp	.L28
.L27:
	movl	$1, %eax
.L28:
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	addTen
	.def	addTen;	.scl	2;	.type	32;	.endef
	.seh_proc	addTen
addTen:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	24(%rbp), %eax
	cltq
	subq	$1, %rax
	addq	16(%rbp), %rax
	movzbl	(%rax), %eax
	addl	$1, %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	toInt
	cmpl	$9, %eax
	jle	.L30
	movl	24(%rbp), %eax
	cltq
	movq	%rax, %rbx
	addq	16(%rbp), %rbx
	movl	32(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %ecx
	call	toChar
	movb	%al, (%rbx)
	movl	24(%rbp), %eax
	cltq
	subq	$1, %rax
	addq	16(%rbp), %rax
	movzbl	(%rax), %eax
	addl	$1, %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	toInt
	movl	%eax, 32(%rbp)
	subl	$1, 24(%rbp)
	movl	32(%rbp), %edx
	movl	24(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	addTen
	jmp	.L31
.L30:
	movl	24(%rbp), %eax
	cltq
	subq	$1, %rax
	movq	%rax, %rbx
	addq	16(%rbp), %rbx
	movl	24(%rbp), %eax
	cltq
	subq	$1, %rax
	addq	16(%rbp), %rax
	movzbl	(%rax), %eax
	addl	$1, %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	toInt
	movl	%eax, %ecx
	call	toChar
	movb	%al, (%rbx)
	movl	24(%rbp), %eax
	cltq
	movq	%rax, %rbx
	addq	16(%rbp), %rbx
	movl	32(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%ecx, %edx
	subl	%eax, %edx
	movl	%edx, %ecx
	call	toChar
	movb	%al, (%rbx)
.L31:
	movq	16(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	endCalc
	.def	endCalc;	.scl	2;	.type	32;	.endef
	.seh_proc	endCalc
endCalc:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_setframe	%rbp, 16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L33
.L34:
	addq	$1, 16(%rbp)
.L33:
	movl	-4(%rbp), %eax
	cltq
	addq	16(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	je	.L34
	movq	16(%rbp), %rax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	sum
	.def	sum;	.scl	2;	.type	32;	.endef
	.seh_proc	sum
sum:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$104, %rsp
	.seh_stackalloc	104
	.seh_setframe	%rbp, 112
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rcx
	call	getSize
	movl	%eax, -40(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	getSize
	movl	%eax, -44(%rbp)
	movl	-40(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jle	.L36
	movl	-40(%rbp), %eax
	movl	%eax, -20(%rbp)
	jmp	.L37
.L36:
	movl	-44(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jle	.L38
	movl	-44(%rbp), %eax
	movl	%eax, -20(%rbp)
	jmp	.L37
.L38:
	movl	-44(%rbp), %eax
	movl	%eax, -20(%rbp)
.L37:
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	movq	16(%rbp), %rcx
	call	makeArray
	movq	%rax, -32(%rbp)
	movl	-20(%rbp), %edx
	movq	24(%rbp), %rax
	movq	%rax, %rcx
	call	makeArray
	movq	%rax, -56(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, -36(%rbp)
	jmp	.L39
.L42:
	movl	-36(%rbp), %eax
	cltq
	addq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	toInt
	movl	%eax, -60(%rbp)
	movl	-36(%rbp), %eax
	cltq
	addq	-56(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	call	toInt
	movl	%eax, -64(%rbp)
	movl	-64(%rbp), %eax
	movl	-60(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -68(%rbp)
	cmpl	$9, -68(%rbp)
	jle	.L40
	movl	-68(%rbp), %ecx
	movl	-36(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	addTen
	movq	%rax, -32(%rbp)
	jmp	.L41
.L40:
	movl	-36(%rbp), %eax
	cltq
	movq	%rax, %rbx
	addq	-32(%rbp), %rbx
	movl	-68(%rbp), %eax
	movl	%eax, %ecx
	call	toChar
	movb	%al, (%rbx)
.L41:
	subl	$1, -36(%rbp)
.L39:
	cmpl	$0, -36(%rbp)
	jns	.L42
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rcx
	call	endCalc
	addq	$104, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	realloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
