# Arquitetura e Organização de Computadores I 🖥️

Este repositório reúne os exercícios, tarefas práticas e avaliação final desenvolvidos ao longo da disciplina **Arquitetura e Organização de Computadores I**, cursada na Universidade Federal de Pelotas (UFPel).

## 📘 Sobre a disciplina

A disciplina aborda os fundamentos da arquitetura de computadores, incluindo representação de dados, organização do processador, ciclos de instrução, e programação em linguagem de montagem (Assembly).

Durante o semestre, os códigos foram desenvolvidos em **Assembly MIPS**, utilizando simuladores como **MARS**.

## 📂 Conteúdo do repositório

- 📌 **Tarefas** — implementações de exercícios sobre os conceitos vistos em aula;
- 🧪 **Avaliação final** — trabalho final avaliativo.

## ⚙️ Tecnologias e Ferramentas

- Linguagem: **Assembly MIPS**
- Simuladores utilizados:
  - [MARS (MIPS Assembler and Runtime Simulator)](http://courses.missouristate.edu/kenvollmar/mars/)

### Descrição das tarefas:
 ##### 💾 Tarefa 1 — Operações com Palavras e Múltiplos
- Questão 1:
Programa em MIPS que lê 10 palavras armazenadas a partir do endereço 0x10010000, calcula a soma e a média desses valores, e armazena os resultados nas posições de memória reservadas (.space).

.data <br>
.word 1 <br>
.word 2 <br>
.word 3 <br>
.word 4 <br>
.word 5 <br>
.word 6 <br>
.word 7 <br>
.word 8 <br>
.word 9 <br>
.word 10 <br>
soma: .space 4 <br>
média: .space 4 

- Questão 2:
Programa que calcula a soma de todos os números múltiplos de 3 no intervalo de 1 a 300.

#### 🔁 Tarefa 2 — Manipulação de Strings e Vetores
- Questão 1:
Programa em MIPS que percorre uma string e capitaliza a última letra de cada palavra.
A string é armazenada a partir do endereço 0x10010000 e é modificada no próprio local.
A entrada é composta apenas por letras minúsculas e espaços (podendo haver múltiplos espaços entre palavras).

Exemplo de entrada: <br>
.data <br>
string: .asciiz "eu sou aluno do centro de desenvolvimento tecnologico da ufpel" <br>

Saída esperada: <br>
"eU soU alunO dO centrO dE desenvolvimentO tecnologicO dA ufpeL"

- Questão 2:
Programa que inverte a ordem dos elementos de um vetor .word com 5 posições.
A modificação ocorre no próprio vetor, sem alocação de um novo espaço em memória.

Exemplo: <br>
Entrada: 1, 2, 3, 4, 5  <br>
Saída:   5, 4, 3, 2, 1 <br>
Endereço inicial: 0x10010000 <br>

#### 📚 Tarefa 3 — Controle de Fluxo e Entrada/Saída
- Questão 1:
Programa em MIPS que lê três notas de um aluno, calcula a média e exibe a situação acadêmica de acordo com as regras da universidade:

Situação    |	Condição <br>
Reprovado	|   média < 3 <br>
Exame	    |   3 ≤ média < 7 <br>
Aprovado	|   média ≥ 7 <br>

O programa permanece em laço, solicitando ao usuário se deseja continuar ou sair: <br>
0 para continuar <br>
1 para encerrar 

Utiliza syscalls para leitura de notas, exibição da média e situação, e controle do laço.

- Questão 2:
Programa que lê um número inteiro, armazena no registrador $t0 e imprime a tabuada desse número (de 1 a 10), utilizando chamadas de sistema para entrada e saída de dados.

Exemplo de entrada: <br>
Digite um número: 5 <br>
Saída esperada: <br>
5 x 1 = 5 <br>
5 x 2 = 10 <br>
... <br>
5 x 10 = 50

#### 🧮 Tarefa 4 — Sub-rotinas e Processamento de Vetores
- Questão 1:
Crie um programa para calcular a soma S de todos os números pares dentre os N números informados
pelo usuário. Inicialmente, o número N deverá ser lido pelo teclado e, logo depois, serão lidos os N valores. Os
N valores lidos devem ser armazenados na memória. O resultado S da soma de pares deverá ser apresentado na
tela, assim como a quantidade Q de valores pares. Você deve criar uma sub-rotina para a leitura dos valores
e uma sub-rotina para encontrar e somar os pares.

### Descrição trabalho final:
Nesse projeto, foi feito um programa de calculadora que apresena um menu com diversas opções, desde operações básicas da matématica (adição, subtração, multplicação e divisão) até cálculos de áreas de figuras geométricas (triângulo e círculo) e também cálculo de fatorial. O programa deixa o usuário escolher o que quer realizar, executa a operação correspondente e exibe o resultado, com tratamento de erros para evitar divisões por zero.