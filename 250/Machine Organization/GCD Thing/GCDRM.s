	.file	"GCDRM.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
.ascii "Enter a number: \0"
LC1:
	.ascii "%d\0"
LC2:
	.ascii "Enter another: \0"
LC3:
	.ascii "The GCD of %d and %d is %d.\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$LC0, %eax
	movl	%eax, (%esp)
	call	_printf
	movl	$LC1, %eax
	leal	24(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_scanf
	movl	$LC2, %eax
	movl	%eax, (%esp)
	call	_printf
	movl	$LC1, %eax
	leal	20(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_scanf
	movl	$64, (%esp)
	call	_DumpS
	movl	20(%esp), %edx
	movl	24(%esp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_gcd
	movl	%eax, 28(%esp)
	movl	$64, (%esp)
	call	_DumpS
	movl	20(%esp), %ecx
	movl	24(%esp), %edx
	movl	$LC3, %eax
	movl	28(%esp), %ebx
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_printf
	movl	-4(%ebp), %ebx
	leave
	ret
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_DumpS;	.scl	2;	.type	32;	.endef
	.def	_gcd;	.scl	2;	.type	32;	.endef
