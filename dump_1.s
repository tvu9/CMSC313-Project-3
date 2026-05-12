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
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
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
	movl	$.LC0, %esi
	movl	$.LC1, %edi
	call	fopen
	testq	%rax, %rax
	je	.L12
	movq	%rax, %r13
	movl	$0, %r12d
	jmp	.L11
.L4:
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
.L5:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L16
.L6:
	cmpl	%ebx, %r14d
	jle	.L4
	movzbl	(%rsp,%rbx), %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	jmp	.L5
.L16:
	movl	$124, %edi
	call	putchar
	testl	%ebp, %ebp
	jle	.L7
	movq	%rsp, %rbx
	leal	-1(%rbp), %eax
	leaq	1(%rsp,%rax), %r14
	jmp	.L10
.L8:
	movl	$46, %edi
	call	putchar
.L9:
	addq	$1, %rbx
	cmpq	%r14, %rbx
	je	.L7
.L10:
	movzbl	(%rbx), %edi
	leal	-32(%rdi), %eax
	cmpb	$94, %al
	ja	.L8
	movzbl	%dil, %edi
	call	putchar
	jmp	.L9
.L7:
	movl	$.LC5, %edi
	call	puts
	addl	%ebp, %r12d
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
	movl	$0, %eax
	call	printf
	movl	$0, %ebx
	jmp	.L6
.L3:
	movq	%r13, %rdi
	call	fclose
.L1:
	movl	%r14d, %eax
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
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
