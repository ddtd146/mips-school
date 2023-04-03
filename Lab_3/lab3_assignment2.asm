#Lab 3

.data 
	size:	.word 6
	A: 		.word 1, 2, 3, 4, 5, 6

.text 
	add 	$s5, $0, $0			#s5 -> sum = 0
	addi 	$s1, $0, 0			#s1 -> i = 0
	addi 	$s4, $0, 1			#s4 -> step
	la 		$s2, A				#A s2
	la 		$t0, size
	lw 		$s3, 0($t0)			#load size -> s3
loop:
	add 	$t1, $s1, $s1 
	add		$t1, $t1, $t1		
	add		$t1, $t1, $s2
	lw 		$t0, 0($t1)			#load value of A[i] in $t0
	add 	$s5, $s5, $t0		#sum = sum + Ai
	add 	$s1, $s1, $s4		#i = i + step
	bne 	$s1, $s3, loop		
out: 
	add 	$a0, $0, $s5
	li 		$v0, 1
	syscall
