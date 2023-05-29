.data
	msgInpNum: .asciiz "Number of elements: "
	msgInpElm: .asciiz "Input elms: \n"
	msgMax: .asciiz "Max elm in the array: " 
	msgInpRange: .asciiz "\nInput range (m, M): \n"
	msgCount: .asciiz "Number of elms in range (m,M): "
	msgExcep1: .asciiz "The size of array cant be less than 1"
	msgExcep2: .asciiz "Lower bound cannot be greater than upper bound"
.text
main: 
	nop
	jal INPUT		
	nop
	add $a0, $s0, $0 #pass base_address into function
	add $a1, $s1, $0 #pass number of elms into function
	nop
find_max:
	jal FIND_MAX
	nop
	li $v0, 4
	la $a0, msgMax
	syscall
	add $a0, $v1, $0 #prepare to print
	li $v0, 1		  
	syscall			  #print max elm		
	nop
input_range:
	li $v0, 4
	la $a0, msgInpRange
	syscall
	li $v0, 5
	syscall
	add $a2, $v0, $0 #pass lower_bound into function
	li $v0, 5
	syscall
	add $a3, $v0, $0 #pass upper_bound into function
	ble $a2, $a3, noExcep1
	li $v0, 4
	la $a0, msgExcep2 
	syscall
	j exit
noExcep1:
	add $a0, $s0, $0 #pass base_address into function
	add $a1, $s1, $0 #pass number of elms into function
count: 
	jal COUNT_IN_RANGE #call C_I_R function
	li $v0, 4
	la $a0, msgCount 
	syscall
	add $a0, $v1, $0
	li $v0, 1			#print number of elms in range (m, M)
	syscall
	nop
exit: 
	li $v0, 10
	syscall	
end_main: 
#---------------------------------------
# input procedure, to read an array from stdin
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
	addi $t1, $t1, 1
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
#---------------------------------------
# FIND_MAX function, to find max elm
# param[in] $a0 base_address of the array
#           $a1 number of elms in the array
# return    $v1 max elm 
#---------------------------------------
FIND_MAX: 
	addi $t0, $a0, 4 # $t0 -> base_address, +4 -> skipp first_lem
	addi $t1, $0, 1  # $t1 -> index, = 1 -> skip first_elm
	lw $t2, 0($a0)  #max($t2) = first_elm 
loop:	
	addi $t1, $t1, 1 #inc index
	blt $s1, $t1, after_loop #if index > n then exit_loop
	lw $t3, 0($t0)
	addi $t0, $t0, 4
	blt $t3, $t2, loop #if current elm < max lem then continue else update_max
update_max:
	add $t2, $0, $t3
	j loop
after_loop:
	add $v1, $t2, $0 #move max to return register
	nop
	jr $ra
	nop
#---------------------------------------
# COUNT_IN_RANGE function, to count number of elms in range (m, M)
# param[in] $a0 base_address of the array
#           $a1 number of elms in the array
#           $a2 lower_bound m 
#           $a3 upper_bound M
# return    $v1 number of elms in the array which in range (m, M) 
#---------------------------------------
COUNT_IN_RANGE:
	addi $t0, $a0, 0 #$t0 -> base_address of array
	addi $t1, $0, 0  #tt1 -> index  
	addi $t2, $0, 0 #$t2 -> counter, initialized = 0
loop1: 
	addi $t1, $t1, 1 #inc index
	blt $s1, $t1, after_loop #if index > n then exit loop
	lw $t3, 0($t0) #load current elm -> $t3
	addi $t0, $t0, 4 #advance to address of next elm
	slt $t8, $a3, $t3 # $t8 = 0 if current elm($t3) <= upper_bound($a3), else 1
	slt $t9, $t3, $a2 # $t9 = 0 if current elm($t3) => lower_bound($a2), else 1
	add $t4, $t8, $t9 # $t4 = $t8 + $9 so $t4 = 0 <=> if $t8 = 0 and $t9 = 0
	blt $0, $t4, loop1 #if not in range ($t4 > 0) then continue loop else update_counter
update_counter: 
	add $t2, $t2, 1 #update counter to inc 1
	j loop1 	
after_loop1:
	add $v1, $t2, $0 #move counter to return register
	nop
	jr $ra 
	nop
