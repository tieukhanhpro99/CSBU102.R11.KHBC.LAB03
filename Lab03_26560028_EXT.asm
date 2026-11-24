# CSBU102 - LAB 03 - EXT
# Full name: Nguyen Nam Khanh
# Student ID: 26560028
# Purpose: Return and display both extrema for each class.

.data
classA: .word 72, 55, 90, 48, 63, 85, 39, 77, 60, 94
classB: .word 45, 81, 66, 50, 92, 38, 70, 59
minA:   .asciiz "Class A min: "
maxA:   .asciiz "Class A max: "
minB:   .asciiz "Class B min: "
maxB:   .asciiz "Class B max: "
nl:     .asciiz "\n"

.text
.globl main
main:
    la   $a0, classA
    addi $a1, $zero, 10
    jal  min_max
    add  $a1, $v0, $zero
    add  $s0, $v1, $zero        # keep the maximum across the first show
    la   $a0, minA
    jal  show
    la   $a0, maxA
    add  $a1, $s0, $zero
    jal  show

    la   $a0, classB
    addi $a1, $zero, 8
    jal  min_max
    add  $a1, $v0, $zero
    add  $s0, $v1, $zero
    la   $a0, minB
    jal  show
    la   $a0, maxB
    add  $a1, $s0, $zero
    jal  show

    li   $v0, 10
    syscall

# min_max(addr = $a0, n = $a1): requires n >= 1, returns min in $v0 and max in $v1.
min_max:
    lw   $v0, 0($a0)
    add  $v1, $v0, $zero
    addi $t0, $zero, 1          # start at element 1
mm_loop:
    slt  $t1, $t0, $a1
    beq  $t1, $zero, mm_end
    sll  $t2, $t0, 2
    add  $t2, $a0, $t2
    lw   $t3, 0($t2)
    slt  $t4, $t3, $v0
    beq  $t4, $zero, mm_check_max
    add  $v0, $t3, $zero
mm_check_max:
    slt  $t4, $v1, $t3
    beq  $t4, $zero, mm_next
    add  $v1, $t3, $zero
mm_next:
    addi $t0, $t0, 1
    j    mm_loop
mm_end:
    jr   $ra

# show(msg = $a0, value = $a1): prints msg, value and a new line, with no return value.
show:
    li   $v0, 4
    syscall
    li   $v0, 1
    add  $a0, $a1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall
    jr   $ra
