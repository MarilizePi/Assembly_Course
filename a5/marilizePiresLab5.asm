# CS10 Lab 5
# Program to calculate basic average of two numbers by using
# stacks.
# Development Environment:  MARS MIPS Simulator
# Name:  Marilize Pires
# Solution File: marilizePiresLab5.asm
# Date:  05/26/20
# Registers Used:
# $t0 : Holds average of 2 numbers
# $t1: Holds sum of 2 numbers
# $t7: Holds the average out of the stack
# $s0: Holds the value of number 12
# $s1: Holds the value of number 16
# $a0 : contains string to be printed
# $v0 : holds addr sycalls
# $sp: Register with stack pointer
# $ra: Return address
	
		
	.data
string_name:	.asciiz "Student name: Marilize Pires\n"
string_id:	.asciiz "Student ID: 20309982\n"

	.text
main:	
	# print_string syscall (my name)
	la $a0, string_name
	li $v0, 4           		
	syscall
	
	# print_string syscall (my student id)
	la $a0, string_id
	li $v0, 4
	syscall

	# load num = 12 into s0
	li $s0, 12
	# load num = 16 into s1
	li $s1, 16
	# calculate sum and take average of s0 and s1
	li $s2, 2
	
	# creates space in stack frame
	sub $sp, $sp, 8
	# pushing parameters into stack
	sw $s0, 0($sp)
	sw $s1, 4($sp)
		
	# Calls the function average	
	jal mp_avg
	
	# Saves average value into $t7
	lw $t7, 0($sp)
	# Deletes memory from stack
	addi $sp, $sp, 4
	
	add $a0, $t7, $zero		
	li $v0, 1
	syscall

	# exit
	li $v0, 10
	syscall


mp_avg:
	# pass arguments
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	# creating room in stack
	addi $sp, $sp, 8
	
	# keeps sum of 12 and 16 in $t1
	add $t1, $s1, $s0
	# stores $t1 divided by 2 into $t0 (calculates average)
	div $t0, $t1, $s2
	
	# Saves $t0 into the stack
	sw $t0, 0($sp)
	
	# Overwrites last number of student id (20309982)
	li $t0, 2
	# Exits the function
	jr $ra
