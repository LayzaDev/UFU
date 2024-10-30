#include <stdio.h>
#include <stdlib.h>
/*
    Escrever um algoritmo para obter a soma de duas matrizes A e B, alocadas dinamicamente,
    Crie uma funcao soma para fazer a soma das matrizes e armazenar o resultado em uma terceira matriz C

    matrizC = matrizA + matrizB;
*/
int **SOMA(int **mA, int linA, int colA, int **mB, int linB, int colB ){

    int **mC, linC = 2, colC = 3;

    mC = (int **) malloc(linC * sizeof(int *));
    for(int i = 0; i < linC; i++){
        mC[i] = (int *) malloc(colC * sizeof(int));
    }

    for(int i = 0; i < linC; i++){
        for(int j = 0; j < colC; j++){

            mC[i][j] = mA[linA][colA] + mB[linB][colB];
        }
    }

    printf("Matriz C \n\n");

    for(int i = 0; i < linC; i++){
        for(int j = 0; j < colC; j++){
            printf("%d ", mC[i][j]);
        }
    }

    return 0;
}

int main(){

    int **matrizA, linhaA = 2, colunaA = 3;

    matrizA = (int **) malloc(linhaA * sizeof(int *));
    for(int i = 0; i < linhaA; i++){
        matrizA[i] = (int *) malloc(colunaA * sizeof(int));
    }

    printf("Insira elementos na Matriz A:  \n\n"); 

    for(int i = 0; i < linhaA; i++){
        for(int j = 0; j < colunaA; j++){

            scanf("%d ", &matrizA[i][j]);
        }
    }

    printf("\n\n");

    for(int i = 0; i < linhaA; i++){
        for(int j = 0; j < colunaA; j++){

            printf("%d ", matrizA[i][j]);
        }
        printf("\n");
    }

    printf("====================================================== \n");

    int **matrizB, linhaB=2, colunaB=3;

    matrizB = (int **) malloc(linhaB * sizeof(int *));
    for(int i = 0; i < linhaB; i++){
        matrizB[i] = (int *) malloc(colunaB * sizeof(int));
    }

    printf("Insira elementos na matriz B: \n");

    for(int i = 0; i < linhaB; i++){
        for(int j = 0; j < colunaB; j++){
            
            scanf("%d ", &matrizB[i][j]);
        }
    }

    printf("\n\n");

    for(int i = 0; i < linhaB; i++){
        for(int j = 0; j < colunaB; j++){

            printf("%d ", matrizB[i][j]);
        }
        printf("\n");
    }

    SOMA(matrizA, linhaA, colunaA, matrizB, linhaB, colunaB);

    return 0;
}