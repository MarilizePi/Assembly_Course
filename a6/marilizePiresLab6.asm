# CS10 Lab 6
# Program to loop through the sum of
# (1*2)+(2*3)+(3x4)+...+(20*21). Use the 
# designated register to fetch the 32-bit 
# product result. Then, print the final result.
# Development Environment:  MARS MIPS Simulator
# Name:  Marilize Pires
# Solution File: marilizePiresLab6.asm
# Date:  06/02/20
# Registers Used:
# $t1: Holds the result sum.
# $s0: Makes sure the loop doesn't go beyong 20.
# $s1: Holds value 1.
# $s2: Used to increment by 1.
# $s3: Holds value of 2.
# $s4: Stores the produc of two numbers.
# $a0 : contains string to be printed.
# $v0: holds addr sycalls.
	
		
	.data
	
string_last_name:		.asciiz "Last name: Pires\n"
string_id:			.asciiz "Student ID: 20309982\n"
	.text

main:
	# print_string syscall (my last name)
	la $a0, string_last_name   		
	li $v0, 4
	syscall
	
	# print_string syscall (my student id)
	la $a0, string_id
	li $v0, 4
	syscall				
	
	# end of loop equal or less than 20
	li $s0, 20
	# Set $s2 as the value 1
	li $s1, 1
	# Set $s3 as the value 2
	li $s3, 2
	
loop:
 	#Break loop if $s3 is greater than 21
 	bgt $s1, $s0, exit_loop
 	
 	# $s2 * $s3
 	mult $s1, $s3
 	# Stores the result of $s2 * $s3 into $s4
	mflo $s4
	# $t1 = $t1 + $s4
	add $t1, $t1, $s4
	
	# Increment by 1
	addi $s1, $s1, 1
	addi $s3, $s3, 1

	# Loop back to start
	b loop
 

exit_loop:
	move $a0, $t1
	li $v0, 1
	syscall
	
	# exit syscall
	li $v0, 10
	syscall
