#include <stdio.h>
#include <stdlib.h>

int **insere(int **mat, int lin, int col){

    printf("Insira elementos na matriz: \n");

    for (int i = 0; i < lin; i++){
        for(int j = 0; j < col; j++){

            scanf("%d ", &mat[i][j]);
        }
        printf("\n");
    }

    printf("\n");

    return mat;
}

// Insertion sort or selection sort

int **ordena(int **matriz, int linhas, int colunas){
    int aux, menor = matriz[0][0]; 
    for(int i = 0; i < linhas; i++){
        for(int j = 0; j < colunas; j++){

            if(matriz[i][j] < menor){
                aux = menor; 
                menor = matriz[i][j];
                matriz[i][j] = aux;
            }

        }
        printf("\n");
    }

    printf("\n");

    return matriz;
}

int main(){

    int linha = 3;
    int coluna = 4;

    int **m = (int **) malloc(linha * sizeof(int *));
    for(int i = 0; i < linha; i++){
        m[i] = (int *) malloc(coluna * sizeof(int));
    }

    int inserir = insere(m, linha, coluna);

    int ordem = ordena(m, linha, coluna);

    printf("Matriz não ordenada \n\n"); 

    printf("%d ", inserir);

    printf("MATRIZ ORDENADA \n\n");

    printf("%d ", ordem);

    return 0;
}