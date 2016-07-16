	.file	"UUIAccumulator.c"
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "0\0"
.LC1:
	.ascii "SENTINEL is \0"
.LC2:
	.ascii "Accumulator is \0"
.LC3:
	.ascii "Enter an UUI:\0"
.LC4:
	.ascii "Current accumulation is \0"
.LC5:
	.ascii "Which is equivalent to \0"
.LC6:
	.ascii "Final accumulation is   \0"
.LC7:
	.ascii "Which is equivalent to  \0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_setframe	%rbp, 64
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rcx
	call	newUUI
	movq	%rax, -16(%rbp)
	leaq	.LC0(%rip), %rcx
	call	newUUI
	movq	%rax, -8(%rbp)
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	printUUI
	movl	$10, %ecx
	call	putchar
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	printUUI
	movl	$10, %ecx
	call	putchar
.L3:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	call	readUUI
	movq	%rax, -24(%rbp)
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	NE
	testl	%eax, %eax
	je	.L2
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	sum
	movq	%rax, -8(%rbp)
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	printUUI
	movl	$10, %ecx
	call	putchar
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	printUUIf
	movl	$10, %ecx
	call	putchar
.L2:
	movq	-16(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rax, %rcx
	call	NE
	testl	%eax, %eax
	jne	.L3
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	printUUI
	movl	$10, %ecx
	call	putchar
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movq	-8(%rbp), %rax
	movq	%rax, %rcx
	call	printUUIf
	movl	$10, %ecx
	call	putchar
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	newUUI;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	printUUI;	.scl	2;	.type	32;	.endef
	.def	readUUI;	.scl	2;	.type	32;	.endef
	.def	NE;	.scl	2;	.type	32;	.endef
	.def	sum;	.scl	2;	.type	32;	.endef
	.def	printUUIf;	.scl	2;	.type	32;	.endef
