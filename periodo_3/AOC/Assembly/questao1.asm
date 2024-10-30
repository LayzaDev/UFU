.data
	inicio: .asciiz "Vetor: "
	mensagem1: .asciiz "\nEntre com um inteiro: "
	espaco: .asciiz "-"
	vetor: .align 2
.	space 84

.text
main:
       li $s0, 4              # Contador de vezes que o programa irá imprimir
       li $v0, 4              # Carrega 4 em $v0 para imprimir string que está em $a0
       la $a0, inicio         # Passa o endereço da string "inicio" para $a0
       syscall                # Imprime a string que está em $a0
       beq $s0, $zero, exit   # Se já tiver executado 3 vezes, acaba
       li $t0, 0              # Variável que armazena o índice para imprimir
       li $t1, 84             # Variável que armazena o tamanho do vetor
       li $t2, 0              # Variável que armazena o elemento lido
       li $t3, 0              # Variável que armazena o elemento para ser colocado no vetor
       li $t4, 0              # Variável que armazena os índices pares
       li $t5, 4              # Variável que armazena os índices ímpares

inicializacao:             # Função para inicializar o vetor com zeros
       beq $t0, $t1, imprimir # Se o índice atual == tamanho máximo, sai do loop para imprimir
       sw $zero, vetor($t0)   # Preencher elemento atual com zero
       addi $t0, $t0, 4       # Atualiza índice para próxima posição
       j inicializacao        # Chama a função "inicialização" novamente

imprimir:                  # Função para imprimir elementos do vetor
      li $t0, 0              # Volta índice de 84 para 0
      sub $s0, $s0, 1        # Decrementa total de impressões
imprime:                     # Subfunção onde a impressão acontecerá
      beq $t0, $t1, sairDaImpressao # Se índice == tamanho máximo, sai da impressão
      li $v0, 1              # 1 em $v0 para imprimir inteiro que está em $a0
      lw $a0, vetor($t0)     # Coloca o elemento do índice ($t0) em $a0 para ser impresso
      syscall                # Imprime elemento na tela
      li $v0, 4              # 4 em $v0 para imprimir string que está em $a0
      la $a0, espaco         # Passa o endereço da string para $a0
      syscall                # Imprime "-" para separar os elementos
      addi $t0, $t0, 4       # Atualiza índice para próxima posição
      j imprime              # Chama a função novamente

sairDaImpressao:           # Função que determina se sairá do programa ou pedirá mais um número do teclado
      bne $s0, $zero, repete # Se não executou o programa o máximo de vezes, continua
      j exit                 # Se não, sai

repete:                    # Função para pedir um número do teclado
      li $v0, 4              # 4 em $v0 para imprimir string que está em $a0
      la $a0, mensagem1      # Passa o endereço da string "mensagem1" para $a0
      syscall                # Imprime pedindo um inteiro
      li $v0, 5              # 5 em $v0 para ler um inteiro do teclado, valor fornecido pelo usuário vai para $v0
      syscall                # Pega um inteiro do teclado
      add $t2, $zero, $v0    # Passa valor lido para uma variável
      li $s1, 3              # Contador de vezes que o preenchimento do vetor será executado
      beq $t2, $zero, foiZero # Se valor digitado pelo usuário for zero vai para função "foiZero", senão segue para função "naoFoiZero"

naoFoiZero:                 # Função para preencher 3 índices pares do vetor
      beq $s1, $zero, imprimir # Se já preencheu 3 posições, irá imprimir o vetor
      sll $t3, $t4, 2         # Variável que guarda o elemento a ser adicionado no vetor -> t3 = (índice) * 4
      sw $t3, vetor($t4)      # Vetor na posição $t4 recebe conteúdo de $t3 -> vetor[$t4] = $t3
      addi $t4, $t4, 8        # Atualiza índice somando 8 para pular uma posição e ir para o próximo índice par
      sub $s1, $s1, 1         # Subtrai 1 do contador de vezes que repete o preenchimento
      j naoFoiZero            # Chama a função novamente

foiZero:                    # Função para preencher 3 índices ímpares do vetor
      beq $s1, $zero, imprimir # Se já preencheu 3 posições, irá imprimir o vetor
      li $t3, 13              # Carrega 13 em $t3, variável que guarda elemento a ser adicionado no vetor
      sw $t3, vetor($t5)      # Vetor na posição $t5 recebe conteúdo de $t3 -> vetor[$t5] = $t3 = 13
      addi $t5, $t5, 8        # Atualiza índice somando 8, indo para o próximo índice ímpar
      sub $s1, $s1, 1         # Subtrai 1 do contador de vezes que repete o preenchimento
      j foiZero               # Chama a função novamente

exit:                      # Função para encerrar o programa
      li $v0, 10   

