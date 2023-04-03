#Lab 3 
.data 
	space: 	.asciiz " "
	x: 		.word 1
	y:		.word 2
	z: 		.word 3
.text
load: 
	la 		$t0, x
	lw 		$t1, 0($t0)
	la 		$t0, y
	lw 		$t2, 0($t0)
	la 		$t0, z
	lw 		$t3, 0($t0)
start: 
	addi 	$s1, $0, 4				#i = 4
    addi 	$s2, $0, 3				#j = 3
	slt 	$t0, $s2, $s1			#j < i
	beq 	$t0, 1, else
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
	#lw 		$a0, 0($t0)
	li 		$v0, 4
	syscall
yo:	move 	$a0, $t2
	li 		$v0, 1
	syscall
	la 		$a0, space				
	#lw 		$a0, 0($t0)
	li 		$v0, 4
	syscall
zo:	move 	$a0, $t3
	li 		$v0, 1
	syscall
