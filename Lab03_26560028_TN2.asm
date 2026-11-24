# CSBU102 - LAB 03 - TN2
# Full name: Nguyen Nam Khanh
# Student ID: 26560028
# Purpose: Clamp an input score to the range 0 through 100.

.text
.globl main
main:
    li   $v0, 5                 # read an integer x into $v0
    syscall
    add  $a0, $v0, $zero        # argument 1: x
    addi $a1, $zero, 0          # argument 2: lo = 0
    addi $a2, $zero, 100        # argument 3: hi = 100
    jal  clamp
    add  $a0, $v0, $zero        # print the result
    li   $v0, 1
    syscall
    li   $v0, 10
    syscall

# clamp(x = $a0, lo = $a1, hi = $a2): returns x limited to [lo, hi] in $v0
clamp:
    slt  $t0, $a0, $a1       # x < lo?
    beq  $t0, $zero, clamp_check_hi
    add  $v0, $a1, $zero     # result = lo
    j    clamp_end
clamp_check_hi:
    slt  $t0, $a2, $a0       # hi < x?
    beq  $t0, $zero, clamp_use_x
    add  $v0, $a2, $zero     # result = hi
    j    clamp_end
clamp_use_x:
    add  $v0, $a0, $zero     # result = x
clamp_end:
    jr   $ra
