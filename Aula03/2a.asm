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
	li $t2, 0
	li $t4, 4
	
	la $a0,str1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	add $t0, $0, $v0
	
	la $a0,str2
	li $v0, 4
	syscall
	
for:
	bge $t2, 32, endfor
	
	rem $t3, $t2, $t4
if4:	
	bne $t3, $0, endif4
	
	li $a0, ' '
	li $v0, 11
	syscall
endif4:
	andi $t1, $t0, 0x80000000
if:	
	bne $t1, $0, else
	
	li $a0, '0'
	li $v0, 11
	syscall
	
	j endif
else:	
	li $a0, '1'
	li $v0, 11
	syscall
endif:
	sll $t0, $t0, 1
	addi $t2, $t2, 1
	j for
endfor:	
	jr $ra