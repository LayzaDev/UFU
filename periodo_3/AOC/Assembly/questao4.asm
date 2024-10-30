.data
	#Declaração de Strings para X, Y e Z
	
	X: .asciiz "\nInforme o valor de X: " 
	Y: .asciiz "\nInforme o valor de Y: "  
	Z: .asciiz "\nInforme o valor de Z: " 
	
	resultado: .asciiz "\nO resultado da equação é: "  # Declaração da String para o resultado
	
	novoCalculo: .asciiz "\n\nDeseja realizar um novo cálculo? S/N  "  # Declaração da String para perguntar sobre um novo cálculo

.text

loop:
	
	# Pegando o valor de X
	
	li $v0, 4            # Carrega o código do sistema para imprimir uma string
	la $a0, X            # Carrega o endereço da variavel X para $a0
	syscall              # Chama a syscall para imprimir a String
	
	li $v0, 5            # Carrega o código do sistema para ler um inteiro
	syscall              # Chama a syscall para ler um inteiro
	add $t0, $zero, $v0  # Move o valor lido para $t0
	
	# Pegando o valor de Y
	
	li $v0, 4            # Carrega o código do sistema para imprimir uma string
	la $a0, Y            # Carrega o endereço da variavel Y para $a0
	syscall              # Chama a syscall para imprimir a String
	
	li $v0, 5            # Carrega o código do sistema para ler um inteiro
	syscall              # Chama a syscall para ler um inteiro
	add $t1, $zero, $v0  # Move o valor lido para $t1 
	
	# Pegando o valor de Z
	
	li $v0, 4            # Carrega o código do sistema para imprimir uma string
	la $a0, Z            # Carrega o endereço da variavel Z para $a0
	syscall              # Chama a syscall para imprimir a String
	
	li $v0, 5            # Carrega o código do sistema para ler um inteiro
	syscall              # Chama a syscall para ler um inteiro
	add $t2, $zero, $v0  # Move o valor lido para $t2
	
	# Cálculo da equação
	
	mul $t3, $t0, $t0    # $t3 = $t0 * $t0 => $t3 = x * x
	mul $t4, $t3, $t0    # $t4 = $t3 * St0 => $t4 = (x * x) * x
	li $s0, 3            # Carrega o valor 3 para $s0
	mul $t5, $s0, $t4    # $t5 = $s0 * $t4 => $t5 = 3 * x³
	
	mul $t6, $t1, $t1    # $t6 = $t1 * $t1 => $t6 = y * y
	li $s1, 4            # Carrega o valor 4 para $s1
	mul $t6, $s1, $t6    # $t6 = $s1 * $t6 => $t6 = 4 * y²
	
	li $s2, 10           # Carrega o valor 10 para $s2
	mul $t7, $s2, $t2    # $t7 = $s2 * $t2 => $t7 = 10 * z
	
	li $s3, 2            # Carrega o valor 2 para $s3
	
	sub $s4, $t5, $t6    # $s4 = $t5 - $t6 => $s4 = 3x³ - 4y²
	add $s5, $s4, $t7    # $s5 = $s4 + $t7 => $s5 = (3x³ - 4y²) + 10z
	sub $s6, $s5, $s3    # $s6 = s5 - $s3 => $s6 = (3x³ - 4y² + 10z) - 2
	
	# Impressão do resultado
	
	li $v0, 4            # Carrega o código do sistema para imprimir uma string
	la $a0, resultado    # Carrega o endereço da variavel resultado para $a0
	syscall              # Chama a syscall para imprimir a String
	
	add $a0, $zero, $s6  # Move o valor de $s6 para $a0
	li $v0, 1            # Carrega o código do sistema para imprimir inteiro
	syscall              # Chama a syscall para imprimir o valor em $a0
	
	# Pergunta se o usuário deseja fazer uma nova equação
	
	li $v0, 4            # Carrega o código do sistema para imprimir uma string
	la $a0, novoCalculo  # Carrega o endereço da variavel novoCalculo para $a0
	syscall              # Chama a syscall para imprimir a String
	
	li $v0, 12           # Carrega o código do sistema para pegar o caracter de decisão do usuário (S/N))
	li $a0, '\n'         # Carrega o valor '\n' em $a0
	syscall              # Chama a syscall para imprimir a String
	
	beq $v0, 'N', exit   # Se a resposta for 'N' ou 'n', vai para o exit para encerrar o programa
	beq $v0, 'n', exit
	
	j loop               #Se a resposta for 'S' ou 's' da um jump para o loop para fazer um novo calulo

exit:

	li $v0, 10           # Carrega o código do sistema para encerrar o programa
	syscall              # Chama a syscall para imprimir a String 

	
