.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh
.eqv green 0x4caf4f
.eqv brown 0x4e342e 

.text
	li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh
	
	li $t0, green
	li $t1, brown
green_part:	
	sw $t0, 44($k0)
	sw $t0, 48($k0)
	sw $t0, 72($k0)
	sw $t0, 76($k0)
	sw $t0, 80($k0)
	sw $t0, 84($k0)
	sw $t0, 100($k0)
	sw $t0, 104($k0)
	sw $t0, 108($k0)
	sw $t0, 112($k0)
	sw $t0, 116($k0)
	sw $t0, 120($k0)
brown_part:
	sw $t1, 140($k0)
	sw $t1, 144($k0)
	sw $t1, 172($k0)
	sw $t1, 176($k0)
	sw $t1, 204($k0)
	sw $t1, 208($k0)
	