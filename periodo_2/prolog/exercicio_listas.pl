% Caso base: Quando N1 é maior que N2, não há mais números para adicionar à lista.
listaPares(N1, N2, []) :-
    N1 > N2, !.

% Caso base: Quando N1 e N2 são iguais, apenas adicionamos o número à lista se for par.
listaPares(N1, N2, [N1|Resto]) :-
   N1 mod 2 =:= 0, !,
   ProximoNum is N1 + 1,
   listaPares(ProximoNum, N2, Resto).

% Caso geral: Adiciona N1 à lista se for um número par, em seguida, chama recursivamente para o próximo número.
%listaPares(N1, N2, Lista) :-
%    N1 mod 2 =\= 0, !,
%    ProximoNum is N1 + 1,
%    listaPares(ProximoNum, N2, Lista).

% Caso geral: Se N1 for ímpar, apenas chama recursivamente para o próximo número.
listaPares(N1, N2, Lista) :-
    ProximoNum is N1 + 1,
    listaPares(ProximoNum, N2, Lista).

listaPares(N1, N2) :- listaPares(N1, N2, Lista), write("Lista: "), writeln(Lista).
