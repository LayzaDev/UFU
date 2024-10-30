.data
    prompt1:    .asciiz "Digite o primeiro número: "   # Mensagem para solicitar o primeiro número
    prompt2:    .asciiz "Digite o segundo número: "    # Mensagem para solicitar o segundo número
    prompt3:    .asciiz "Digite o terceiro número: "   # Mensagem para solicitar o terceiro número
    output:     .asciiz " O número lido é maior do que 15!\n"   # Mensagem para números maiores que 15
    maxNumber:  .word 0   # Variável para armazenar o número máximo

.text
.globl main

main:
    # Lê o primeiro número do teclado
    li $v0, 4            # Carrega o código do sistema para imprimir string
    la $a0, prompt1      # Carrega o endereço da mensagem para o primeiro número
    syscall              # Chama o sistema para imprimir a mensagem
    li $v0, 5            # Carrega o código do sistema para ler um inteiro
    syscall              # Chama o sistema para ler o inteiro
    add $t0, $v0,$zero        # Move o número lido para $t0

    # Lê o segundo número do teclado
    li $v0, 4            # Carrega o código do sistema para imprimir string
    la $a0, prompt2      # Carrega o endereço da mensagem para o segundo número
    syscall              # Chama o sistema para imprimir a mensagem
    li $v0, 5            # Carrega o código do sistema para ler um inteiro
    syscall              # Chama o sistema para ler o inteiro
    add $t1, $v0, $zero        # Move o número lido para $t1

    # Lê o terceiro número do teclado
    li $v0, 4            # Carrega o código do sistema para imprimir string
    la $a0, prompt3      # Carrega o endereço da mensagem para o terceiro número
    syscall              # Chama o sistema para imprimir a mensagem
    li $v0, 5            # Carrega o código do sistema para ler um inteiro
    syscall              # Chama o sistema para ler o inteiro
    add $t2, $v0, $zero        # Move o número lido para $t2

    # Encontra o maior número
    add $t3, $t0,$zero        # Inicializa $t3 com o primeiro número
    slt $t4, $t1, $t3     # $t4 = 1 se $t1 < $t3, senão $t4 = 0
    bne $t4, $zero, check_third_number # Se $t1 não é maior, verifica o terceiro número
    add $t3, $t1,$zero        # Se $t1 > $t3, atualiza $t3

check_third_number:
    slt $t4, $t2, $t3     # $t4 = 1 se $t2 < $t3, senão $t4 = 0
    bne $t4, $zero, print_result # Se $t2 não é maior, imprime o resultado
    add $t3, $t2,$zero       # Se $t2 > $t3, atualiza $t3

print_result:
    # Imprime o maior número
    li $v0, 1            # Carrega o código do sistema para imprimir inteiro
    add $a0, $t3,$zero         # Move o número máximo para imprimir
    syscall               # Chama o sistema para imprimir o número

    # Verifica se o número é maior que 15
    li $t4, 15           # Carrega o valor 15 para $t4
    slt $t5, $t3, $t4    # $t5 = 1 se $t3 < $t4, senão $t5 = 0

    # Se o número é maior que 15, imprime a mensagem
    bne $t5, $zero, end_program  # Se $t5 ≠ 0, pula para end_program
    li $v0, 4            # Carrega o código do sistema para imprimir string
    la $a0, output       # Carrega o endereço da mensagem para números maiores que 15
    syscall               # Chama o sistema para imprimir a mensagem

end_program:
    # Encerra o programa
    li $v0, 10     # Carrega o código do sistema para sair do programa
    syscall               # Chama o sistema para encerrar o programa