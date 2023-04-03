#Lab 3 
.data 
	space: 	.asciiz " "
.text
load: 
	addi 	$t1, $0, 1			# x			
	addi 	$t2, $0, 2			# y
	addi 	$t3, $0, 3 			# z
    addi 	$s1, $0, -4			# i
    addi 	$s2, $0, 3			# j
start:
		#i < j
	#slt 	$t0, $s1, $s2
	#beq 	$t0, $0, else
		#i >= j
	#slt 	$t0, $s1, $s2 
	#bne    $t0, $0, else
		#i+j <= 0
	#add $t0, $s1, $s2				# i+j
	#slt $t0, $0, $t0				# i + j > 0
	#bne $t0, $0, else				# branch if i + j > 0
		#i+j > m+n
	addi $s3, $0, 1				# m
	addi $s4, $0, 2				# n
	add $t0, $s1, $s2				# i + j t0
	add $t9, $s3, $s4				# m + n t9
	slt $t0, $t9, $t0
	beq $t0, $0, else
	addi 	$t1, $t1 , 1			#x = x + 1
	add 	$t3, $0, 1				#z = 1
	
	j 		endif					
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
