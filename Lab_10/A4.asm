.eqv KEY_CODE 0xFFFF0004 # ASCII code from keyboard, 1 byte
.eqv KEY_READY 0xFFFF0000 # =1 if has a new keycode ?
							# Auto clear after lw
.eqv DISPLAY_CODE 0xFFFF000C # ASCII code to show, 1 byte
.eqv DISPLAY_READY 0xFFFF0008 # =1 if the display has already to do
								# Auto clear after sw
.eqv EXIT_CMD "exit"
.text
	li $k0, KEY_CODE
	li $k1, KEY_READY
	li $s0, DISPLAY_CODE
	li $s1, DISPLAY_READY
	add $s2, $sp, $0
loop: nop
WaitForKey: lw $t1, 0($k1) # $t1 = [$k1] = KEY_READY
	nop
	beq $t1, $zero, WaitForKey # if $t1 == 0 then Polling
	nop
#-----------------------------------------------------
ReadKey: lw $t0, 0($k0) # $t0 = [$k0] = KEY_CODE
	nop
	sw $t0, 0($s2)
	lw $t1, 4($s2)
	lw $t2, 8($s2)
	lw $t3, 12($s2)
	nop
	seq $t4, $t0, 116 # t4 = 1 if t0 = 't' 
	seq $t1, $t1, 105 # t1 = 1 if t1 = 'i' 
	seq $t2, $t2, 120 # t2 = 1 if t2 = 'x' 
	seq $t3, $t3, 101 # t3 = 1 if t3 = 'e' 
	nop 
	add $t4, $t4, $t3
	add $t4, $t4, $t2
	add $t4, $t4, $t2 
	#t4 = t4 + t3 + t2 + t1
	beq	$t4, 4, EXIT #t4 = 4 eqv t4, t3, t2, t1 = 1 -> meet "exit"
	nop
	addi $s2, $s2, -4 

#-----------------------------------------------------
WaitForDis: lw $t2, 0($s1) # $t2 = [$s1] = DISPLAY_READY
	beq $t2, $zero, WaitForDis # if $t2 == 0 then Polling
	nop
#-----------------------------------------------------
Encrypt: addi $t0, $t0, 1 # change input key
#-----------------------------------------------------
ShowKey: sw $t0, 0($s0) # show key
	nop
#-----------------------------------------------------
	j loop
	nop
EXIT: 
	li $v0 , 10
	syscall