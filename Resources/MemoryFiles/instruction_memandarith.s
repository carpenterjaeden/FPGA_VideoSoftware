#add, addi, sub, mul
#lw, sw, sb, lh, lb, sh
#bgez, beq, bne, bgtz, blez, bltz, j, jr, jal
#and, andi, or, nor, xor, ori, xori, sll, srl, slt, slti
.text
add $s0, $zero, $zero  # $s0 = 0
nop
nop
nop
nop
nop 
addi $t0, $zero, 5   # $8 = 5
nop
nop
nop
nop
nop
addi $t1, $zero, 10   # $9 = 10
nop
nop
nop
nop
nop
add $t2, $t0 ,$t1   # $10 = 15
nop
nop
nop
nop
nop
sub $t3, $t2, $t1    # $11 = 5
nop
nop
nop
nop
nop
mul $t4, $t0, $t1    # $12 = 50
nop
nop
nop
nop
nop
sw $t0, 0($t1)    # memory location 10 =  5
nop
nop
nop
nop
nop
lw $t5, 0($t1)    # $13 = 5
nop
nop
nop
nop
nop
sb $t1, 0($t0)  # store 10 at byte location 5
nop
nop
nop
nop
nop 
lb $t5, 0($t0) # $13 = 10
nop
nop
nop
nop
nop 
sh $t2, 0($t0) # store 15 in location 5
nop
nop
nop
nop
nop 
lh $t5, 0($t0) # $t5 = 15
nop
nop
nop
nop
nop
#and, andi, or, nor, xor, ori, xori, sll, srl, slt, slti
and $s1, $t0, $t0   # s1 = 5
nop
nop
nop
nop
nop
andi $s2, $t0, 1  # s2 = 1
nop
nop
nop
nop
nop
or $s3, $zero, $s2 # s3 = 1
nop
nop
nop
nop
nop
ori $s4, $zero, 15  # s4 = 15
nop
nop
nop
nop
nop
xor $s5, $s1, $s2  # 5 xor 1 => s5 = 4
nop
nop
nop
nop
nop
xori $s6, $s1, 0 # 5 xor 0 = 5 => s6 = 5
nop
nop
nop
nop
nop
sll $s7, $s1, 2 # s7 = 5*4 = 20
nop
nop
nop
nop
nop
srl $s5, $s4, 1 # s7 = 15/2 = 7
nop
nop
nop
nop
nop
slt $s7, $s5, $s7 # s7 = 7<20 = 1
nop
nop
nop
nop
nop
slti $s7, $s5, 15 # s7 = 7<15 = 1
nop
nop
nop
nop
nop
slt $s7, $s5, $s5 # s7 = 7<7 = 0
nop
nop
nop
nop
nop
slti $s7, $s5, 6 # s7 = 7<6 = 0
nop
nop
nop
nop
nop
syscall



