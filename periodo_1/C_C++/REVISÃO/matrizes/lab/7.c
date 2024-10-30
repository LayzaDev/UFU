#include <stdio.h>
#include <stdlib.h>
#define linhas 3
#define colunas 4 

void ordena(int **m){



}

int main(){

    float mat[linhas][colunas] = { { 51, 21,  32,  4 },
                                { 5, 60,  7,  80 },
                                { 9, 10, 110, 12 }}, aux;

    for(int i = 0; i < linhas; i++){
        for(int j = 0; j < colunas; j++){
            for(int k = 0; k < linhas; k++){
                for(int n = 0; n < colunas; n++){

                    if(i * colunas + j < k * colunas + n){
                        if(mat[i][j] > mat[k][n]){

                            aux = mat[k][n];
                            mat[k][n] = mat[i][j];
                            mat[i][j] = aux;

                        }
                    }
                }
            }
        }
    }

    for(int i = 0; i < linhas * colunas; i++){

        printf("%.2f ", mat[i/colunas][i%colunas]);

        if(i % colunas == colunas - 1){
            printf("\n");
        }
    }
    return 0;
}


