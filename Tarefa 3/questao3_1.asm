    .data
nota1:          .asciiz "Digite a primeira nota: "
nota2:          .asciiz "Digite a segunda nota: "
nota3:          .asciiz "Digite a terceira nota: "
media:      .asciiz "Média: "
situacao:   .asciiz "Situação: "
reprovado_msg:  .asciiz "\nReprovado\n"
exame_msg:      .asciiz "\nExame\n"
aprovado_msg:   .asciiz "\nAprovado\n"
continue_msg:   .asciiz "Digite 0 para continuar ou 1 para sair: "

    .text
    .globl main

main:
    loop:
        # ler a primeira nota
        li $v0, 4
        la $a0, nota1
        syscall
        li $v0, 5
        syscall
        move $t0, $v0  # $t0 = primeira nota

        # ler a segunda nota
        li $v0, 4
        la $a0, nota2
        syscall
        li $v0, 5
        syscall
        move $t1, $v0  # $t1 = segunda nota

        # ler a terceira nota
        li $v0, 4
        la $a0, nota3
        syscall
        li $v0, 5
        syscall
        move $t2, $v0  # $t2 = terceira nota

        # calcula a soma das notas
        add $t3, $t0, $t1  # $t3 = nota1 + nota2
        add $t3, $t3, $t2  # $t3 = nota1 + nota2 + nota3

        # calcula a média
        li $t4, 3
        div $t3, $t4      # dividi a soma das notas por 3 (3 notas)
        mflo $t3          # armazena o resultado da divisão (média)

        # exibi a média
        li $v0, 4
        la $a0, media
        syscall
        li $v0, 1
        move $a0, $t3
        syscall
 
        # determinar e mostrar a situação acadêmica
        li $t5, 3
        blt $t3,$t5 reprovado  # se a média < 3, reprovado
        li $t5, 7
        bge $t3, $t5, aprovado  # se a média >= 7, aprovado
        j exame               # caso contrário, exame (3 =< media < 7)

    reprovado:
        li $v0, 4
        la $a0, reprovado_msg
        syscall
        j continue

    exame:
        li $v0, 4
        la $a0, exame_msg
        syscall
        j continue

    aprovado:
        li $v0, 4
        la $a0, aprovado_msg
        syscall

    continue:
        # pergunta se o usuário deseja continuar
        li $v0, 4
        la $a0, continue_msg
        syscall
        li $v0, 5
        syscall
        
        move $t6, $v0
        bne $t6, 1, loop  # se não for 1, continua o loop

    # sair do programa
    li $v0, 10
    syscall
