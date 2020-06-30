# CS10 Lab 7
# Program which causes an exception.
# Write a program that handles exceptions. Ex. divide by 0.
# Development Environment:  MARS MIPS Simulator
# Name:  Marilize Pires
# Solution File: marilizePiresLab7.asm
# Date:  06/09/20
# Registers Used (marilizePiresLab7.asm):
# $a0 : contains string to be printed.
# $v0: holds addr sycalls.
# $k0: Temporary register.
	
		
	.kdata
	
instruction_adress: .asciiz "\nException caused by the instruction at Address: " 
exception_code:	.asciiz "\nException code:  " 
ignore_message:	.asciiz "\nIgnore and continue program ..."

			
# Variables for save/restore of registers used in the handler
s1:	.word 0
s2:	.word 0
	.ktext 0x80000180
	
	#  Can't trust $sp
	sw $v0 s1
	# Save to static var
	sw $a0 s2
	
	################## Message 1 ###################
	
	#  print_str
	li $v0 4
	la $a0 instruction_adress
	syscall
		
	# Syscall 34
	li $v0 34
	# Get Cause register
	mfc0 $k0 $14
	# Extract ExcCode Field
	srl $a0 $k0 2
	andi $a0 $a0 0xf
	syscall
	
	################## Message 2 ###################
	
	# print_str
	li $v0 4
	la $a0 exception_code
	syscall
	
	
	li $v0 1
	mfc0 $k0 $13
	srl $a0 $k0 2
	andi $a0 $a0 0xf
	syscall

	############################################
	
	bne $k0 0x18 ok_pc
	nop

	# EPC
	mfc0 $a0 $14            
	andi $a0 $a0 0x3
	beq $a0 0 ok_pc
	nop

	# Exit
	li $v0 10
	syscall

ok_pc:

        # syscall 4
	li $v0 4
	la $a0 ignore_message
	syscall

        # Extract ExcCode Field
	srl $a0 $k0 2
	andi $a0 $a0 0xf
	# 0 means exception was an interrupt
	bne $a0 0 return 
	nop

return:

       # Get EPC register value
	mfc0 $k0 $14
	# Skip faulting instruction
	addiu $k0 $k0 4
	# Reset the EPC register
	mtc0 $k0 $14


         # Restore $v0 and $a0
	lw $v0 s1
	lw $a0 s2
	mtc0 $0 $13
	mtc0 $k0 $12
	# Return from exception on MIPS32
	eret