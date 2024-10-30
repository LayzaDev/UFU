/*
Escreva um programa que leia uma matriz de 5x4 
e apresente todos os elementos de uma determinada linha “n”
*/

#include <stdio.h>
#include <stdlib.h>

int main(){

    printf("\n==================================================\n\n");

    int matriz[5][4];

    printf("Insira elementos na Matriz: \n\n");

    for(int i = 0; i < 5; i++){
        for(int j = 0; j < 4; j++){

            scanf("%d", &matriz[i][j]);
        }
    }

    printf("\n==================================================\n\n");

    printf("MATRIZ \n\n");

    for(int i = 0; i < 5; i++){
        for(int j = 0; j < 4; j++){

            printf("%d", matriz[i][j]);
        }
        printf("\n");
    }

    printf("\n==================================================\n\n");

    int n;

    printf("Escolha uma linha: ");
    scanf("%d", &n);

    printf("\n==================================================\n\n");

    printf("ELEMENTOS DA LINHA %d \n", n);

    for(int i = 0; i < 4; i++){

        printf("%d", matriz[n - 1][i]);
            
    }

    printf("\n\n==================================================\n\n");

    return 0;
}