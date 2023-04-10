#Laboratory Exercise 4, Assignment 2
.text
	li 		$s0, 0x12340563 		#load $s0
	andi 	$t0, $s0, 0xff000000	#Extract the MSB of $s0
	andi	$t1, $s0, 0xffffff00	#Clear LSB of $s0
	li 		$s0, 0x131578			#Load $s0
	ori		$t2, $s0, 0xff			#Set LSB of $s0
	andi 	$t3, $s0, 0x0			#Clear $s0
