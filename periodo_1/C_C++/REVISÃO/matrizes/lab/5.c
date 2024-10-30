/*
ESCREVA UM PROGRAMA QUE LEIA DUAS MATRIZES E APRESENTE A
MULTIPLICAÇÃO DELAS. EXECUTE EM MODO DE DEPURAÇÃO PARA
VERIFICAR SE O ALGORITMO EXECUTA AS OPERAÇÕES CORRETAMENTE.
*/

#include <stdio.h>
#include <stdlib.h>

int main(){

    int linA = 3, colA = 2, linB = 2, colB = 3;

    int matrizA[linA][colA];

    printf("\n==================================================\n\n");

    printf("Insira elementos na Matriz A: \n\n");

    for(int i = 0; i < linA; i++){
        for(int j = 0; j < colA; j++){

            scanf("%d ", &matrizA[i][j]);
        }
    }

    printf("\n\n==================================================\n\n");

    printf("MATRIZ A \n\n");

    for(int i = 0; i < linA; i++){
        for(int j = 0; j < colA; j++){

            printf("%d ", matrizA[i][j]);
        }
        printf("\n");
    }
    
    int matrizB[linB][colB];

    printf("\n\n==================================================\n\n");

    printf("Insira elementos na Matriz B: \n\n");

    for(int i = 0; i < linB; i++){
        for(int j = 0; j < colB; j++){

            scanf("%d ", &matrizB[i][j]);
        }
    }

    printf("\n\n==================================================\n\n");

    printf("MATRIZ B \n\n");

    for(int i = 0; i < linB; i++){
        for(int j = 0; j < colB; j++){

            printf("%d ", matrizB[i][j]);
        }
        printf("\n");
    }

    printf("\n\n==================================================\n\n");

    int matrizR[linA][colB];

    printf("MULTIPLICACAO\n\n");

    for(int i = 0; i < linA; i++){
        for(int j = 0; j < colB; j++){
            for(int k = 0; k < colA; k++){

                matrizR[i][j] += matrizA[i][k] * matrizB[k][j];
            }
        }
    }

    for(int i = 0; i < linA; i++){
        for(int j = 0; j < colB; j++){

            printf("%d ", matrizR[i][j]);

        }
        printf("\n");
    }

    printf("\n\n==================================================\n\n");

    return 0;
}