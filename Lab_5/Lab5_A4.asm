
.data
	string: .space 50
	max_len: .word 10 #maximum length of string + 1
	Message1: .asciiz "Nhap xau:”
	Message2: .asciiz "Do dai la "
.text
main:
get_string: # get string from dialog
	li $v0, 54
	la $a0, Message1
	la $a1, string
	lw $a2, max_len
	syscall
get_length: 	
	la $a0, string # a0 = Address(string[0])
	xor $s0, $zero, $zero # s0 = length = 0
	xor $t0, $zero, $zero # t0 = i = 0
check_char: 	
	add $t1, $a0, $t0 # t1 = a0 + t0 = Address(string[0]+i)
	lb $t2, 0($t1) # t2 = string[i]
	beq $t2,$zero,end_of_str # Is null char?
	addi $s0, $s0, 1 # length = length + 1
	addi $t0, $t0, 1 # i = i + 1
	j check_char
end_of_str:
end_of_get_length:
print_length: # print length of string 
	li $v0, 1 		
	add $a0, $0, $s0 # move $s0 to $a0 
	lw $s1, max_len 
	sub $s1, $s1, 1
	beq $a0, $0, out
	beq $a0, $s1, out
	sub $a0, $a0, 1
out:
	syscall
