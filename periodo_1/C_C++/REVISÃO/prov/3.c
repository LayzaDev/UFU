/*  
Crie uma função que receba uma matriz A alocada dinamicamente contendo 5 linhas e 5 colunas. 
Calcule na própria matriz A a sua transposta (se B é a matriz transposta de A, então A[i][j] = B[j][i])
*/

#include <stdio.h>
#include <stdlib.h>

void **transposta(int **matA, int linA, int colA){

    int **matB, linB, colB;

    for(int i = 0; i < linA; i++){
        for(int j = 0; j < colA; j++){

            matB[i][j] = matA[j][i];
            
        }
        printf("\n\n");
    }

    for(int i = 0; i < linB; i++){
        for(int j = 0; j < colB; j++){

            matA[i][j] = matB[j][i];
        }
        printf("\n\n");
    }  

    printf("\n\nMATRIZ TRANSPOSTA \n\n");

    for(int i = 0; i < linA; i++){
        for(int j = 0; j < colA; j++){

            printf("%d ", matA[i][j]);
        }
        printf("\n");
    };
}

int main(){

    int linhas = 3, colunas = 3;

    int **matA = (int **) malloc(linhas * sizeof(int *));
    for(int i = 0; i <linhas; i++){
        matA[i] = (int *) malloc (colunas * sizeof(int));
    }

    printf("Insira elementos na Matriz A: \n");

    for(int i = 0; i < linhas; i++){
        for(int j = 0; j < colunas; j++){

            scanf("%d", &matA[i][j]);
        }
        printf("\n");
    }

    printf("\n\nMATRIZ ORIGINAL \n\n");

    for(int i = 0; i < linhas; i++){
        for(int j = 0; j < colunas; j++){

            printf("%d ", matA[i][j]);

        }
        printf("\n");
    }

    transposta(matA, linhas, colunas);

    return 0;
}