#Milena Alves Ferreira

.data
vetor: .word 12, 18, 21, 28, 33 #vetor de 5 posições

.text
.globl main 

main:
	la $t0, vetor  #carrga o endereço do vetor em $t0
	li $t1, 0  #começo do vetor (indice inicial)
	li $t2, 4 #fim do vetor (indice final)
	
inverte_loop:
	bge $t1, $t2, fim_inversao  #se $t1>= $t2, termina o loop
	
	#carrega os valores das posiçoes $t1 e $t2
	sll $t3, $t1, 2  #calcula o deslocamento para $t1 (indice * 4)
	add $t3, $t0, $t3  #endereço do elemento na posição $t1
	lw $t4, 0($t3)  #carrega o valor na psição $t1 em $t4
	
	sll $t5, $t2, 2  #calcula o deslocamento para $t2 (indice * 4)
	add $t5, $t0, $t5  #endereço do elemento na posição $t2
	lw $t6, 0($t5) #carrega o valor na psição $t2 em $t6
	
	#troca os valores
	sw $t6, 0($t3)  #armazena o valor de $t2 na posição $t1
	sw $t4, 0($t5)  #armazena o valor de $t1 na posição $t2
	
	#atualiza os indices
	addi $t1, $t1, 1  #incrementa o indice atual
	addi $t2, $t2, -1  #decrementa o indice final
	j inverte_loop  #repete o loop
	
fim_inversao:
	#imprime o vetor invertido
	la $t0, vetor  #carrega o endereço do vetor novamente
	li $t1, 0  #indice pra percorrer o vetor
	
imprime_loop:
	bge $t1, 5, fim_imprime  #se o indice foi >= 5, encerra o loop
	
	lw $a0, 0($t0)  #carrega o valor atual do vetor em $a0
	li $v0, 1 #codigo syscall pra imprimir inteiro
	syscall  #imprime o valor
	
	#imprime um espaço
	bge $t1, 4, sem_espaço
	li $v0, 11 #codigo do syscall rpra imprimir  caractere
	li $a0, 32 #espaço " "
	syscall
	
sem_espaço:
	
	addi $t0, $t0, 4  #avança pro proximo elemento o vetor
	addi $t1, $t1, 1  #incrementa o indice
	j imprime_loop  #repete o loop
	
fim_imprime: 
	li $v0, 10  #cpdigo do syscall para sair
	syscall #fim
	
