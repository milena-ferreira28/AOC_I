#Milena Alves Ferreira

.data
soma: .word 0   #espa�o para armazenar o resultado

.text
    addi $s0, $zero, 1  # inicializa contador com 1
    addi $t1, $zero, 300  # limite superior (300)
    ori $t2, $zero, 3 # 3 que sera usado nas divisoes
    addi $s1, $zero, 0  # inicializa soma com 0

loop:
    div  $s0, $t2         # divide $s0 por 3 (resultado no hi/lo)
    mfhi $t3              # resto da divis�o armazenado em $t3
    bne  $t3, $zero, skip # se resto for diferente de 0, n�o � m�ltiplo de 3, pula soma

    add  $s1, $s1, $s0    # soma n�mero a soma total

skip:
    addi $s0, $s0, 1      # incrementa contador
    slt  $t4, $t1, $s0    # verifica se $t1 < $s0 (fim do loop)
    beq  $t4, $zero, loop # Se $t4 for igual a 0, continua o loop

    # armazena resultado na mem�ria
    lui  $t5, 0x1001      # parte alta do endere�o da vari�vel soma
    sw   $s1, 0x0000($t5) # salva soma na mem�ria

