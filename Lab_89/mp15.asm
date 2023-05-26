.data
	msgInpNum: .asciiz "Number of elements: "
	msgInpElm: .asciiz "Input elms: \n"
	msgOut: .asciiz "Number of moves needed: "
	msgExcep1: .asciiz "The size of array cant be less than 1"
.text
main:
	nop
	jal INPUT		  #call INPUT
	nop
	add $a0, $s0, $0 #pass base_address into function
	add $a1, $s1, $1 #pass size of array into function
	nop
	jal ArrayChange #call ArrayChange
	nop
	li $v0, 4		
	la $a0, msgOut	
	syscall		
	add $a0, $0, $v1 #move result to $a0
	li $v0, 1		
	syscall			  #print result
exit:
	li $v0, 10 		
	syscall
end_main:
#---------------------------------------
# procedure INPUT, to read an array from stdin
# param[in] none 
# return $s0 base_address of the array 
#        $s1 number of elms in the array	
#---------------------------------------
INPUT:
	li $v0, 4
	la $a0, msgInpNum
	syscall				
	li $v0, 5
	syscall	
	add $s1, $v0, $0  #$s1 -> number of elms 	
	blt $0, $s1, noException #if n <= 0 catch excep
	li $v0, 4
	la $a0, msgExcep1 
	syscall
	j exit
noException:
	add $t0, $s1, $s1 #$t0 = 2*$s1
	add $t0, $t0, $t0 #$t0 = 4*$s1
	sub $sp, $sp, $t0 #init array space in stack segment
	
	add $s0, $sp, $0  #$s0 -> base_address of array	
	addi $t1, $0, 0	   #step var i = 0 -> $t1
	add $t0, $s0, $0  #current address($t0) = base_address($s0)
	li $v0, 4
	la $a0, msgInpElm
	syscall 
inp_elm: 
	addi $t1, $t1, 1			# $t1 -> index initialized = 1
	blt $s1, $t1, after_input #if index i > n then exit loop
	li $v0, 5                 #read elm from stdin
	syscall 
	sw $v0, 0($t0)	  #store input value to current position 
	addi $t0, $t0, 4 #increment 4 byte to advance to address of next elm
	j inp_elm
after_input: 
	nop
	jr $ra
	nop	
#----------------------------
#Function: ArrayChange, to count how many moves needed to obtain a strictly increasing sequence
#param[in] $a0 base_address of array
#          $a1 array 's size
#return    $v1 number of moves needed 
#----------------------------
ArrayChange:
init:
	addi $t0, $a0, 4 	# current address($t0) = base_address($a0) + 4 -> skip first elm
	addi $t1, $0, 1  	# index ($t1) = 1 -> skip first elm
	addi $t2, $0, 0  	# moves ($t2) = 0
	lw $t3, 0($a0)		# $t3 save A[i-1] value after update from previous loop while considering A[i]
loop:
	addi $t1, $t1, 1   			#inc index by 1
	blt $s1, $t1, after_loop  	#if size < index then exit loop
	lw $t4, 0($t0) 				#load current elm A[i]
	addi $t0, $t0, 4          	#advance to next elm 's address
	blt $t3, $t4, alrInc 		#if A[i]($t4) > updated A[i-1]($t3) then no need to moves
	addi $t3, $t3, 1			#update $t3
	sub $t4, $t3, $t4			#calculate moves needed = updated A[i-1] + 1 - A[i]
	add $t2, $t2, $t4			#update moves
	j loop
alrInc: 
	add $t3, $0, $t4			#$t3 = updated A[i]
	j loop
after_loop:
	add $v1, $0, $t2			#move result to return register
	nop			
	jr $ra				
	nop