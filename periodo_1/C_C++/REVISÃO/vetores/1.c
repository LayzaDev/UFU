#include <stdio.h>
#include <stdio.h>

/*
Leia um vetor de 10 elementos. 
Imprima os elementos do vetor identificando se cada valor lido é par ou ímpar.
*/
int main(){

    int vetor[10];

    printf("Insira elementos no vetor: \n");

    for(int i = 0; i < 10; i++){
        scanf("%d ", &vetor[i]);
    }
    
    for(int i = 0; i < 10; i++){

        if(vetor[i] % 2 == 0){
            printf("Eh par: %d \n", vetor[i]);
        }

        if(vetor[i] % 2 != 0){
            printf("Eh impar: %d \n", vetor[i]);
        }
    }

    return 0;
}