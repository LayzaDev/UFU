#include <stdio.h>
#include <stdlib.h>

int main(){

    int lin = 3, col = 3;
    int mat[lin][col];
    int V[3];

    if(mat[col] != sizeof(V)){

        printf("ERROR \n\n");
        return 0;
    }

    printf("Insira elementos na matriz: \n");

    for(int i = 0; i < lin; i++){
        for(int j = 0; j < col; j++){

            scanf("%d ", &mat[i][j]);
        }
    }

    printf("Insira elementos no vetor: \n");

    for(int j = 0; j < col; j++){
        printf("%d ", &V[j]);
    }

    int *resultado = (int *) malloc(col * sizeof(int));

    for (int i = 0; i < lin - 1; i++){
            resultado[i] = 0;
        for(int j = 0; j < col - 1; j++){

            resultado[i] += mat[i][j] * V[j];
        }
    }

    printf("\nRESULTADO \n\n");

    for(int i = 0; i < 3; i++){
        printf("%d ", resultado[i]);
    }

    return 0;
}