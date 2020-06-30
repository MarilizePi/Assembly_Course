# CS10 Lab 2
# Program to demonstrate a basic hello world program as well as display other messages in MIPS.
# Development Environment:  MARS MIPS Simulator
# Name:  Marilize Pires
# Solution File: marilizePiresLab2.asm
# Date:  04/28/20
# Registers Used:
# $a0 : holds address of hello_msg, lastName, foothill_ID, syllabus_1, syllabus_2, syllabus_3
# $v0 : holds addr sycalls

	.data
hello_msg:	  .asciiz	"Hello World!\n"
lastName:	  .asciiz	"Pires\n"
foothill_ID:     .asciiz	"20309982\n"
syllabus_1:	  .asciiz	"One quiz with 10 questions every week\n"
syllabus_2:	  .asciiz	"One final exam worth 40 points\n"
syllabus_3:	  .asciiz	"One midterm worth 20 points\n"

	.text
main:				
   la $a0, hello_msg         # load the addr of hello_msg into $a0.
   li $v0, 4                 # 4 is the print_string syscall.
   syscall                   # do the syscall.
   
   la $a0, lastName          # load the addr of lastName into $a0.
   li $v0, 4                 # 4 is the print_string syscall.
   syscall                   # do the syscall.
   
   la $a0, foothill_ID       # load the addr of foothill_ID into $a0.
   li $v0, 4                 # 4 is the print_string syscall.
   syscall                   # do the syscall.
   
   la $a0, syllabus_1        # load the addr of syllabus_1 message into $a0.
   li $v0, 4                 # 4 is the print_string syscall.
   syscall                   # do the syscall.
   
   la $a0, syllabus_2        # load the addr of syllabus_2 message into $a0.
   li $v0, 4                 # 4 is the print_string syscall.
   syscall                   # do the syscall.
   
   la $a0, syllabus_3        # load the addr of syllabus_3 message into $a0.
   li $v0, 4                 # 4 is the print_string syscall.
   syscall                   # do the syscall.
  
   li $v0, 10                # 10 is the exit syscall.
   syscall                   # do the syscall

