.data 
	str: .space 21
.text
init:
	li  $s0, -1  #s0 = i = -1
	la  $s1, str    #s1 -> str
inp: 
	li $v0, 12 #read character
	syscall
	addi $s0, $s0, 1 #i = i + 1
	beq $v0, 10, out #out if meets \n character
	add $s2, $s1, $s0 #s2 -> address of str[i]
	sb 	$v0, 0($s2) 
	beq $s0, 20, out #out if length exceeds 20
	j inp
out:
	li $v0, 11
	add $s2, $s1, $s0
	lb $a0, 0($s2)   
	syscall
	subi $s0, $s0, 1
	bge $s0, $0, out
