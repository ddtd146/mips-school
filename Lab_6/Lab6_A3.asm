.data 
	A: .word 2, 3, 1
	Aend: .word
.text 
main: 
	la $a0, A		
	la $a1, Aend
	addi $a1, $a1, -4
	j bbsort
after_sort:
	li $v0, 10
	syscall
end_of_main:

bbsort:
	li $t0, 0 		  #so hoan doi trong vong lap 
	addi $t1, $a0, 0 #khoi tao bien chay i = 0 -> dau day
	j loop
after_loop:
	beq $t0, 0, after_sort #neu khong co swap nao trong vong lap tuc la cac so trong day deu duoc sap xep dung -> done
	j bbsort
loop:	
	beq $t1, $a1, after_loop # neu phan tu thu i la cuoi mang roi thi khong lap nua
	lw 	$t2, 0($t1)	   #load phan tu thu i
	lw  $t3, 4($t1)   #load phan tu thu i+1  
	ble $t2, $t3, no_swap # neu Ai <= Ai+1 thi khong can phai swap
	sw $t2, 4($t1)		#thuc hien swap
	sw $t3, 0($t1)		#thuc hien swap
	li $t0, 1			#gan $t0 = 1 -> co thuc hien phep swap
no_swap:
	addi $t1, $t1, 4	#tang bien dem i 
	j loop
	
	 
	
	

	
	
