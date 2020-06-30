# CS10 Lab 8
# Avoid data hazards between registers by using no-ops instructions.
# Development Environment:  MARS MIPS Simulator
# Name:  Marilize Pires
# Solution File: marilizePiresLab8.asm
# Date:  06/16/20
	
		
	.data
string_last_name:	.asciiz "My last name: Pires\n"
string_id:		.asciiz "Student ID: 20309982\n"

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
	
	#In order for lw to start, there will need to happen 3 cycles after add (add + 2 nops). 
	#The same happens with xor, which needs 6 cycles after add starts.
	# That is why we need 2 no-ops after add and one nop after sub.
	add $3, $2, $3 # RAW hazard from add to lw without no-ops.
	nop
	nop
	lw $4, 100($3)
	sub $7, $6, $2
	#This nop is needed because, otherwise, the the ID of xor would endup in the same columns as the MEM of lw.
	nop
	xor $6, $4, $3
