.text
init:
	addi $s0, $0, 5 	# so ban dau
	addi $s1, $0, 3		# luy thua n cua 2
	add  $s2, $0, $0 	# bien chay i
loop: add  $s0, $s0, $s0 # nhan 2 $s0 va gan vao $s0
	addi $s2, $s2, 1	# tang bien dem
	slt  $t0, $s2, $s1 # (i < n) ? 1 : 0
	beq  $t0, 1, loop  # if (i < n) loop