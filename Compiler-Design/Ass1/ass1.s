	.file	"ass1.c"					# File_Name: ass1.c
	.section	.rodata					# elf Section: Read-Only Data
	.align 8
.LC0:								# Label 0: String to be printed to get Order
	.string	"Enter the order of the square matrix: "
.LC1:								# Label 1: To scan n
	.string	"%d"						
	.align 8
.LC2:								# Label 2: String to be printed
	.string	"Enter the matrix in row-major order:"
.LC3:								# Label 3: String to be printed
	.string	"The input matrix is:"
.LC4:								# Label 4: Value to be printed
	.string	"%d "
.LC5:								# Label 5: Final Array string to be printed
	.string	"In cs order:"
	.text							# Text/Code Section starts
	.globl	main						# main declared globaly
	.type	main, @function					# main assigned with function type
main:								# main starts here
.LFB0:								# Label Function base 0
	.cfi_startproc						# CFI directive Allow debugger to unwind a stack and .eh_frame for function
	pushq	%rbp						# registering base pointer for main
	.cfi_def_cfa_offset 16					# set offset to 16 bytes down
	.cfi_offset 6, -16
	movq	%rsp, %rbp					# Setting Base pointer to Stack pointer
	.cfi_def_cfa_register 6					# set offset to 6 bytes down
	subq	$1632, %rsp					# setting up Base pointer for 2D Array
	movq	%fs:40, %rax					# sending file segment to accumulator error handling...=> M[fs:eax]<-42) in RTL
								# get the canary
	movq	%rax, -8(%rbp)					# rax -> rbp-8 => 0 -> n
	xorl	%eax, %eax					# accumulator = 0 (XORing with itself)
	movl	$.LC0, %edi					# putting String to o/p stream
	movl	$0, %eax					# clear accumulator
	call	printf						# call printf,return value is in eax
	leaq	-1628(%rbp), %rax				# Load Effective Address (calculate expresion and store) rax <- rbp-1628=data[0]
	movq	%rax, %rsi					# pass the value to stack pointer
	movl	$.LC1, %edi					# edi <- formatting string, 1st parameter
	movl	$0, %eax					# eax <- 0
	call	__isoc99_scanf					# call 1st scanf for scanning n ,return value is in eax
	movl	$.LC2, %edi					# edi <- starting of format string, 2nd parameter
	call	puts						# call puts (put string)
	movl	$0, -1624(%rbp)					# Memory[(rbp-1624)] data[1] <- 0
	jmp	.L2						# jump at the beginning of the while loop
    .L5:							# go to end printing string
	movl	$0, -1620(%rbp)					# Memory [(rbp-1620)] <- 0
	jmp	.L3						# go to Label 3 => inner for loop
.L4:								# Label 4: 
	movl	-1620(%rbp), %eax				# eax <- (rbp-1620)
	leal	1(%rax), %edx					# Load Effective Address rbp-1620 -> rax
	movl	%edx, -1620(%rbp)				# eax <- (rbp-1620)
	leaq	-1616(%rbp), %rcx				# Load Effective Address rbp-1616 -> eax
	movslq	%eax, %rsi					# move a sign extended long(4B) eax value to a quad(8B) rsi
								# equivalent of R = SignExtend(S) where R is 64 bits and S is 32 bits.
	movl	-1624(%rbp), %eax				# eax <- (rbp-1624), next value
	movslq	%eax, %rdx					# again S -> R but in o/p stream
	movq	%rdx, %rax					# rax <- rdx
	salq	$2, %rax					# rax <- shift arithmetic 2-bit left (* by 4)
	addq	%rdx, %rax					# rax <-rax+rdx
	salq	$2, %rax					# rax <- shift arithmetic 2-bit left (* by 4)
	addq	%rsi, %rax					# rax <- rax+rdx
	salq	$2, %rax					# rax <- shift arithmetic 2-bit left
	addq	%rcx, %rax					# rax <- rax + rcx ...next count
	movq	%rax, %rsi					# rsi <- rsi + rax ...next source
	movl	$.LC1, %edi					# send string to o/p stream
	movl	$0, %eax					# set eax <- 0
	call	__isoc99_scanf					# call scanf function inside loop for array elements
.L3:								# Label 3:
	movl	-1628(%rbp), %eax				# eax <- M[rbp-1628]
	cmpl	%eax, -1620(%rbp)				# if return value < M[rbp-1620]...Compare
	jl	.L4						# jump inside loop at Label 4
	addl	$1, -1624(%rbp)					# M[rbp-1624] <- M[rbp-1624]+1
.L2:								# Label 2:
	movl	-1628(%rbp), %eax				# eax <- M[rbp-1628]
	cmpl	%eax, -1624(%rbp)				# if return value < M[rbp-1620]
	jl	.L5						# jump inside loop
	movl	$.LC3, %edi					# pass string to o/p stream
	call	puts						# call put_string function
	movl	$0, -1624(%rbp)					# M[rbp-1624] <- 0
	jmp	.L6						# jump to Label 6
.L9:								# Label 9:
	movl	$0, -1620(%rbp)					# clear M[rbp-1620]
	jmp	.L7						# jump to Label 7
.L8:								# Label 8:
	movl	-1620(%rbp), %eax				# eax <- M[rbp-1620]
	movslq	%eax, %rcx					# rcx <- eax  sign extend , new_val_l (long) new_val (sign extend)
	movl	-1624(%rbp), %eax				# eax=M[rbp-1624]
	movslq	%eax, %rdx					# rdx <- eax  sign extend , new_val_l (long) new_val (sign extend)
	movq	%rdx, %rax					# rax<--rdx
	salq	$2, %rax					# shift arithmetic left by 2 bits of acc
	addq	%rdx, %rax					# rax <- rax+rdx
	salq	$2, %rax					# shift arithmetic left by 2 bits of acc
	addq	%rcx, %rax					# rax <- rcx, setting counter
	movl	-1616(%rbp,%rax,4), %eax			# M[(rbp - 1616)+4*rax]
	movl	%eax, %esi					# esi <- eax 
	movl	$.LC4, %edi					# send string to o/p stream
	movl	$0, %eax					# clear acc
	call	printf						# call printf function
	addl	$1, -1620(%rbp)					# rbp-1620 <- 1
.L7:								# Label L7:
	movl	-1628(%rbp), %eax				# put M
	cmpl	%eax, -1620(%rbp)				# compare if M[(rbp-1620)] = eax
	jl	.L8						# Jump inside the loop
	movl	$10, %edi					# edi <- 10
	call	putchar						# call of putchar function
	addl	$1, -1624(%rbp)					# M[(rbp-1624)]=M[(rbp-1624)]+1 increament to next memory location
.L6:								# Label L6:
	movl	-1628(%rbp), %eax				# eax <- M[(rbp-1628)]
	cmpl	%eax, -1624(%rbp)				# compare if eax < M[rbp-1624]
	jl	.L9						# long jump to inner loop 
	movl	$.LC5, %edi					# move Label to o/p stream
	call	puts						# call of puts function
	movl	-1628(%rbp), %eax				# eax <- M[(rbp-1628)]
	leaq	-1616(%rbp), %rdx				# rdx <- M[(rbp-1616)]
	movq	%rdx, %rsi					# rsi <- rdx
	movl	%eax, %edi					# edi <- eax
	call	cs						# calls of cs function...
	movl	$0, %eax					# clear accumulator
	movq	-8(%rbp), %rcx					# rcx <- M[rbp-8]
	xorq	%fs:40, %rcx					# Check if equal to the original value
	je	.L11						# jump to lable l11 if 1
	call	__stack_chk_fail				# __stack_chk_fail is noreturn
.L11:								# Label L11
	leave							# "movl %ebp, %esp" & "popl %ebp"
	.cfi_def_cfa 7, 8					
	ret							# return to caller
	.cfi_endproc						# end CFI directive
.LFE0:								# Label LFE0
	.size	main, .-main
	.section	.rodata
.LC6:
	.string	"%d\n"
	.text
	.globl	cs
	.type	cs, @function
cs:								# cs function start
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp					# allocate 16 bytes space
	movl	%edi, -4(%rbp)					# M[rbp-4] <- edi
	movq	%rsi, -16(%rbp)					# rbp <- rsp
	cmpl	$0, -4(%rbp)					# M[rbp-16] <- rsi
	jne	.L13						# jump to L13 if acc M[rbp-4]  not empty
	movl	$10, %edi					# edi <- 10
	call	putchar						# call putchar function
	jmp	.L12						# jump to L12
.L13:								# Label L13
	cmpl	$1, -4(%rbp)					# if M[rbp-4] not equal to 1
	jne	.L15						# jump to L15 if acc not empty
	movq	-16(%rbp), %rax					# rax <- M[rbp-16]
	movl	(%rax), %eax					# eax <- rax
	movl	%eax, %esi					# esi <- eax
	movl	$.LC6, %edi					# put string to edi
	movl	$0, %eax					# clear acc
	call	printf						# call printf function
	jmp	.L12						# jump to L12
.L15:								# Label L15
	movq	-16(%rbp), %rsi					# rsi <- M[rbp-16]
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	movl	$0, %ecx					# ecx <- 0
	movl	$1, %edx					# edx <- 1
	movl	%eax, %edi					# edi <- eax
	call	po						# call to function po
	movq	-16(%rbp), %rax					# rax <- M[rbp-16]
	addq	$80, %rax					# rax <- rax+80
	leaq	4(%rax), %rdx					# rdx <- M[rax+4]
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	subl	$2, %eax					# eax <- eax-2
	movq	%rdx, %rsi					# rsi <- rdx
	movl	%eax, %edi					# edi <- eax
	call	cs						# call of function cs
.L12:								# Label L12
	leave							
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	cs, .-cs
	.globl	po
	.type	po, @function
po:								# po function starts
.LFB2:								# Label LFB2
	.cfi_startproc
	pushq	%rbp						# push rbp in stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp					# rbp <- rsp
	.cfi_def_cfa_register 6
	subq	$32, %rsp					# rsp <- rsp-32
	movl	%edi, -4(%rbp)					# M[rbp-4] <- edi
	movq	%rsi, -16(%rbp)					# M[rbp-16] <- rsi
	movl	%edx, -8(%rbp)					# M[rbp-8] <- edx
	movl	%ecx, -20(%rbp)					# M[rbp-20] <- ecx
	movl	-8(%rbp), %eax					# M[rbp-8] <- eax
	cmpl	$2, %eax					# if eax==2
	je	.L18						# jump to L18 if acc is empty
	cmpl	$2, %eax					# acc <- 2
	jg	.L19						# jump if greater
	cmpl	$1, %eax					# acc <- 1
	je	.L20						# jump to L20 if zf=0
	jmp	.L16						# jump to L16
.L19:								# Label L19
	cmpl	$3, %eax					# if eax is equal to 3
	je	.L21						# jump to 21
	cmpl	$4, %eax					# acc <- 4
	je	.L22						# jump to L20 if zf=0
	jmp	.L16						# jump to L16
.L20:								# Label L20
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	subl	$1, %eax					# eax <- eax-1
	cmpl	-20(%rbp), %eax					# if eax not equal to M[rbp-20]
	jne	.L23						# jump to L23 if not empty
	movq	-16(%rbp), %rsi					# rsi <- M[rbp-16]
	movl	-4(%rbp), %eax					# eax<- M[rbp-4]
	movl	$0, %ecx					# ecx <- 0
	movl	$2, %edx					# edx <- 2
	movl	%eax, %edi					# edi <- eax
	call	po						# call po function
	jmp	.L16						# jump to L16
.L23:								# label L23
	movq	-16(%rbp), %rax					# rax <- M[rbp-16]
	movl	-20(%rbp), %edx					# edx <- M[rbp-20]
	movslq	%edx, %rdx					# rdx <- edx sign extend, new_val_l
	movl	(%rax,%rdx,4), %eax				# eax <- M[rax+4*rdx]
	movl	%eax, %esi					# esi <- eax
	movl	$.LC4, %edi					# edi <- LC4
	movl	$0, %eax					# eax <- 0
	call	printf						# call of printf function
	movl	-20(%rbp), %eax					# eax <- M[rbp-20]
	leal	1(%rax), %edx					#
	movq	-16(%rbp), %rsi					# rsi <- M[rbp-16]
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	movl	%edx, %ecx					# ecx <- edx
	movl	$1, %edx					# edx <- 1
	movl	%eax, %edi					# edi <- eax
	call	po						# call po function
	jmp	.L16						# jump to L16
.L18:								# Label L18
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	subl	$1, %eax					# eax <- eax-1
	cmpl	-20(%rbp), %eax					# if eax not equal to M[rbp-20]
	jne	.L25						# jump to L25 if zf not empty
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	leal	-1(%rax), %edx					
	movq	-16(%rbp), %rsi					# rsi <- M[rbp-16]
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	movl	%edx, %ecx					# ecx <- edx
	movl	$3, %edx					# edx <- 3
	movl	%eax, %edi					# edi <- eax
	call	po						# call to po
	jmp	.L16						# jump L16
.L25:								# Label L25
	movl	-20(%rbp), %eax					# eax <- M[rbp-20]
	movslq	%eax, %rdx					# rdx <- eax
	movq	%rdx, %rax					# rax <- rdx
	salq	$2, %rax					# rax <-- 4*rax =>(4*i)
	addq	%rdx, %rax					# rax <- rax+rdx
	salq	$4, %rax					# rax <- 16*rax
	movq	%rax, %rdx					# rdx <- rax
	movq	-16(%rbp), %rax					# rax <- M[rbp-16]
	addq	%rax, %rdx					# rdx <- rdx+rax
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	subl	$1, %eax					# eax <- eax-1
	cltq							# promotes an int to an int64. shl 3, %rax makes an offset to a 64-bit pointer 
	movl	(%rdx,%rax,4), %eax				# eax <- M[rdx+4*rax]
	movl	%eax, %esi					# esi <- eax
	movl	$.LC4, %edi					# edi <- M[LC4]
	movl	$0, %eax					# eax <- 0
	call	printf						# call printf function
	movl	-20(%rbp), %eax					# eax <- M[rbp-20]
	leal	1(%rax), %edx					
	movq	-16(%rbp), %rsi					# rsi<- M[rbp-16]
	movl	-4(%rbp), %eax					# eax<- M[rbp-4]
	movl	%edx, %ecx					# ecx <- edx
	movl	$2, %edx					# edx <- 2
	movl	%eax, %edi					# edi <- eax
	call	po						# call po function
	jmp	.L16						# jump to L16
.L21:								# Label L21
	cmpl	$0, -20(%rbp)					# if M[rbp-20] is not equal to 0 X
	jne	.L27						# jump L27 if zf not empty
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	leal	-1(%rax), %edx					
	movq	-16(%rbp), %rsi					# rsi <- M[rbp-16]
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	movl	%edx, %ecx				# ecx <- edx
	movl	$4, %edx					# edx <- 4
	movl	%eax, %edi					# edi <- eax
	call	po						# function call po
	jmp	.L16						# jump to label L16
.L27:								# Label L27
	movl	-4(%rbp), %eax					# eax <- M [rbp-4]
	movslq	%eax, %rdx					# rdx <- edx  sign extend
	movq	%rdx, %rax					# rax <- rdx
	salq	$2, %rax					# rax <- rax*4
	addq	%rdx, %rax					# rax <- rax+rdx
	salq	$4, %rax					# rax <- rax*16
	leaq	-80(%rax), %rdx					#
	movq	-16(%rbp), %rax					# rax <- M[rbp-16]
	addq	%rax, %rdx					# rdx <- rdx+rax
	movl	-20(%rbp), %eax					# eax <- M[rbp-20]
	cltq							#
	movl	(%rdx,%rax,4), %eax				# eax <- M[rdx+rax*4]
	movl	%eax, %esi					# esi <- eax
	movl	$.LC4, %edi					# edi <- val from LC4
	movl	$0, %eax					# eax <- 0
	call	printf						# call function printf
	movl	-20(%rbp), %eax					# eax <- M[rbp-20]
	leal	-1(%rax), %edx					
	movq	-16(%rbp), %rsi					# rsi <- M[rbp-16]
	movl	-4(%rbp), %eax					# eax <- M[rbp-4]
	movl	%edx, %ecx					# ecx <- edx
	movl	$3, %edx					# edx <- 3
	movl	%eax, %edi					# edi <- eax
	call	po						# function call to po
	jmp	.L16						# jump to L16
.L22:								# Label L22
	cmpl	$0, -20(%rbp)					# if M[rbp-20] if=s equal to 0
	je	.L30						# jump to L30
	movl	-20(%rbp), %eax					# ... So On
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	-20(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-16(%rbp), %rsi
	movl	-4(%rbp), %eax
	movl	%edx, %ecx
	movl	$4, %edx
	movl	%eax, %edi
	call	po
	nop
	jmp	.L16
.L30:
	nop
.L16:
	leave						# Copy the frame pointer to the stack pointer and release the stack space.
	.cfi_def_cfa 7, 8
	ret						# return to caller
	.cfi_endproc					# End CFI directives
.LFE2:
	.size	po, .-po
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
