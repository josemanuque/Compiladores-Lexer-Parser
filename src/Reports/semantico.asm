.data
   a: .word 0
   var: .word 0
   var3: .asciiz ""
.text
.globl main

test:
   li $t0, 0
   sw $t0, a
   lw $t1, a
main:
   li $t2, 10
   sw $t2, var
   la $t3, var3
   
   li $t5, 'H'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'o'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'l'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'a'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, ' '
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'M'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'u'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'n'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'd'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 'o'
   sb $t5, ($t3)
   addi $t3, $t3, 1
   li $t5, 0
   sb $t5, ($t3)
   la $a0, var3
   li $v0, 4
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
   li.s $f12, 7.5
   li $v0, 2
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
_if_1:
   lw $t4, var
   li $t5, 9
   
   ble $t4, $t5, _if_1_bloque
   j _end_if_1_bloque
_if_1_bloque:
   li $a0, 'E'
   li $v0, 11
   syscall
   li $a0, 's'
   li $v0, 11
   syscall
   li $a0, ' '
   li $v0, 11
   syscall
   li $a0, '7'
   li $v0, 11
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
   j _end_if_1
_end_if_1_bloque:
_if_1_else_1:
   li $a0, 'N'
   li $v0, 11
   syscall
   li $a0, 'o'
   li $v0, 11
   syscall
   li $a0, ' '
   li $v0, 11
   syscall
   li $a0, 'e'
   li $v0, 11
   syscall
   li $a0, 's'
   li $v0, 11
   syscall
   li $a0, ' '
   li $v0, 11
   syscall
   li $a0, '7'
   li $v0, 11
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
_end_if_else_1:
_end_if_1:
   li $t7, 0
   li $v0, 10
   syscall