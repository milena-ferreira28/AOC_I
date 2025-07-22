#Milena Alves Ferreira
.data
	promptN:	.asciiz "Digite o valor de N: "
	promptValor:    .asciiz "Digite um valor: "
	resultadoS:     .asciiz "A soma S dos números pares é: "
	resultadoQ:     .asciiz "\nA quantidade Q de números pares é: "
.align 2        # alinha o próximo endereço em um múltiplo de 4
	valores:        .space 400  # reserva espaço para até 100 valores (4 bytes cada)
	S:              .word 0     # inicializa S com 0
	Q:              .word 0     # inicializa Q com 0

.text
.globl main

main:
	# lê N:
	li $v0, 4		# código para imprimir string
	la $a0, promptN		# carrega o end da string promptN
	syscall			# imprime "Digite o valor de N: "
	li $v0, 5		# código para ler um inteiro
	syscall			# lê o valor de N
	move $t0, $v0		# armazena N em $t0

	# chama sub-rotina para leitura dos valores
	jal ler_valores        

	# chama sub-rotina para calcular a soma dos pares
	jal calcular_soma_pares 

	# mostra o resultado S
	li $v0, 4              # código para imprimir string
   	la $a0, resultadoS     # carrega o endereço da string resultadoS
    	syscall                # cmprime "A soma S dos números pares é: "
    	lw $a0, S              # carrega o valor de S
    	li $v0, 1              # código para imprimir inteiro
    	syscall                # imprime o valor de S

    	# mostra o resultado Q
    	li $v0, 4              # código para imprimir string
    	la $a0, resultadoQ     # carrega o endereço da string resultadoQ
    	syscall                # imprime "A quantidade Q de números pares é: "
    	lw $a0, Q              # carrega o valor de Q
    	li $v0, 1              # código para imprimir inteiro
    	syscall                # imprime o valor de Q

   	 # fim do programa
    	li $v0, 10             # código para terminar o programa
   	 syscall               # fim

ler_valores:
    	la $t1, valores        # carrega o endereço base do array valores
    	li $t2, 0              # inicializa o contador de leitura

loop_leitura:
    	beq $t2, $t0, fim_loop	# se contador == N, termina a leitura
    	li $v0, 4              		# código para imprimir string
    	la $a0, promptValor    		# carrega o endereço da string promptValor
    	syscall                		# imprime "Digite um valor: "
    	li $v0, 5              		# código para ler um inteiro
    	syscall                		# lê o valor
    	sw $v0, 0($t1)         		# armazena o valor lido no array
    	addi $t1, $t1, 4       		# avança para o próximo espaço no array
    	addi $t2, $t2, 1       		# incrementa o contador
    	j loop_leitura         		# repete o loop

fim_loop:
    	jr $ra                 # retorna para o chamador

calcular_soma_pares:
    	la $t1, valores        # carrega o endereço base do array valores
    	li $t2, 0              # inicializa o contador de leitura
    	lw $t3, S              # carrega o valor de S
   	lw $t4, Q              # carrega o valor de Q

loop_soma:
    	beq $t2, $t0, fim_soma # se contador == N, termina a soma
    	lw $t5, 0($t1)         # carrega o valor atual do array
   	andi $t6, $t5, 1       # verifica se o valor é par (último bit é 0)
   	bnez $t6, proximo      # se for ímpar, pula para o próximo
    	add $t3, $t3, $t5      # soma o valor par a S
    	addi $t4, $t4, 1       # incrementa a quantidade de pares em Q

proximo:
    	addi $t1, $t1, 4       # avança para o próximo espaço no array
    	addi $t2, $t2, 1       # incrementa o contador
    	j loop_soma            # repete o loop

fim:
    	sw $t3, S              # armazena o valor final de S
    	sw $t4, Q              # armazena o valor final de Q
    	jr $ra                 # tetorna para o chamador