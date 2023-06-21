.data
   var: .word 0
   var2: .float 0.0
   var3: .asciiz ""
.text
.globl main

main:
   li $t0, 7
   sw $t0, var
   li $t1, 7
   li $t2, 5
   add $t3, $t1, $t2
   sw $t3, var
   lw $a0, var
   li $v0, 1
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
   li.s $f4, 7.5
   s.s $f4, var2
   li.s $f12, 5.5
   li $v0, 2
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
   la $t5, var3
   
   li $t7, 'H'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'o'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'l'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'a'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, ' '
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'M'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'u'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'n'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'd'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 'o'
   sb $t7, ($t5)
   addi $t5, $t5, 1
   li $t7, 0
   sb $t7, ($t5)
   li $a0, 'H'
   li $v0, 11
   syscall
   li $a0, 'o'
   li $v0, 11
   syscall
   li $a0, 'l'
   li $v0, 11
   syscall
   li $a0, 'a'
   li $v0, 11
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
   la $a0, var3
   li $v0, 4
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
   la $t6, var3
   
   li $t8, 'H'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'o'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'l'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'a'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, ' '
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'M'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'u'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'n'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'd'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 'o'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, '!'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, '!'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, '!'
   sb $t8, ($t6)
   addi $t6, $t6, 1
   li $t8, 0
   sb $t8, ($t6)
   la $a0, var3
   li $v0, 4
   syscall
   addi $a0, $0, 0xA
   addi $v0, $0, 0xB
   syscall
   li $t7, 0
   li $v0, 10
   syscall