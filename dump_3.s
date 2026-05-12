	.file	"project3.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"rb"
.LC1:
	.string	"binary.out"
.LC2:
	.string	"%08x "
.LC3:
	.string	"%02x "
.LC4:
	.string	"   "
.LC5:
	.string	"|"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	call	fopen
	testq	%rax, %rax
	je	.L12
	movq	%rax, %r13
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L11:
	movq	%r13, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rsp, %rdi
	call	fread
	movq	%rax, %rbp
	movl	%eax, %r14d
	testl	%eax, %eax
	je	.L3
	movl	%r12d, %esi
	movl	$.LC2, %edi
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	call	printf
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L19:
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC3, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	je	.L18
.L6:
	cmpl	%ebx, %r14d
	jg	.L19
	movl	$.LC4, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	printf
	cmpq	$16, %rbx
	jne	.L6
.L18:
	movl	$124, %edi
	call	putchar
	testl	%ebp, %ebp
	jle	.L7
	leal	-1(%rbp), %r14d
	leaq	1(%rsp), %rax
	movq	%rsp, %rbx
	addq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L10:
	movzbl	(%rbx), %edi
	leal	-32(%rdi), %eax
	cmpb	$94, %al
	jbe	.L16
	movl	$46, %edi
.L16:
	call	putchar
	addq	$1, %rbx
	cmpq	%r14, %rbx
	jne	.L10
.L7:
	movl	$.LC5, %edi
	addl	%ebp, %r12d
	call	puts
	jmp	.L11
.L3:
	movq	%r13, %rdi
	call	fclose
.L1:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movl	%r14d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	movl	$1, %r14d
	jmp	.L1
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
