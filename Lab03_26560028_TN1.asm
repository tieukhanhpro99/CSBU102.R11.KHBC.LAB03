# CSBU102 - LAB 03 - TN1
# Ho ten: Nguyen Nam Khanh
# Student ID: 26560028
# Purpose: Demonstrate leaf procedures stars and sep using jal/jr.

.data
title:    .asciiz "SCORE REPORT\n"
endMsg:   .asciiz "END\n"
line:     .asciiz "----------\n"
starLine: .asciiz "**********\n"

.text
.globl main
main:
   jal  stars               # **********

   li   $v0, 4
   la   $a0, title
   syscall                  # SCORE REPORT

   jal  sep                 # ----------

   li   $v0, 4
   la   $a0, endMsg
   syscall                  # END

   jal  stars               # **********

   li   $v0, 10
   syscall

# sep(): no arguments or return value. Prints a separator line.
sep:
   li   $v0, 4
   la   $a0, line
   syscall
   jr   $ra

# stars(): no arguments or return value. Prints a line of stars.
stars:
   li   $v0, 4
   la   $a0, starLine
   syscall
   jr   $ra
