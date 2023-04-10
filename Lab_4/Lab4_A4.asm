#Laboratory Exercise 4, Assignment 4
.text
init:
	addi 	$s1, $0, -2147483647
	addi	$s2, $0, -2
start:
	li 		$t0,0 			#No Overflow is default status
	addu 	$s3,$s1,$s2 	# s3 = s1 + s2
	xor 	$t1,$s1,$s2		#Test if $s1 and $s2 have the same sign
	bltz 	$t1,EXIT 		#If not, exit
	xor 	$t1, $s1, $s3	#Test if $s1 and $s3 have the same sign 
	bgez 	$t1, EXIT		#If true, exit
OVERFLOW:
	 li 	$t0,1 			#the result is overflow
EXIT:
