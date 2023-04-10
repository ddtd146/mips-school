#test addu and add

.text

	addi	$s1, $0, 2147483646
	addi 	$s2, $0, 3
#	add 	$s3, $s1, $s2
	addu	$s4, $s1, $s2