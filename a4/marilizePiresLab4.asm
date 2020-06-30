# CS10 Lab 4
# Program to demonstrate basic sum of odd numbers input by the user.
# Development Environment:  MARS MIPS Simulator
# Name:  Marilize Pires
# Solution File: marilizePiresLab4.asm
# Date:  05/12/20
# Registers Used:
# $t0 : contains user input
# $t1 : contains initial value of 1
# $a0 : contains string or number to be printed
# $v0 : holds addr sycalls

	.data

my_name:	.asciiz "Name: Marilize Pires \n"
my_student_id:	.asciiz "Student ID: 20309982 \n"
prompt:		.asciiz	"Enter top value: "
result:		.asciiz	"The sum is: "


	.text

main:
	# Load the address of name_msg into $a0
	la $a0, my_name
	# Prints_string 
	li $v0, 4
	syscall

	la $a0, my_student_id
	li $v0, 4
	syscall

	# Perform the print_string
	li $v0, 4
	#  Using the prompt
	la $a0, prompt
	syscall

	# Use read_int to read in a number into $v0
	li $v0, 5     	
	syscall
	# Copy the prompt into $t0
	move $t0, $v0

	# Begin at 1
	li $t1, 1
	move $a0, $t1

	# Initialize
	add $a0, $zero, $zero

top_of_loop:
	# End loop if the limit is exceeded
	bgt $t1, $t0, end_of_loop	
	# Add odd numbers
	add $a0, $a0, $t1
	add $t1, $t1, 2	
	# back to loop
	b top_of_loop

end_of_loop:	
	# exit
	li $v0, 1
	syscall
	# exit syscall
	li $v0, 10
	syscall	