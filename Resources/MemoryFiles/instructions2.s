.text
add $s0, $zero, $zero  # $s0 = 0 
addi $t0, $zero, 5   # $8 = 5
addi $t1, $zero, 10   # $9 = 10
add $t2, $t0 ,$t1   # $10 = 15
sub $t3, $t2, $t1    # $11 = 5
mul $t4, $t0, $t1    # $12 = 50
sw $t0, 0($t1)    # memory location 10 =  5
lw $t5, 0($t1)    # $13 = 5
sb $t1, 0($t0)  # store 10 at byte location 5
lb $t5, 0($t0) # $13 = 10
sh $t2, 0($t0) # store 15 in location 5
lh $t5, 0($t0) # $t5 = 15
#and, andi, or, nor, xor, ori, xori, sll, srl, slt, slti
and $s1, $t0, $t0   # s1 = 5
andi $s2, $t0, 1  # s2 = 1
or $s3, $zero, $s2 # s3 = 1
ori $s4, $zero, 15  # s4 = 15
xor $s5, $s1, $s2  # 5 xor 1 => s5 = 4
xori $s6, $s1, 0 # 5 xor 0 = 5 => s6 = 5
sll $s7, $s1, 2 # s7 = 5*4 = 20
srl $s5, $s4, 1 # s7 = 15/2 = 7
slt $s7, $s5, $s7 # s7 = 7<20 = 1
slti $s7, $s5, 15 # s7 = 7<15 = 1
slt $s7, $s5, $s5 # s7 = 7<7 = 0
slti $s7, $s5, 6 # s7 = 7<6 = 0
 # Branches and jumps
addi $t0, $zero, 2 # t0=2
add $t1, $zero, $zero # t1 = 0
lbne:
addi $t1, $t1, 1 # t1 += 1, t1 = 0 initially
bne $t1, $t0, lbne
addi $t0, $zero, 1 # t0=1
add $t1, $zero, $zero # t1 = 0 # this comment is to help me with pasting
lbeq: # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = 0 initially # this comment is to help me with pasting
beq $t1, $t0, lbeq # this comment is to help me with pasting
addi $t1, $zero, 2 # t1=2 # this comment is to help me with pasting
lbgez: # this comment is to help me with pasting
addi $t1, $t1, -1 # t1 -= 1, t1 = 2 initially # this comment is to help me with pasting
bgez $t1, lbgez # this comment is to help me with pasting
addi $t1, $zero, 2 # t1=2 PC 340 # this comment is to help me with pasting
lbgtz: # this comment is to help me with pasting
addi $t1, $t1, -1 # t1 -= 1, t1 = 2 initially # this comment is to help me with pasting
bgtz $t1, lbgtz # this comment is to help me with pasting
addi $t1, $zero, -2 # t1=-2 # this comment is to help me with pasting
lblez: # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = -2 initially # this comment is to help me with pasting
blez $t1, lblez # this comment is to help me with pasting
addi $t1, $zero, -2 # t1=-2 # this comment is to help me with pasting
lbltz: # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = -2 initially # this comment is to help me with pasting
bltz $t1, lbltz # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = 1 # this comment is to help me with pasting
bltz $t1, lbltz # this comment is to help me with pasting
jal ljr # this comment is to help me with pasting
addi $t1, $zero, 6969 # this comment is to help me with pasting
j done # this comment is to help me with pasting
ljr: # this comment is to help me with pasting
addi $t1, $zero, 999 # this comment is to help me with pasting
jr $ra # this comment is to help me with pasting
done: # this comment is to help me with pasting
addi $t1, $zero, 420 # this comment is to help me with pasting

