/*

Escreva uma função que calcule e retorne o número neperiano e, e = 2,71828183..., que é a base para os logaritmos naturais.
A função deve ter como parâmetro o número de termos que serão somados, N. 
Note que quanto maior esse número, mais próxima do valor e estará da resposta        

e = 1/n!
*/

#include <stdio.h>
#include <stdlib.h>

float Fatorial(float N){

    if(N == 0 || N == 1){

        return 1;

    } else {

        return N *= Fatorial(N - 1);
    }
    
}

float calcula_e(float n){

    float e = 0.0;

    e += 1 / Fatorial(n);

    return e;
}

int main(){

    float N;

    printf("Valor de N: "); scanf("%f", &N);

    Fatorial(N);

    float neperiano = calcula_e(N);

    printf("\n\nNumero Neperiano\n\n");

    printf("e = %f \n", neperiano);

    return 0;
}