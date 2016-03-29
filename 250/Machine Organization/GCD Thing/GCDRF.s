	.file	"GCDRF.c"
	.text
	.globl	_gcd
	.def	_gcd;	.scl	2;	.type	32;	.endef
_gcd:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$64, (%esp)
	call	_DumpS
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	jne	L2
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L3
L2:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	12(%ebp)
	movl	%edx, %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_gcd
	movl	%eax, -12(%ebp)
L3:
	movl	$64, (%esp)
	call	_DumpS
	movl	-12(%ebp), %eax
	leave
	ret
	.def	_DumpS;	.scl	2;	.type	32;	.endef
