
.data
	s: .asciiz "The sum of "
	a: .asciiz " and "
	i: .asciiz " is "
.text
init: 
	li $s0, 5
	li $s1, 4
	add $t1, $s0, $s1
so: #in ra the sum of
	li $v0, 4
	la $a0, s
	syscall
s0: #in ra s0
	li $v0, 1
	add $a0, $0, $s0
	syscall
sa: #in ra and
	li $v0, 4
	la $a0, a
	syscall
s1: #in ra s1 
	li $v0, 1
	add $a0, $0, $s1
	syscall
si: #in ra is
	li $v0, 4
	la $a0, i
	syscall
res: #in ra res
	li $v0, 1
	add $a0, $0, $t1
	syscall
