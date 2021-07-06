	.data
frase:	.asciiz "Hello World"
	.globl main
	.text
	
main:	la $a0, frase
	addi $v0, $0, 4
	syscall
	
	jr $ra
	