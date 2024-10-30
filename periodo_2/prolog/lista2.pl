% Inserir na lista os números pares que estão entre N1 e N2

lista(N1, N2, L):-
    N1 =< N2,
    N1 mod 2 =:= 0,
    !,
    L = [N1, R],
    P is N1 + 2,
    lista(P, N2, R).

lista(N1, N2, L) :-
    N1 =< N2,
    P is N1 + 1,
    lista(P, N2, L).

lista(_,_,[]).

%lista(N1, N2) :- lista(N1, N2, R), write("Lista = "), writeln(R).


