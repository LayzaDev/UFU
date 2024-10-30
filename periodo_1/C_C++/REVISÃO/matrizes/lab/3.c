#include <stdio.h>
#include <stdlib.h>

/*
Escreva um programa que leia uma
matriz de 8x8 e mostre a soma dos
valores da diagonal principal.
*/

int main(){

    int lin = 8, col = 8;

    int **matriz = (int **) malloc(lin * sizeof(int *));
    for(int i = 0; i < lin; i++){
        matriz[i] = (int *) malloc(col * sizeof(int));
    }

    printf("\n==================================================\n\n");

    printf("Insira elementos na Matriz: \n\n");

    for(int i = 0; i < lin; i++){
        for(int j = 0; j < col; j++){

            scanf("%d", &matriz[i][j]);
        }
    }
    printf("\n==================================================\n\n");

    printf("MATRIZ\n\n");

    for(int i = 0; i < lin; i++){
        for(int j = 0; j < col; j++){

            printf("%d ", matriz[i][j]);
        }

        printf("\n");
    }

    printf("\n\n==================================================\n\n");

    int soma = 0;

    for(int i = 0; i < lin; i++){
        for(int j = 0; j < col; j++){
            
            if(i == j){

                soma += matriz[i][j];

            }
        }
    }

    printf("SOMA: %d ", soma);

    printf("\n\n==================================================\n\n");

    return 0;
}