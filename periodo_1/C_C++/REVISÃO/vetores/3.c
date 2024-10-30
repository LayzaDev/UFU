/*
Leia 20 elementos em um vetor A e construa um novo vetor B com elementos de A, porém invertidos, 
ou seja, o primeiro elemento de A passa a ser o último elemento de B, e assim por diante.

Depois de criado o vetor B com os valores, imprima os 2 vetores.
Utilize uma constante para referenciar o tamanho do vetor:
#define
const int

*/

#include <stdio.h>
#include <stdlib.h>
#define TAM 5

int main(){

    int vetA[TAM], vetB[TAM];

    printf("\n=========================================================== \n\n");

    printf("Insira elementos no vetor A: \n\n");

    for(int i = 0; i < TAM; i++){

        scanf("%d ", &vetA[i]);
    }

    printf("\n=========================================================== \n\n");
    
    printf("A: ");

    for(int i = 0; i < TAM; i++){
        printf("%d ", vetA[i]);
    }

    printf("\n\n=========================================================== \n\n");

    for(int i = 0; i < TAM; i++){

        vetB[i] = vetA[TAM - i - 1];
    }

    printf("B: ");

    for(int i = 0; i < TAM; i++){
        printf("%d ", vetB[i]);
    }

    printf("\n\n=========================================================== \n\n");

    return 0;
}