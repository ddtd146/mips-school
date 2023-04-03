#Lab 3
#Loop

.data 
	size:	.word 5
	A: 		.word 1, 2, 3, 4, 5

.text 
	add 	$s0, $0, $0			#sum = 0, s0
	la 		$t0, A				#A t0
	add 	$t2, $0, $0			#i = 0 t2
	la 		$t9, size
	lw 		$t1, 0($t9)			#size = 5 t1
loop:
	slt 	$t9, $t1, $t2
	beq 	$t9, 1, endloop
	lw 		$t3, 0($t0)			#Ai t3
	add		$s0, $s0, $t3
	addi 	$t0, $t0, 4
	addi 	$t2, $t2, 1	
	j 		loop
endloop:
	add $a0, $0, $s0
	li $v0, 1
	syscall
