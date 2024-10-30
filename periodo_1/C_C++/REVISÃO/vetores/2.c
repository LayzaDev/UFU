/*
Escreva um algoritmo que leia um vetor de N elementos. 
Após a digitação do último valor, encontre e mostre o maior elemento.
*/


#include <stdio.h>
#include <stdlib.h>

int main(){

    int N;

    printf("Defina o tamanho de N: ");
    scanf("%d", &N);

    int vetor[N];

    printf("Insira elementos no vetor: \n");

    for(int i = 0; i < N; i++){

        scanf("%d ", &vetor[i]);
    
    }

    int maior = vetor[0];

    for(int i = 1; i <= N; i++){

        if(maior < vetor[i]){

            maior = vetor[i];
            
        }
    }

    printf("Maior: %d \n", maior);

    return 0;
    
}