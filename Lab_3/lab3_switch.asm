#Lab 3 
#switch

.data
	test: 	.word 1
.text
	la 		$t0, test
	lw 		$s0, 0($t0)		#test s0
	add 	$t0, $0, $0
	addi 	$t1, $0, 2
	addi 	$t2, $0, 3
	beq 	$s0, $t0, case_0
	beq 	$s0, $t1, case_1
	beq 	$s0, $t2, case_2
	j 		default
case_0:
	addi	$s1, $s1, 1		#a = a + 1 s1
	j 		continue
case_1:
	subi	$s1, $s1, 1		#a = a - 1 s1
	j 		continue
case_2: 
	add		$s2, $s2, $s2	#b = b * 2 s2
	j 		continue
default:
continue:
	
