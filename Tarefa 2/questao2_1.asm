#Milena Alves Ferreira

.data
string: .asciiz "eu estou matriculada na disciplina de arquitetura e organização de computadores"
space: .asciiz " "

.text
.globl main

main:
	la $t0, string #carrega o fimereço da string em $t0
	li $t1, 0  #inicializa o indice que vai percorrer a string
	
loop:
	lb $t2, 0($t0)  #carrega o byte atual da string em $t2
	beqz $t2, fim   #se o caractere for nulo, termina o loop
	
	lb $t3, 1($t0)  #carrega o proximo byte em $t3
	beq $t3, 32, captura_ultima_letra   #se o proximo caractere for um espaço, captaliza o atual
	beqz $t3, captura_ultima_letra  #se o proximo caractere for nulo, captaliza o atua
	
	addi $t0, $t0, 1  #avança pro proximo caractere
	j loop  #repete o loop
	
captura_ultima_letra:
	#verifica se o caractere atual é uma letra minúscula
	blt $t2, 97, nao_minuscula  #se for menor que "a", não é minúscula
	bgt $t2, 122, nao_minuscula  #se for maior que "z", não é minúscula
	
	addi $t2, $t2, -32  #converte para maiúscula (subtrai 32 na tabela ASCII
	sb $t2, 0($t0)   #armazena o caractere capitalizado de volta na string
	
nao_minuscula: 
	addi $t0, $t0, 1  #avança pro próximo caractere
	j loop  #repete o loop
	
fim: 
	#imprime a string modificada
	li $v0, 4 #código do syscall pra imprimir string
	la $a0, string  #carrega o fimereço da string modificada
	syscall
	
	li $v0, 10  #código do syscall pra sair
	syscall #fim
	
	
