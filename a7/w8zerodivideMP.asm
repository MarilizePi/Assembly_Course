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

	.data
string_last_name:		.asciiz "Last name: Pires\n"
string_id:			.asciiz "Student ID: 20309982\n"
	
	.text
	.globl main

main:
	# print_string syscall (my last name)
	la $a0, string_last_name   		
	li $v0, 4
	syscall
	
	# print_string syscall (my student id)
	la $a0, string_id
	li $v0, 4
	syscall			


	li $t1, 300
	li $t0, 0
	# Do $a0 = $t1 / $t0
	div $a0, $t1, $t0

	# Print result as an integer
	li $v0, 1     
	syscall 
	
   	# and exit
	li $v0, 10 
	syscall
