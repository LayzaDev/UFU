%definição do grau de parentesco do tipo pai
pai(andre, carla).
pai(andre, diego).
pai(andre, gael).
pai(diego, fabio).

%definição dos membros masculinos
masculino(andre).
masculino(diego).
masculino(gael).
masculino(fabio).

%definição do grau de parentesco do tipo mãe
mae(bernadete, carla).
mae(bernadete, diego).
mae(elisa, fabio).

%definição dos membros femininos
feminino(bernadete).
feminino(carla).
feminino(elisa).

%definição da regra do grau de parentesco do tipo avó
avo(B, F) :- feminino(B), mae(B, D), pai(D, F).

%definição da regra do grau de parentesco do tipo tia
tia(C, F) :- feminino(C), pai(A, C), pai(A, D), mae(B, C), mae(B, D), pai(D, F), C\==D.

%definição da regra do grau de parentesco do tipo irmão
irmao(X, Y) :- pai(A, X), pai(A, Y), X\==Y.

%definição da regra do grau de parentesco do tipo irmão completo
irmao_completo(D, C) :- pai(A, D), pai(A, C), mae(B, D), mae(B, C), D\==C.

