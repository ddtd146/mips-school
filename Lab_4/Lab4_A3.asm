.text
		#li 	$s1, 0x80001234
		#abs $s0, $s1
	#sra 	$at, $s1, 31
	#xor 	$s0, $s1, $at
	#subu 	$s0, $s0, $at
		#move $s0, $s1
	#addu 	$s0, $0, $s1
	
		#not 	$s0, $s0
		
	#nor 	$s0, $s0, $0
	
		#ble $s1, $s2, L
	#slt $at, $s2, $s1
	#beq $at $0, L
L:
	li $s1, 0x80000000
	subu $s0, $0, $s1
