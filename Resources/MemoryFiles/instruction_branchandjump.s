#add, addi, sub, mul
#lw, sw, sb, lh, lb, sh
#bgez, beq, bne, bgtz, blez, bltz, j, jr, jal
#and, andi, or, nor, xor, ori, xori, sll, srl, slt, slti
.text
addi $t0, $zero, 2 # t0=2
nop
nop
nop
nop
nop
add $t1, $zero, $zero # t1 = 0
nop
nop
nop
nop
nop
lbne:
nop
nop
nop
nop
nop
addi $t1, $t1, 1 # t1 += 1, t1 = 0 initially
nop
nop
nop
nop
nop
bne $t1, $t0, lbne
nop
nop
nop
nop
nop
addi $t0, $zero, 1 # t0=1
nop
nop
nop
nop
nop
add $t1, $zero, $zero # t1 = 0
nop
nop
nop
nop
nop # this comment is to help me with pasting
lbeq:
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = 0 initially
nop
nop
nop
nop
nop # this comment is to help me with pasting
beq $t1, $t0, lbeq
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $zero, 2 # t1=2
nop
nop
nop
nop
nop # this comment is to help me with pasting
lbgez:
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $t1, -1 # t1 -= 1, t1 = 2 initially
nop
nop
nop
nop
nop # this comment is to help me with pasting
bgez $t1, lbgez
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $zero, 2 # t1=2 PC 340
nop
nop
nop
nop
nop # this comment is to help me with pasting
lbgtz:
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $t1, -1 # t1 -= 1, t1 = 2 initially
nop
nop
nop
nop
nop # this comment is to help me with pasting
bgtz $t1, lbgtz
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $zero, -2 # t1=-2
nop
nop
nop
nop
nop # this comment is to help me with pasting
lblez:
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = -2 initially
nop
nop
nop
nop
nop # this comment is to help me with pasting
blez $t1, lblez
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $zero, -2 # t1=-2
nop
nop
nop
nop
nop # this comment is to help me with pasting
lbltz:
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = -2 initially
nop
nop
nop
nop
nop # this comment is to help me with pasting
bltz $t1, lbltz
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $t1, 1 # t1 += 1, t1 = 1
nop
nop
nop
nop
nop # this comment is to help me with pasting
bltz $t1, lbltz
nop
nop
nop
nop
nop # this comment is to help me with pasting
jal ljr
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $zero, 6969
nop
nop
nop
nop
nop # this comment is to help me with pasting
j done
nop
nop
nop
nop
nop # this comment is to help me with pasting
ljr:
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $zero, 999
nop
nop
nop
nop
nop # this comment is to help me with pasting
jr $ra
nop
nop
nop
nop
nop # this comment is to help me with pasting
done:
nop
nop
nop
nop
nop # this comment is to help me with pasting
addi $t1, $zero, 420
nop
nop
nop
nop
nop # this comment is to help me with pasting