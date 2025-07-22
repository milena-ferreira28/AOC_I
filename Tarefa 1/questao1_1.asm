#Milena Alves Ferreira

.data
word1: .word 1
word2: .word 2
word3: .word 3
word4: .word 4
word5: .word 5
word6: .word 6
word7: .word 7
word8: .word 8
word9: .word 9
word10: .word 10
soma: .space 4
media: .space 4

.text 

	lui $s0, 0x1001
	ori $t1, $t1, 40 #10 palavras de 4 bytes cada
        add $t1, $s0, $t1
         
	addi $s2, $zero, 0 #Zera o contador de palavras
	addi $s3, $zero, 0 #Zera o acumulador da soma
         
         
 loop:	 lw  $s1, 0($s0) #carrega a palavra na memória
         add $s3, $s3, $s1 #soma o valor no acumulador
         addi $s0, $s0, 4 #aponta pro próximo endereço de memória
         addi $s2, $s2, 1 #incrementa o contador
         slt $t2, $s0, $t1 #se $s0 < $t1, então $t2 = 1
         bne $t2, $zero, loop #enquanto $t2 for diferende de 0 o loop continua
         
         lui $t4, 0x1001 #parte alta do endereço da soma
         addi $t4, $t4, 0x28 #parte baixa do endereço da soma
         sw $s3, 0($t4) #armazena soma na mem´oria
         
         div $s3, $s2 #divide soma pelo numero de palavras
         mflo $t3 
         
         lui $t5, 0x1001 #parte alta do endereço de media
         addi $t5, $t5, 0x2C #parte baixa do endereço de media
         sw $t3, 0($t5) #armazena media na memoria