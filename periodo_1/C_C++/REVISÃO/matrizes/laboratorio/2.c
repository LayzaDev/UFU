/*
Ordenar uma matriz
*/
#include <stdio.h>
#include <stdlib.h>
#define lin 3
#define col 4

int main(){

    float mat[lin][col] = {
        { 51, 21,  32,  4 },
        { 5, 60,  7,  80 },
        { 9, 10, 110, 12 } 
    }, aux;

    for(int i = 0; i < lin;i++){
        for(int j = 0; j < col; j++){
            for(int k = 0; k < lin; k++){
                for(int n = 0; n < col; n++){

                    if((i * col + j) < (k * col + n)){

                        if(mat[i][j] > mat[k][n]){

                            aux = mat[i][j];
                            mat[i][j] = mat[k][n];
                            mat[k][n] = aux;

                        }
                    }
                }
            }
        }
    }

    for(int i = 0; i < lin*col; i++){

        printf("%.0f ", mat[i/col][i%col]);

        if(i % col == col - 1){
            printf("\n");
        }
    }

}