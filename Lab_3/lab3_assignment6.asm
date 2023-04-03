.data 
	size:	.word 5
	A: 		.word 1, -2, 6, -15, -5

.text 
	add 	$s5, $0, $0			#s5 -> max = 0
	add 	$s1, $0, $0			#s1 -> i = 0
	addi 	$s4, $0, 1			#s4 -> step
	la 		$s2, A				#A s2
	la 		$t0, size
	lw 		$s3, 0($t0)			#load size -> s3
	add 	$t1, $0, $s2
loop:
	lw 		$t0, 0($t1)			#load value of A[i] in $t0
start:
	slt 	$t9, $0, $t0 		#(A[i] > 0) ? 1 : 0 
	bne 	$t9, $0, findmax	# if (A[i] > 0) branch to findmax
	sub 	$t0, $0, $t0		# $t0 -> absolute value of A[i]
findmax:
	slt 	$t9, $t0, $s5		# $t9 = (A[i] < max) ? 1 : 0 
	bne		$t9, $0, endif		# branch if A[i] < max
	add  	$s5, $0, $t0		#assign max = A[i]
endif: 
	add 	$s1, $s1, $s4		#i = i + step
	add 	$t1, $s1, $s1 
	add		$t1, $t1, $t1		
	add		$t1, $t1, $s2
	bne 	$s1, $s3, loop		

out: 
	add $a0, $0, $s5
	li $v0, 1
	syscall
	
