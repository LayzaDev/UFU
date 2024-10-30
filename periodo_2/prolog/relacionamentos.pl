%Definindo Fatos: Estabelece um relacionamento incondicional entre
% objetos de um contexto

mulher(ana).
mulher(eva).
mulher(clô).
mulher(bia).
homem(bob).
homem(ivo).
homem(rui).
homem(raí).
casal(ana, bob).
casal(eva, ivo).
casal(clô, rui).
gerou(ana, clô).
gerou(bob, clô).
gerou(clô, bia).
gerou(rui, bia).
irmao(rui, rai).
tio(rai, bia).

% Definindo Regras: Estabelecem um relacionamento condicional entre
% objetos de um contexto.

casal(X, Y) :- gerou(X, Z), gerou(Y, Z),  X \= Y, !.

mae(X, Y) :- mulher(X), gerou(X, Y).

pai(X, Y) :- homem(X), gerou(X, Y).

filho(X, Y) :- homem(X), gerou(Y, X).

filha(X, Y) :- mulher(X), gerou(Y, X).

avo(X, Y) :- mae(X, Z), gerou(Z, Y).

avoo(X, Y) :- pai(X, Z), gerou(Z, Y).

irmao(X, Y) :- pai(Z, X), pai(Z, Y), mae(M, X), mae(M, Y), X \= Y.

tio(X, Y) :- irmao(X, Z), gerou(Z, Y), X \= Z.

