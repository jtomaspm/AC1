	.data
str1:	.asciiz "Introduza 2 numeros: "	
str2:	.asciiz "Soma: "	
	.text
	.globl main
main:	
	la $a0, str1			#$a0 = adress(str1)
	li $v0, 4			#print_string
	syscall
	
	li $v0, 5			#read_int
	syscall
	add $t0, $0, $v0		#$t0 = n0
	
	li $v0, 5			#read_int
	syscall
	add $t1, $0, $v0		#$t1 = n1
	
	la $a0, str2			#$a0 = adress(str2)
	li $v0, 4			#print_string
	syscall

	add $t2, $t0, $t1		#$t2 = n1 + n0
	
	add $a0, $t2, $0
	li $v0, 1			#print_int10
	syscall					
		
	jr $ra				#end