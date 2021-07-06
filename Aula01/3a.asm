	.data
int: 	.asciiz "Inteiro: "
hex:	.asciiz "Hexadecimal: "
uint:	.asciiz "Unsigned Int: "
WS:	.asciiz "        "
OP:	.asciiz "y = 2x - 8    x=" 

	.text
	.globl main
main: 	la $a0, OP
	addi $v0, $0, 4
	syscall
	
	ori $v0,$0,5 	#
 	syscall 	# chamada ao syscall "read_int()"
 	or $t0,$0,$v0 	# $t0 = $v0 = valor lido do teclado
 			# (valor de x pretendido)
	ori $t2,$0,8 	# $t2 = 8
 	add $t1,$t0,$t0 # $t1 = $t0 + $t0 = x + x = 2 * x
 	sub $t1,$t1,$t2 # $t1 = $t1 + $t2 = y = 2 * x - 8
 			# ($t1 tem o valor calculado de y)
 	
 	
 	la $a0, int
	addi $v0, $0, 4
	syscall
	
 	or $a0,$0,$t1 	# $a0 = y
 	ori $v0,$0,1 	#
	syscall 	# chamada ao syscall "print_int10()"
	
	la $a0, WS
	addi $v0, $0, 4
	syscall
	
	la $a0, hex
	addi $v0, $0, 4
	syscall
	
	or $a0,$0,$t1 	# $a0 = y
	ori $v0, $0, 34
	syscall
	
	la $a0, WS
	addi $v0, $0, 4
	syscall
	
	la $a0, uint
	addi $v0, $0, 4
	syscall
	
	or $a0,$0,$t1 	# $a0 = y
	ori $v0, $0, 36
	syscall
 			#
 	jr $ra 		# fim do programa