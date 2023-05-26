.data
	A: .word 2, 1, 5, 6, 3
	Aend: .word 
.text
main:
	la $a0, A
	la $a1, Aend
	addi $a1, $a1, -4
	addi $t0, $a0, 0 #khoi tao dia chi chay la base
	j isort
after_sort:
	li $v0, 10
	syscall
end_of_main:

isort: 
	addi $t0, $t0, 4 	#i = i + 1
	addi $t1, $t0, 0	#j = i 
	bgt  $t0, $a1, after_sort #neu i = n thi dung lai 
loop:
	beq $t1, $a0, isort #neu j = 0 -> thi dung vong lap trong va chuyen sang vong lap i 
	lw $t2, 0($t1)		#load Aj
	lw $t3, -4($t1)		#load Aj-1
	ble $t3, $t2, no_swap
	sw $t2, -4($t1)    #swap
	sw $t3, 0($t1)		#swap
no_swap:
	addi $t1, $t1, -4  # j = j-1
	j loop
