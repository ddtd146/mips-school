.data
	large: .asciiz "Largest:  " 
	enter: .asciiz "\n"
	colon: .asciiz ", "
	small: .asciiz "Smallest: " 
.text
	li $v0, 4
	la $a0, large 
	syscall 
main: 
	li, $s0, 4 	#init value
	li, $s1, 3
	li, $s2, 5
	li, $s3, 2
	li, $s4, -5
	li, $s5, 6
	li, $s6, -10
	li, $s7, 12
	jal mam 		#call max and min procedure
	nop 
print:
	li $v0, 1 
	syscall		#print largest number
	li $v0, 4  
	la $a0, colon
	syscall		#colon	
	li $v0, 1
	addi $a0, $a1, 0
	syscall		#print position of the largest one
	li $v0, 4
	la $a0, enter
	syscall		#print enter
	li $v0, 4
	la $a0, small
	syscall		#print smallest text
	li $v0, 1
	addi $a0, $a2, 0
	syscall		#print smallest number
	li $v0, 4
	la $a0, colon
	syscall		#print colon
	li $v0, 1
	addi $a0, $a3, 0
	syscall		#print position of smallest one
	li $v0, 10
	syscall		#exit
main_end:
mam: 
	addi $sp, $sp, -32
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	addi $s0, $sp, 0 #base pointer
	li $s1, 0		  #index 
	lw $a0, 0($s0)	  #max = s0	
	li $a1, 0		  #pos_max = 0	
	lw $a2, 0($s0)	  #min = s0	 
	li $a3, 0        #pos_min = 0
loop: 	 
	addi $s0, $s0, 4	#base point to next elm
	addi $s1, $s1, 1 #i = i + 1
	slti $t0, $s1, 8 #t0 = 1 if i < 8
	beq $t0, 0, after_loop #out loop if i >= 8
	lw $t1, 0($s0) #load current elm to t1
	slt $t0, $a0, $t1 #t0 = 1 if max < current elm 
	beq $t0, 0, find_min #no update if max >= cur elm
	add $a0, $t1, $0	#update max
	add $a1, $s1, $0	#update pos_max
find_min:
	slt $t0, $a2, $t1 #t0 = 1 if min < cur elm
	beq $t0, 1, loop #no update if min < cur
	add $a2, $t1, $0 #update min
	add $a3, $s1, $0 #update pos_min
	j loop	#j to loop
after_loop:
	addi $sp, $sp, 32	#restore sp 
	jr $ra #j to $ra
mam_end:
