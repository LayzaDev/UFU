L% Gerar uma lista com elementos naturais pares entre N1 e N2 (incluídos
% na lista se forem pares

lista(N1, N2, Lista) :-
    N1 =< N2, %Caso base: Se N1 <= N2, então, lista não vazia, continuar...
    N1 mod 2 =:= 0,  % Condição: Se o resto de N1 divido por 2 é 0, então é par
    !, % Corte para evitar backtracking e listas duplicadas
    Lista = [N1 | Resto],  % Adicionar numero par à lista
    Aux is N1 + 2,  % Avançar para o próximo número par
    lista(Aux, N2, Resto).  % Chamar recursivamente para o restante da lista
lista(N1, N2, Lista) :-
    N1 <= N2,
    Aux is N1 + 1,
    lista(Aux, N2, Lista).
lista(_, _, []).  % Caso base: a lista está vazia quando N1 > N2

lista2(N1, N2) :- lista(N1, N2, Lista), write("Lista = "), writeln(Aux).
