.data

str1: .asciiz "Entre com 5 inteiros: "
str2: .asciiz " O elemento do primeiro vetor é maior que o segundo \n"
str3: .asciiz " O elemento do primeiro vetor é igual ao segundo  \n"
str4: .asciiz " O elemento do primeiro vetor é menor que o segundo\n"
espaco: .asciiz "-"
str5: .asciiz "\nVetor 1 \n"
str6: .asciiz "\nVetor 2 \n"

vetor1:
    .align 2 	# alinha palavra na posicao correta
    .space 20	# aloca o espaço no array para 5 inteiros
    
vetor2:
    .align 2 	# alinha palavra na posicao correta
    .space 20	# aloca o espaço no array para 5 inteiros

.text

main:
    li $t0, 20         # $t0 recebe o tamanho dos vetores
    li $t1, 0          # $t1 recebe o indice atual
    li $t2, 0          # Elemento a ser adicionado no vetor
    li $v0, 4          # Carrega 4 em $v0 para imprimir string
    la $a0, str1       # Passa o endereço da string "Entre com 5 inteiros" para $a0
    syscall            # Imprime a mensagem

    # Preenche o vetor1 com valores inseridos pelo usuário
preencheVetor1:
    beq $t1, $t0, preencheVetor2   # Checa se o índice atual é igual ao tamanho máximo
    li $v0, 5                      # Pede um inteiro do teclado
    syscall 			   # Imprime a mensagem
    sw $v0, vetor1($t1)            # Coloca o elemento lido no vetor1 na posição $t1
    addi $t1, $t1, 4               # Incrementa o índice
    j preencheVetor1               # Chama a função novamente

    # Preenche o vetor2 com valores inseridos pelo usuário
preencheVetor2:
    li $t1, 0          		   # Zera o índice atual
    li $v0, 4                      # Carrega 4 em $v0 para imprimir string
    la $a0, str1                   # Passa o endereço da string "Entre com 5 inteiros" para $a0
    syscall                        # Imprime a mensagem

subPreenche2:
    beq $t1, $t0, compara          # Checa se o índice atual é igual ao tamanho máximo
    li $v0, 5                      # Pede um inteiro do teclado
    syscall 			   # Imprime a mensagem
    sw $v0, vetor2($t1)            # Coloca o elemento lido no vetor2 na posição $t1
    addi $t1, $t1, 4               # Incrementa o índice
    j subPreenche2                 # Chama a função novamente

compara:
    li $t1, 0                      # Zera o índice atual
comparacao:
    beq $t1, $t0, fim              # Se o índice atual == tamanho maximo, encerra
    lw $t2, vetor1($t1)            # Carrega elemento do vetor1
    lw $t3, vetor2($t1) 	   # Carrega elemento do vetor2
    slt $t4, $t2, $t3              # Se t2 < t3, t4=1, se não, t4=0
    bne $t4, $zero, ehMenor        # Se t4 != 0, vai para ehMenor
    beq $t2, $t3, ehIgual          # Se $t2 == $t3, vai para ehIgual
    j ehMaior			   

ehMenor:
    li $v0, 4          		   # Carrega 4 em $v0 para imprimir string
    la $a0, str4                   # Passa o endereço da string "O elemento do primeiro vetor eh menor que o segundo" para $a0
    syscall                        # Imprime a mensagem
    addi $t1, $t1, 4               # Atualiza o índice para a próxima posição
    j comparacao                   # Vai para a próxima comparação

ehIgual:
    li $v0, 4                      # Carrega 4 em $v0 para imprimir string
    la $a0, str3                   # Passa o endereço da string "O elemento do primeiro vetor eh igual ao segundo" para $a0
    syscall                        # Imprime a mensagem
    addi $t1, $t1, 4               # Atualiza o índice para a próxima posição
    j comparacao                   # Vai para a próxima comparação

ehMaior:
    li $v0, 4                      # Carrega 4 em $v0 para imprimir string
    la $a0, str2                   # Passa o endereço da string "O elemento do primeiro vetor eh maior que o segundo" para $a0
    syscall                        # Imprime a mensagem
    addi $t1, $t1, 4               # Atualiza o índice para a próxima posição
    j comparacao                   # Vai para a próxima comparação

fim:
    # Imprime o vetor1
    li $t1, 0                      # Zera o índice atual
   
imprime1:
    beq $t0, $t1, imprimeSegundoVetor # Se índice == tamanho máximo, imprime o segundo vetor
    li $v0, 1                      # Carrega 1 em $v0 para imprimir inteiro
    lw $a0, vetor1($t1)            # Coloca o elemento do vetor1 na posição $t1 em $a0 para ser impresso
    syscall                        # Imprime o elemento na tela
    li $v0, 4                      # Carrega 4 em $v0 para imprimir string
    la $a0, espaco                 # Passa o endereço da string "-" para $a0
    syscall                        # Imprime "-"
    addi $t1, $t1, 4               # Atualiza o índice para a próxima posição
    j imprime1                     # Chama a função novamente

imprimeSegundoVetor:
    li $t1, 0                      # Zera o índice atual
    
imprime2:
    beq $t0, $t1, sairDaImpressao  # Se índice == tamanho máximo, encerra
    li $v0, 1                      # Carrega 1 em $v0 para imprimir inteiro
    lw $a0, vetor2($t1)            # Coloca o elemento do vetor2 na posição $t1 em $a0 para ser impresso
    syscall                        # Imprime o elemento na tela
    li $v0, 4                      # Carrega 4 em $v0 para imprimir string
    la $a0, espaco                 # Passa o endereço da string "-" para $a0
    syscall                        # Imprime "-"
    addi $t1, $t1, 4               # Atualiza o índice para a próxima posição
    j imprime2                     # Chama a função novamente

sairDaImpressao:
    li $v0, 10                     # Carrega 10 em $v0 para encerrar o programa
    syscall                        # Chama a syscall para encerrar o programa
