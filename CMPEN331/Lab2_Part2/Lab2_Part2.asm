# CMPEN 331, Lab 2_part2

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# switch to the Data segment
	.data
	# global data is defined here

	# Don't forget the backslash-n (newline character)
Homework:
	.asciiz	"CMPEN 331 Homework 2\n"
Name_1:
	.asciiz	"Tyler "
Name_2:
	.asciiz "Korz\n"
 

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# switch to the Text segment
	.text
	# the program is defined here

	.globl	main
main:
	# Whose program is this?
	la	$a0, Homework
	jal	Print_string
	la	$a0, Name_1
	jal	Print_string
	la	$a0, Name_2
	jal	Print_string
	
	# int i, j = 2, n = 3;
	# for (i = 0; i <= 16; i++)
	#   {
	#      ... j = testcase[i]
	#      ... calculate n from j
	#      ... print i, j and n
	#   }
	
	# register assignments
	#  $s0   i
	#  $s1   j = testcase[i]
	#  $s2   n
	#  $t0   address of testcase[i]
	#  $a0   argument to Print_integer, Print_string, etc.
	#  add to this list if you use any other registers

	# initialization
	li	$s1, 2			# j = 2
	li	$s2, 3			# n = 3
	
	# for (i = 0; i <= 16; i++)
	li	$s0, 0			# i = 0
	la	$t0, testcase		# address of testcase[i]
	bgt	$s0, 16, bottom  
top:
	lw	$s1, 0($t0)		# j = testcase[i]
	# calculate n from j
	# Your part starts here
	
	blt $s1,0,case5
case1:
   bge $s1,0x80,case2
   li $t7,0xFFFFFF7F
   and $s2,$s1,$t7
   j ifElseEnd

case2:              
   bgt $s1,0X7FF,case3
   li $t7,0x3F
   and $t7,$t7,$s1 
   add $t7,$t7,0x80
   li $t6,0x7c0
   and $t6,$t6,$s1 
   sll $t6,$t6,2
   add $t6,$t6,0xc000
   add $s2,$t6,$t7
   j ifElseEnd

case3:
   bgt $s1,0xFFFF,case4
   li $t7,0x3F      
   and $t7,$t7,$s1
   add $t7,$t7,0x80 
   li $t6,0xFC0
   and $t6,$t6,$s1 
   sll $t6,$t6,2
   add $t6,$t6,0x8000  
   li $t5,0xF000   
   and $t5,$t5,$s1 
   sll $t5,$t5,4
   add $t5,$t5,0xE00000 
   add $s2,$t7,$t6
   add $s2,$s2,$t5 
   j ifElseEnd

case4:          
   bgt $s1,0x10FFFF,case5
   li $t7,0x3F     
   and $t7,$t7,$s1 
   add $t7,$t7,0x80
   li $t6,0xFC0
   and $t6,$t6,$s1 
   sll $t6,$t6,2
   add $t6,$t6,0x8000    
   li $t5,0x3F000   
   and $t5,$t5,$s1 
   sll $t5,$t5,4
   add $t5,$t5,0x800000 
   li $t4,0x1C0000 
   and $t4,$t4,$s1 
   sll $t4,$t4,6
   add $t4,$t4,0xF0000000 
   add $s2,$t7,$t6
   add $s2,$s2,$t5
   add $s2,$s2,$t4 
   j ifElseEnd

case5:            
    li $s2,-1
    
ifElseEnd:
	# Your part ends here
	
	# print i, j and n
	move	$a0, $s0	# i
	jal	Print_integer
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s1	# j
	jal	Print_hex
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s2	# n
	jal	Print_hex
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s1	# j
	jal	Print_bin
	la	$a0, sp		# space
	jal	Print_string
	move	$a0, $s2	# n
	jal	Print_bin
	la	$a0, nl		# newline
	jal	Print_string
	
	# for (i = 0; i <= 16; i++)
	addi	$s0, $s0, 1	# i++
	addi	$t0, $t0, 4	# address of testcase[i]
	ble	$s0, 16, top	# i <= 16
bottom:
	
	la	$a0, done	# mark the end of the program
	jal	Print_string
	
	jal	Exit0	# end the program, default return status

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

	.data
	# global data is defined here
sp:
	.asciiz	" "	# space
nl:
	.asciiz	"\n"	# newline
done:
	.asciiz	"All done!\n"

testcase:
	# UTF-8 representation is one byte
	.word 0x0000	# nul		# Basic Latin, 0000 - 007F
	.word 0x0024	# $ (dollar sign)
	.word 0x007E	# ~ (tilde)
	.word 0x007F	# del

	# UTF-8 representation is two bytes
	.word 0x0080	# pad		# Latin-1 Supplement, 0080 - 00FF
	.word 0x00A2	# cent sign
	.word 0x0627	# Arabic letter alef
	.word 0x07FF	# unassigned

	# UTF-8 representation is three bytes
	.word 0x0800
	.word 0x20AC	# Euro sign
	.word 0x2233	# anticlockwise contour integral sign
	.word 0xFFFF

	# UTF-8 representation is four bytes
	.word 0x10000
	.word 0x10348	# Hwair, see http://en.wikipedia.org/wiki/Hwair
	.word 0x22E13	# randomly-chosen character
	.word 0x10FFFF

	.word 0x89ABCDEF	# randomly chosen bogus value

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Wrapper functions around some of the system calls
# See P&H COD, Fig. A.9.1, for the complete list.

	.text

	.globl	Print_integer
Print_integer:	# print the integer in register $a0 (decimal)
	li	$v0, 1
	syscall
	jr	$ra

	.globl	Print_string
Print_string:	# print the string whose starting address is in register $a0
	li	$v0, 4
	syscall
	jr	$ra

	.globl	Exit
Exit:		# end the program, no explicit return status
	li	$v0, 10
	syscall
	jr	$ra	# this instruction is never executed

	.globl	Exit0
Exit0:		# end the program, default return status
	li	$a0, 0	# return status 0
	li	$v0, 17
	syscall
	jr	$ra	# this instruction is never executed

	.globl	Exit2
Exit2:		# end the program, with return status from register $a0
	li	$v0, 17
	syscall
	jr	$ra	# this instruction is never executed

# The following syscalls work on MARS, but not on QtSPIM

	.globl	Print_hex
Print_hex:	# print the integer in register $a0 (hexadecimal)
	li	$v0, 34
	syscall
	jr	$ra

	.globl	Print_bin
Print_bin:	# print the integer in register $a0 (binary)
	li	$v0, 35
	syscall
	jr	$ra

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
