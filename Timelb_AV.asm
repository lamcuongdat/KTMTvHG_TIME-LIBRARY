.data 
	time: .asciiz"25/12/1997"
.text
.globl main


main: 
	la $a0,time
	jal Year
	
	add $a0,$v0,$0
	li $v0,1
	syscall
	j EndOfFile

#Gia su l� bi�n time da duoc truyen v�o thanh ghi $a0
#$a0: Luu tham so truyen v�o tu bien time
#$v0: Luu ket qua tra ve 
#$t0: Luu so 10
#$t1: Luu k� tu duoc tr�ch ra tu $a0
#$t2: Dem vong lap
#$t3: Luu ket qua tra ve($t3=$t3$t0 + $t1)
Day:

#Luu $ra
addi $sp,$sp,-4 
sw $ra,0($sp) 

#Luu $t0
addi $sp,$sp,-4 
sw $t0,0($sp)

#Luu $t1
addi $sp,$sp,-4 
sw $t1,0($sp)

#Luu $a0
addi $sp,$sp,-4 
sw $a0,0($sp)

#Luu $t2
addi $sp,$sp,-4 
sw $t2,0($sp)

#Luu $t3
addi $sp,$sp,-4 
sw $t3,0($sp)

add $t3,$0,$0 #G�n $t3 = 0
addi $t0,$0,10 #G�n $t0=10
addi $t2,$0,2 #So k� tu tr�ch ra 

LoopExtractDay:
	addi $t2,$t2,-1 #Giam buoc lap
	lb $t1,($a0) #Lay ki tu trong x�u
	addi $t1,$t1,-48 # k� tu -'0' ra int
	addi $a0,$a0,1 #Doi vi tr� tro v�o k� tu
	mult $t3,$t0 #Nhan $t3 va $t0
	mflo $t3 #Chuyen $LO vao $t3
	add $t3,$t3,$t1 ##$t3= $t3 + $t1
	#Kiem tra dieu kien tho�t: $t2=0
	beq $t2,$0,EndLoopED
	j LoopExtractDay
EndLoopED:

#G�n gi� tri cho $v0
add $v0,$t3,$0
#Tra lai gi� tri cho $t3
lw $t3,0($sp)
addi $sp,$sp,4
#Tra lai gi� tri cho $t2
lw $t2,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $a0
lw $a0,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $t1
lw $t1,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $t0
lw $t0,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $ra
lw $ra,0($sp) 
addi $sp,$sp,4 

jr $ra #Tro lai h�m truoc d�


#Gia su l� bi�n time da duoc truyen v�o thanh ghi $a0
#$a0: Luu tham so truyen v�o tu bien time
#$v0: Luu ket qua tra ve 
#$t0: Luu so 10
#$t1: Luu k� tu duoc tr�ch ra tu $a0
#$t2: Dem vong lap
#$t3: Luu ket qua tra ve($t3=$t3$t0 + $t1)
Month:

#Luu $ra
addi $sp,$sp,-4 
sw $ra,0($sp) 

#Luu $t0
addi $sp,$sp,-4 
sw $t0,0($sp)

#Luu $t1
addi $sp,$sp,-4 
sw $t1,0($sp)

#Luu $a0
addi $sp,$sp,-4 
sw $a0,0($sp)

#Luu $t2
addi $sp,$sp,-4 
sw $t2,0($sp)

#Luu $t3
addi $sp,$sp,-4 
sw $t3,0($sp)

add $t3,$0,$0 #G�n $t3 = 0
addi $t0,$0,10 #G�n $t0=10
addi $t2,$0,2 #So k� tu tr�ch ra 
addi $a0,$a0,3 #Bo qua ngay va dau '/'

LoopExtractMonth:
	addi $t2,$t2,-1 #Giam buoc lap
	lb $t1,($a0) #Lay ki tu trong x�u
	addi $t1,$t1,-48 # k� tu -'0' ra int
	addi $a0,$a0,1 #Doi vi tr� tro v�o k� tu
	mult $t3,$t0 #Nhan $t3 va $t0
	mflo $t3 #Chuyen $LO vao $t3
	add $t3,$t3,$t1 ##$t3= $t3 + $t1
	#Kiem tra dieu kien tho�t: $t2=0
	beq $t2,$0,EndLoopEMonth
	j LoopExtractMonth
EndLoopEMonth:

#G�n gi� tri cho $v0
add $v0,$t3,$0
#Tra lai gi� tri cho $t3
lw $t3,0($sp)
addi $sp,$sp,4
#Tra lai gi� tri cho $t2
lw $t2,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $a0
lw $a0,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $t1
lw $t1,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $t0
lw $t0,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $ra
lw $ra,0($sp) 
addi $sp,$sp,4 

jr $ra #Tro lai h�m truoc d�


#Gia su l� bi�n time da duoc truyen v�o thanh ghi $a0
#$a0: Luu tham so truyen v�o tu bien time
#$v0: Luu ket qua tra ve 
#$t0: Luu so 10
#$t1: Luu k� tu duoc tr�ch ra tu $a0
#$t2: Dem vong lap
#$t3: Luu ket qua tra ve($t3=$t3$t0 + $t1)
Year:

#Luu $ra
addi $sp,$sp,-4 
sw $ra,0($sp) 

#Luu $t0
addi $sp,$sp,-4 
sw $t0,0($sp)

#Luu $t1
addi $sp,$sp,-4 
sw $t1,0($sp)

#Luu $a0
addi $sp,$sp,-4 
sw $a0,0($sp)

#Luu $t2
addi $sp,$sp,-4 
sw $t2,0($sp)

#Luu $t3
addi $sp,$sp,-4 
sw $t3,0($sp)

add $t3,$0,$0 #G�n $t3 = 0
addi $t0,$0,10 #G�n $t0=10
addi $t2,$0,4 #So k� tu tr�ch ra 
addi $a0,$a0,6 #Bo qua ngay va dau '/'

LoopExtractYear:
	addi $t2,$t2,-1 #Giam buoc lap
	lb $t1,($a0) #Lay ki tu trong x�u
	addi $t1,$t1,-48 # k� tu -'0' ra int
	addi $a0,$a0,1 #Doi vi tr� tro v�o k� tu
	mult $t3,$t0 #Nhan $t3 va $t0
	mflo $t3 #Chuyen $LO vao $t3
	add $t3,$t3,$t1 ##$t3= $t3 + $t1
	#Kiem tra dieu kien tho�t: $t2=0
	beq $t2,$0,EndLoopEYear
	j LoopExtractYear
EndLoopEYear:

#G�n gi� tri cho $v0
add $v0,$t3,$0
#Tra lai gi� tri cho $t3
lw $t3,0($sp)
addi $sp,$sp,4
#Tra lai gi� tri cho $t2
lw $t2,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $a0
lw $a0,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $t1
lw $t1,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $t0
lw $t0,0($sp)
addi $sp,$sp,4 
#Tra lai gi� tri cho $ra
lw $ra,0($sp) 
addi $sp,$sp,4 

jr $ra #Tro lai h�m truoc d�

EndOfFile: