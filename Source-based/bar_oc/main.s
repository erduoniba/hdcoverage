	.section	__TEXT,__text,regular,pure_instructions
	.build_version iossimulator, 14, 4	sdk_version 14, 4
	.globl	_add                    ## -- Begin function add
	.p2align	4, 0x90
_add:                                   ## @add
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	l___profc_add(%rip), %rax
	addq	$1, %rax
	movq	%rax, l___profc_add(%rip)
	movl	-4(%rbp), %ecx
	addl	-8(%rbp), %ecx
	movl	%ecx, %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_printTest              ## -- Begin function printTest
	.p2align	4, 0x90
_printTest:                             ## @printTest
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	l___profc_printTest(%rip), %rax
	addq	$1, %rax
	movq	%rax, l___profc_printTest(%rip)
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	cmpl	$100, -4(%rbp)
	jle	LBB1_2
## %bb.1:
	movq	l___profc_printTest+8(%rip), %rax
	addq	$1, %rax
	movq	%rax, l___profc_printTest+8(%rip)
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB1_9
LBB1_2:
	cmpl	$60, -4(%rbp)
	jle	LBB1_4
## %bb.3:
	movq	l___profc_printTest+16(%rip), %rax
	addq	$1, %rax
	movq	%rax, l___profc_printTest+16(%rip)
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB1_8
LBB1_4:
	cmpl	$0, -4(%rbp)
	jle	LBB1_6
## %bb.5:
	movq	l___profc_printTest+24(%rip), %rax
	addq	$1, %rax
	movq	%rax, l___profc_printTest+24(%rip)
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	jmp	LBB1_7
LBB1_6:
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
LBB1_7:
	jmp	LBB1_8
LBB1_8:
	jmp	LBB1_9
LBB1_9:
	leaq	L_.str.5(%rip), %rdi
	movb	$0, %al
	callq	_printf
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movq	l___profc_main(%rip), %rax
	addq	$1, %rax
	movq	%rax, l___profc_main(%rip)
	movl	$12, %edi
	callq	_printTest
	movl	$8, %edi
	callq	_printTest
	xorl	%edi, %edi
	callq	_printTest
	movl	$1, %edi
	movl	$2, %esi
	callq	_add
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %esi
	leaq	L_.str.6(%rip), %rdi
	movb	$0, %al
	callq	_printf
	xorl	%ecx, %ecx
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.private_extern	___llvm_profile_runtime_user ## -- Begin function __llvm_profile_runtime_user
	.globl	___llvm_profile_runtime_user
	.weak_definition	___llvm_profile_runtime_user
	.p2align	4, 0x90
___llvm_profile_runtime_user:           ## @__llvm_profile_runtime_user
	.cfi_startproc
## %bb.0:
	movq	___llvm_profile_runtime@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"begin\n"

L_.str.1:                               ## @.str.1
	.asciz	"input > 100 \n"

L_.str.2:                               ## @.str.2
	.asciz	" 60 < input <= 100\n"

L_.str.3:                               ## @.str.3
	.asciz	" 0 < input <= 60\n"

L_.str.4:                               ## @.str.4
	.asciz	" input <= 0\n"

L_.str.5:                               ## @.str.5
	.asciz	"end\n"

L_.str.6:                               ## @.str.6
	.asciz	"result: %d\n"

	.section	__LLVM_COV,__llvm_covmap
	.p2align	3               ## @__llvm_coverage_mapping
___llvm_coverage_mapping:
	.long	3                       ## 0x3
	.long	83                      ## 0x53
	.long	149                     ## 0x95
	.long	2                       ## 0x2
	.quad	2232412992676883508     ## 0x1efb1fc9fc78ec34
	.long	9                       ## 0x9
	.quad	24                      ## 0x18
	.quad	5516051442789376587     ## 0x4c8cf38fda3de24b
	.long	124                     ## 0x7c
	.quad	279471023976941216      ## 0x3e0e16a652906a0
	.quad	-2624081020897602054    ## 0xdb956436e78dd5fa
	.long	9                       ## 0x9
	.quad	24                      ## 0x18
	.asciz	"\001Q/Users/denglibing/HDProject/HarryProject/iOS/HDCoverage/Source-based/bar_oc/bar.m\001\000\000\001\001\003\027\002\002\001\000\b\001\005\002\t\002\t\002\t\036\r\002\t\036\r\002\t\020\001\007\027\017\002\001\002\n\000\021\005\000\022\000\223\200\200\200\b\005\000\023\002\006\002\002\006\001\212\200\200\200\b\002\001\n\b\006\002\000\017\000\025\t\000\026\000\227\200\200\200\b\t\000\027\002\006\036\002\006\001\212\200\200\200\b\036\001\n\005\006\036\000\017\000\024\r\000\025\000\226\200\200\200\b\r\000\026\002\006\032\002\006\001\212\200\200\200\b\032\001\n\002\006\001\000\000\001\001\030\020\013\002\000\000\000\000\000\000"

	.section	__DATA,__llvm_prf_cnts
	.p2align	3               ## @__profc_add
l___profc_add:
	.space	8

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3               ## @__profd_add
l___profd_add:
	.quad	2232412992676883508     ## 0x1efb1fc9fc78ec34
	.quad	24                      ## 0x18
	.quad	l___profc_add
	.quad	_add
	.quad	0
	.long	1                       ## 0x1
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3               ## @__profc_printTest
l___profc_printTest:
	.space	32

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3               ## @__profd_printTest
l___profd_printTest:
	.quad	5516051442789376587     ## 0x4c8cf38fda3de24b
	.quad	279471023976941216      ## 0x3e0e16a652906a0
	.quad	l___profc_printTest
	.quad	_printTest
	.quad	0
	.long	4                       ## 0x4
	.space	4

	.section	__DATA,__llvm_prf_cnts
	.p2align	3               ## @__profc_main
l___profc_main:
	.space	8

	.section	__DATA,__llvm_prf_data,regular,live_support
	.p2align	3               ## @__profd_main
l___profd_main:
	.quad	-2624081020897602054    ## 0xdb956436e78dd5fa
	.quad	24                      ## 0x18
	.quad	l___profc_main
	.quad	_main
	.quad	0
	.long	1                       ## 0x1
	.space	4

	.section	__DATA,__llvm_prf_names
l___llvm_prf_nm:                        ## @__llvm_prf_nm
	.ascii	"\022\032x\332KLIa,(\312\314+\tI-.a\314M\314\314\003\000>\004\006\236"

	.no_dead_strip	___llvm_coverage_mapping
	.no_dead_strip	___llvm_profile_runtime_user
	.no_dead_strip	l___profd_add
	.no_dead_strip	l___profd_printTest
	.no_dead_strip	l___profd_main
	.no_dead_strip	l___llvm_prf_nm
	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	96

.subsections_via_symbols
