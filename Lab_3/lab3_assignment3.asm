#Lab 3 
#switch

.data
	test: 	.word 2
.text
	la 		$t0, test
	lw 		$s0, 0($t0)		#test s0
	addi 	$s2, $0, 2		# a = 2
	addi 	$s3, $0, 3		# b = 3
	add 	$t0, $0, $0
	addi 	$t1, $0, 1
	addi 	$t2, $0, 2
	beq 	$s0, $t0, case_0
	beq 	$s0, $t1, case_1
	beq 	$s0, $t2, case_2
	j 		default
case_0:
	addi	$s2, $s2, 1		#a = a + 1 s1
	j 		continue
case_1:
	subi	$s2, $s2, 1		#a = a - 1 s1
	j 		continue
case_2: 
	add		$s3, $s3, $s3	#b = b * 2 s2
	j 		continue
default:
continue:
	add 	$a0, $0, $s1
	li 		$v0, 1
	syscall
	