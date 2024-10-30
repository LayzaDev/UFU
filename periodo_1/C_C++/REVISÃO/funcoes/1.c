/*
    Escreva uma função denominada MAIOR que receba por parâmetro dois números e retorne o maior deles.
    - Na função main do programa, apresentar a utilização da função:
        float a, b;
        a = 10; b = 5;

    printf(“O maior entre %f e %f é %f”, a, b, MAIOR(a,b)):
        a = 20; b = 50;
    printf(“O maior entre %f e %f é %f”, a, b, MAIOR(a,b)): 
*/

#include <stdio.h>
#include <stdlib.h>

float MAIOR(float A, float B){

    float maior;

    if(A < B){

        maior = B;
        
    } else {

        maior = A;
    }

    return maior;

}

int main(){

    float a = 10, b = 5;

    printf("\nO maior entre %.2f e %.2f eh %.2f \n \n", a, b, MAIOR(a,b));

    a = 20; b = 50;

    printf("O maior entre %.2f e %.2f é eh %.2f \n \n", a, b, MAIOR(a,b));

    return 0;
}