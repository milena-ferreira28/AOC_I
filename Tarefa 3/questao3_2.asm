.data
numero: .asciiz "Digite um número: "
vezes: .asciiz "X"
igual: .asciiz "="
novaLinha: .asciiz "\n"

.text
.globl main 

main:
	#mensagem de entrada
	li $v0, 4
	la $a0, numero
	syscall
	
	#lê o numero do usuuário
	li $v0, 5
	syscall
	move $t0, $v0 #armazena o valor lido em $t0
	
	li $t1, 1 #inicializa o multiplicador (i=1)
	
loop: 
	bgt $t1, 10, sair  #se multiplicador > 10, sai do loop
	
	#imprime número base
   	li $v0, 1
	move $a0, $t0
   	syscall

    	#imprime " x "
    	li $v0, 4
    	la $a0, vezes
    	syscall

    	#imprime multiplicador
    	li $v0, 1
    	move $a0, $t1
    	syscall

    	#imprime " = "
    	li $v0, 4
    	la $a0, igual
    	syscall

	#calcula o resultado ($t0 * $t1)
	mul $t2, $t0, $t1
	
	#imprime o resultado
	li $v0, 1
	move $a0, $t2
	syscall
	
	#imprime nova linnha
	li $v0, 4
	la $a0, novaLinha
	syscall
	
	#incrementa o multiplicador (i++)
	addi $t1, $t1, 1
	j loop
	
sair: 
	#encerra o programa 
	li $v0, 10
	syscall
	
	
