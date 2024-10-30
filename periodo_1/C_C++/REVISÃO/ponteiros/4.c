/*
Escreva um programa que leia um valor inteiro e positivo n. 
Caso o usuário informe um valor menor ou igual a zero,
o programa deve imprimir “valor inválido” e deve ler o valor novamente, 
até o que o usuário informe um valor inteiro e positivo. 
Após a leitura de n, o programa deve calcular E conforme a equação:
*/

#include <stdio.h>
#include <stdlib.h>

int FATORIAL(int n){

    if(n == 0 || n == 1){

        return 1;

    } else {

        return n * FATORIAL(n - 1);

    }
}

float calcula_E(int n){

    float E = 0.0;

    E += (1 / FATORIAL(n + 1));

    return E;

}

int main(){

    int N;
    float e;

    printf("Valor de N: \n");

    if(N > 0){ 

        FATORIAL(N);

        e = calcula_E(N);

    } else {

        while(N <= 0){

            printf("\nVALOR INVALIDO! \nDigite outro numero: ");
            scanf("%d", &N);
        }

    } 

    printf("E: %.3f \n", e);

    return 0;
}