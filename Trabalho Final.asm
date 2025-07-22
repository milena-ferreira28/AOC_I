.data 
apresenta_menu: .asciiz "\n----MENU----- \n 1. Adicao \n 2. Subtracao \n 3. Multiplicacao\n 4. Divisao \n 5. Area Retangulo \n 6. Area Triangulo \n 7. Area Circulo \n 8. Fatorial \n 9. Sair do programa \n"
escolha: .asciiz " \n O que voce deseja fazer? "
mensagem_invalida: .asciiz "Opcao invalida, tente novamente"
valor1: .asciiz "Digite o primeiro valor: "
valor2: .asciiz "Digite o segundo valor: "
base: .asciiz "Informe a base: "
altura: .asciiz "Informe a altura: "
fato: .asciiz "Informe o numero a ser feito o fatorial (deve ser inteiro): "
raio: .asciiz "Informe o raio do circulo: "
erro: .asciiz "Nao foi possivel realizar a divisao, pois envolve o numero 0"
imprimir: .asciiz "Resultado:  "
resultado_fatorial: .asciiz "Resultado do fatorial: "
pi: .float 3.14159265   # valor de pi 
zero_float: .float 0.0  # constante pra comparacao
dois_float: .float 2.0  # constante pra calculo

.text 

menu: 
    li $v0, 4           # codigo 4 - imprime string 
    la $a0, apresenta_menu # imprime o menu
    syscall 

    li $v0, 4           # codigo 4 - imrpime string
    la $a0, escolha     # imprime a mensagem de escolha
    syscall

    li $v0, 5           # codigo pra ler um numero inteiro - deixa o usuario escolher a opcao
    syscall
    move $t0, $v0

    beq $t0, 1, adicao  #beq - pula pra instrucao que o usuario escolher
    beq $t0, 2, subtracao 
    beq $t0, 3, multiplicacao
    beq $t0, 4, divisao
    beq $t0, 5, area_retangulo 
    beq $t0, 6, area_triangulo 
    beq $t0, 7, area_circulo
    beq $t0, 8, fatorial 
    beq $t0, 9, sair_programa

    j opcao_invalida

opcao_invalida: 
    li $v0, 4           # codigo 4 - imprime string 
    la $a0, mensagem_invalida
    syscall 
    j menu

adicao: 
    jal pega_valor
    jal soma
    jal imprime
    j menu 

subtracao:
    jal pega_valor
    jal subtrai
    jal imprime
    j menu 

divisao: 
    jal pega_valor
    jal teste
    jal divide
    jal imprime
    j menu 

multiplicacao:
    jal pega_valor
    jal multiplica
    jal imprime
    j menu 

area_triangulo: 
    jal pega_valor_triangulo
    jal triangulo
    jal imprime
    j menu 

area_retangulo:
    jal pega_valor_triangulo
    jal multiplica
    jal imprime
    j menu 

area_circulo: 
    jal pega_raio
    jal circulo
    jal imprime
    j menu 

fatorial: 
    jal pega_fatorial 
    jal faz_fatorial
    jal imprime_fat
    j menu 

sair_programa: 
    jal fim_do_programa  

# funcao pra ler os valores (float)
pega_valor: 
    li $v0, 4           # codigo 4 - imprime string
    la $a0, valor1      # pede o primeiro valor
    syscall 
    li $v0, 6           # codigo 6 - le float
    syscall 
    mov.s $f1, $f0      # guarda o valor em $f1

    li $v0, 4 
    la $a0, valor2      
    syscall 
    li $v0, 6           # codigo 6 - le float
    syscall 
    mov.s $f2, $f0      # guarda o valor em $f2
    jr $ra  

# funcao para ler base e altura (float)
pega_valor_triangulo: 
    li $v0, 4
    la $a0, base       
    syscall 
    li $v0, 6           # le float
    syscall 
    mov.s $f1, $f0      # guarda em $f1

    li $v0, 4
    la $a0, altura      
    syscall 
    li $v0, 6           # le float
    syscall 
    mov.s $f2, $f0      # guarda em $f2
    jr $ra

# le o raio
pega_raio: 
    li $v0, 4 
    la $a0, raio        
    syscall 
    li $v0, 6           # le o float
    syscall
    mov.s $f1, $f0      # guarda o raio em $f1
    jr $ra 

# funcao do fatorial
pega_fatorial: 
    li $v0, 4
    la $a0, fato        # imprime mensagem pedindo o fatorial
    syscall 
    li $v0, 5           # le inteiro - (fatorial n aceita float - malu)
    syscall 
    move $t0, $v0 
    jr $ra 


soma:
    add.s $f12, $f1, $f2   # $f12 =  usado para o resultado
    jr $ra 

multiplica: 
    mul.s $f12, $f1, $f2   
    jr $ra 

subtrai: 
    sub.s $f12, $f1, $f2   
    jr $ra 

divide:
    div.s $f12, $f1, $f2   
    jr $ra 

teste: 
    # ve se o divisor eh zero - nao da pra dividir 
    l.s $f4, zero_float    # carrega 0.0 em $f4
    c.eq.s $f2, $f4        # compara $f2 com 0.0
    bc1t divisao_por_zero  # se for igual, vai para divisao_por_zero
    jr $ra
    
divisao_por_zero:
    li $v0, 4
    la $a0, erro #mensagem de erro
    syscall
    j menu
 

imprime: 
    li $v0, 4 
    la $a0, imprimir       
    syscall 
    li $v0, 2              # codigo  2 - mprimir float
    syscall 
    j menu

imprime_fat: 
    li $v0, 4 
    la $a0, imprimir      
    syscall 
    li $v0, 1              # codigo 1 - imprime numero inteiro (fatorial)
    move $a0, $t2          # move o resultado de $t2 para $a0
    syscall 
    j menu

fim_do_programa:
    li $v0, 10             # codigo 10 - encerra o programam
    syscall

circulo:
    mul.s $f3, $f1, $f1    # raio ao quadrado
    l.s $f4, pi            # carrega valor de pi
    mul.s $f12, $f3, $f4   # pi * raio ao quadrado 
    jr $ra

triangulo:
    mul.s $f3, $f1, $f2    # base xltura
    l.s $f4, dois_float    # carrega 2.0
    div.s $f12, $f3, $f4   # divide por 2
    jr $ra

faz_fatorial:
    li $t1, 1              # inicializa o fatorial como 1
    comeco:
        beqz $t0, feito    # verifica se ta em zero, se sim vai pra funcao feito
        mul $t1, $t1, $t0  # multiplica o fatorial pelo numero atual
        subi $t0, $t0, 1   # numero atual - 1 
        j comeco           # volta pro comeco
    feito:
        move $t2, $t1      # armazena resultado em $t2
        jr $ra
