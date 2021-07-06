	.data
nl:	.byte  0xA
	.text
	.globl main

main: 	li $t0, 0x862A5C1B
	
	sll $t2, $t0, 4
	srl $t3, $t0, 4
	sra $t4, $t0, 4
	
	add $a0, $0, $t2
	li $v0, 34
	syscall
	
	la $a0, nl
	lb $a0, 0($a0)
	li $v0, 11
	syscall
	
	add $a0, $0, $t3
	li $v0, 34
	syscall
	
	addi $a0, $0, 10
	li $v0, 11
	syscall
	
	add $a0, $0, $t4
	li $v0, 34
	syscall
	
	jr $ra
		
