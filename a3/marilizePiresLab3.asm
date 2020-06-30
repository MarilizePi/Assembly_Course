# CS10 Lab 3
# Program to demonstrate basic arithmetic in MIPS.
# Development Environment:  MARS MIPS Simulator
# Name:  Marilize Pires
# Solution File: marilizePiresLab3.asm
# Date:  05/05/20
# Registers Used:
# $s0 : holds myID
# $s1 : holds nLet
# $t6 : holds branch result
# $t0 : holds exp1_sum
# $t1 : holds exp2_sub
# $t3 : holds exp3_mult
# $t4 : holds exp4_div
# $a0 : contains string or number to be printed
# $v0 : holds addr sycalls
	
	.data

myID: .word 33		#Sum of numbers in my Student ID
nLet: .word 5		#Number of Letters in my Last Name

myLastName:		.asciiz "My family name is: Pires \n"
myStudentID:		.asciiz "My Student ID: 20309982 \n"
numLastName:		.asciiz "The number of characters in my last name is: 5 \n"
sumStudID:		.asciiz "The value of myId is: 33 \n"

exp1_sum:		.asciiz "\n nLet + myID = "
exp2_sub:		.asciiz "\n nLet - myID = "
exp3_mult:		.asciiz "\n nLet * 4 = "
exp4_div:		.asciiz "\n (myID + nLet) / 2 = "
divide_odd:		.asciiz "\n (nLet + myID) is odd. (nLet + myID) + 1 = "


	.text
main:		
	li $v0, 4		# Print myLastName to console					
	la $a0, myLastName	# Load myLastName into register $a0
	syscall 
 
	li $v0, 4		# Print myStudentID to console					
	la $a0, myStudentID	# Load myStudentID into register $a0
	syscall
	
	li $v0, 4		# Print numberOfLastNameChar to console					
	la $a0, numLastName	# Load numberOfLastNameChar into register $a0
	syscall
  
	li $v0, 4		# Print sumOfStudentID to console					
	la $a0, sumStudID	# Load sumOfStudentID into register $a0
	syscall
	
	
	lw $s0, myID		# $s0 = myID
	lw $s1, nLet		# $s0 = nLet
	
  
	#***** OPERATIONS *****
	add $t0, $s0, $s1	#t0 = myId + nLet = 38
	sub $t1, $s1, $s0	#t1 = nLet - myID = -28
	mulo $t3, $s1 4		#t3 = nLet * 4 = 20
	div  $t4, $t0 2		#t0 / 2 = t4
	
	
	#***** ADDITION *****
	li $v0, 4		# Print (nLet + myID) to console					
	la $a0, exp1_sum	# Load the exp1_sum adition into $a0
	syscall	
			
	move  $a0, $t0		# Now print out the result
	li    $v0, 1		# 1 means the print_int syscall
	syscall
  
  
	#***** SUBTRACTION *****
	li $v0, 4		# Now print out the result					
	la $a0, exp2_sub	# Load the exp2_sub into $a0
	syscall
  
	move  $a0, $t1		# Now print out the result
	li    $v0, 1		# 1 means the print_int syscall
	syscall
  
	#***** MULTIPLICATION *****
	li $v0, 4		# Print multiplication to console					
	la $a0, exp3_mult	# Load exp3_mult into $a0
	syscall
  
	move  $a0, $t3		# Now print out the result
	li    $v0, 1		# 1 means the print_int syscall
	syscall
  
	#***** EVEN/0DD TEST *****									
	andi $t6, $t0, 1
	bne $t6, $zero, odd
	j even 

	odd:
	
	addi $t0, $t0, 1	# (nLet + myId) + 1
	la $a0, divide_odd
	li $v0, 4
	syscall

	move $a0, $t0		# Now print out the result
	li $v0, 1		# 1 means the print_int syscall
	syscall

	#***** PRINT EVEN RESULT *****	

	even:
	
	srl $t4, $t0, 1
	la $a0, exp4_div	# (nLet + myId) / 2
	li $v0, 4
	syscall

	move $a0, $t4		# Now print out the result
	li $v0, 1		# 1 means the print_int syscall
	syscall


	li $v0, 10		# exit
	syscall
