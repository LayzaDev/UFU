/*
    Crie um programa que contenha um vetor de inteiros contendo cinco elementos.
    Utilizando apenas aritmética de ponteiros, leia esse vetor do teclado e imprima o DOBRO de cada valor lido.

*/

#include <stdio.h>
#include <stdlib.h>

int main(){

    int *vetor[5]; 
    int *p = vetor[5];

    p = (int *) malloc(5 * sizeof(int));

    printf("Insira elementos no vetor: \n\n"); 

    for(int i = 0; i < 5; i++){

        scanf("%d ", &*p + i);

    }

    printf("DOBRO \n\n");

    for(int i = 0; i < 5; i++){

       printf("%d ", *(p + i) * 2); 
    }

    free(p);

    return 0;
}