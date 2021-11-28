.data
j: .word 1
k: .word -1
l: .word 0

.text 
lw $s0, j
lw $s1, k
lw $s2, l

	main:
		jal Nat_Gen
		jal Nat_Gen
		jal Nat_Gen
		syscall
	
 	Nat_Gen:
 		add $s1, $s1, 1
 		add $s2, $s0, $s1
 		jr $ra
