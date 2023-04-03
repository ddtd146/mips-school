.data 
	size:	.word 5
	A: 		.word 0, 0, 0, 4, 5

.text 
	add 	$s5, $0, $0			#s5 -> sum = 0
	add 	$s1, $0, $0			#s1 -> i = 0
	addi 	$s4, $0, 1			#s4 -> step
	la 		$s2, A				#A s2
	la 		$t0, size
	lw 		$s3, 0($t0)			#load size -> s3
	add 	$t1, $0, $s2
loop:
	add 	$t1, $s1, $s1 
	add		$t1, $t1, $t1		
	add		$t1, $t1, $s2
	lw 		$t0, 0($t1)			#load value of A[i] in $t0
	add 	$s5, $s5, $t0		#sum = sum + Ai
	add 	$s1, $s1, $s4		#i = i + step
		# i < n
	#slt 	$t9, $s1, $s3		# (i < size) ? 1 : 0
	#bne 	$t9, $0, loop	
		# i <= n
	#slt 	$t9, $s3, $s1 		# (size < i) ? 1 : 0
	#beq		$t9, $0, loop		
		# sum >= 0 
	#slt 	$t9, $s5, $0			# (sum < 0) ? 1 : 0
	#beq 	$t9, $0, loop
		 #A[i] == 0
	#beq		$t0, $0, loop
