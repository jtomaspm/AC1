	.data
	.eqv bin, 5
	.text
	.globl main
main:	
	li $t0 , bin	#$t0 = bin
	srl $t2, $t0, 1
	xor $t1,$t0, $t2
	
	add $a0, $0, $t1	#load grey into $a0
	li $v0, 35		#print_bin
	syscall
	
	jr $ra