%Definição fatorial
%fat(n) = 1 se n = 0
%fat(n) = n * fat(n-1), se n > 0

fatorial(0, 1):-!. %Caso base: Fatorial de 0 é 1

fatorial(N, F):- %fat(numero, resultado).

    N > 0, %Condição: N é maior que 0

    M is N-1, %Simplificando: Reduz a intância e armazena em M (N = 5, então M = 4)

    fatorial(M, R), %Obtem instancia menor, chamando a função dentro dela mesma

    F is N*R, %Solução Final: F recebe o resultado das multiplicações

%Resultado de todas as intancias
    write("N = "), write(N), write(" Fat = "), writeln(F).

%Redução da instancia
fatorial(N):- fatorial(N, F), write("Fat = "), writeln(F).

