/*
    Escreva uma função denominada COMBINACAO que calcule o número de combinações (sem repetição),
    ou seja, de quantas formas distintas é possível escolher S elementos de um conjunto de N elementos:

        comb(n, s) = n! / s! * (n - s)!

    A função COMBINACAO deve receber os parâmetros N e S com passagem por valor. 
    Ela deve chamar outra função, denominada FATORIAL para o cálculo dos fatoriais.
    Utilize o tipo long int para retorno das funções
*/

#include <stdio.h>
#include <stdlib.h>

long int FATORIAL(long int N ){
    if(N == 0 || N == 1){
        return 1;
    }else {

        return N *= FATORIAL(N - 1);
    }
}

long int COMBINACAO(long int N, long int S){

    long int comb = FATORIAL(N) / FATORIAL(S) * FATORIAL(N - S);

    return comb;

}

int main(){

    long int n, s;

    printf("Valor de N: "); scanf("%ld", &n);
    printf("\n");
    printf("Valor de S: "); scanf("%ld", &s);
    printf("\n");

    FATORIAL(n);
    long int comb = COMBINACAO(n, s);

    printf("C(%ld, %ld) = %ld \n", n, s, comb);

    return 0;
}