#Lab 3 
.data 
	space: 	.asciiz " "
.text
load: 
	addi 	$t1, $0, 1			# x			
	addi 	$t2, $0, 2			# y
	addi 	$t3, $0, 3 			# z
    addi 	$s1, $0, 4			# i
    addi 	$s2, $0, 2			# j
start: 
	slt 	$t0, $s2, $s1			
	bne 	$t0, $0, else
	addi 	$t1, $t1 , 1			#x = x + 1
	add 	$t3, $0, 1
	j 		endif					#z = 1
else:
	sub 	$t2, $t2, 1				#y = y - 1
	mul 	$t3, $t3, 2				#z = z * 2
endif:

xo:	move 	$a0, $t1
	li 		$v0, 1
	syscall
	la 		$a0, space				
	li 		$v0, 4
	syscall
yo:	move 	$a0, $t2
	li 		$v0, 1
	syscall
	la 		$a0, space				
	li 		$v0, 4
	syscall
zo:	move 	$a0, $t3
	li 		$v0, 1
	syscall
