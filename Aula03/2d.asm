# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i 
# $t3 - rem(i, 4)
# $t4 - 4
	.data
str1:	.asciiz "Introduza um nimero: "
str2:	.asciiz "\nO valor em binario e':\n"
	.text
	.globl main
main:
	li $t2, 0				# i = 0
	li $t4, 4				# t4 = 4
	
	la $a0,str1				#print_string
	li $v0, 4
	syscall
	
	li $v0, 5				#read_int
	syscall
	add $t0, $0, $v0
	
	la $a0,str2				#print_string
	li $v0, 4
	syscall
	
for:
	bge $t2, 32, endfor			#for(i<32)
	
	rem $t3, $t2, $t4
if4:	
	bne $t3, $0, endif4			#print ' ' every 4 chars
	
	li $a0, ' '
	li $v0, 11
	syscall
endif4:
	andi $t1, $t0, 0x80000000		#bit = value & 0x80000000
	
	srl $t1, $t1, 31			#bit >> 31
	
	addi $a0, $t1, 0x30			#print_char
	li $v0, 11
	syscall 
	
	sll $t0, $t0, 1				#value = value << 1; 
	addi $t2, $t2, 1			#i++
	j for
endfor:	
	jr $ra