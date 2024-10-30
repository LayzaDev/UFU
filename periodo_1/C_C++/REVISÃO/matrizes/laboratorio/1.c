/*
ORDENE UMA MATRIZ COM DOIS LAÇOS ALOCADA DINAMICAMENTE
*/

#include <stdio.h>
#include <stdlib.h>
#define lin 3
#define col 4

int main(){

    float matriz[lin][col] ={ { 51, 21, 32, 4 },
                { 5, 60, 7, 80 },
                { 9, 10, 110, 12 }}, aux;

    for(int i = 0; i < lin*col; i++){
        for(int j = i+1; j < lin*col; j++){

            if(matriz[i / col][i % col] > matriz[j / col][j % col]){

                aux = matriz[i / col][i % col];
                matriz[i / col][i % col] = matriz[j/col][j%col];
                matriz[j/col][j%col] = aux;

            }
        }
    } 
    
    printf("\n\n======================================================\n\n");

    printf("MATRIZ ORDENADA\n\n");

    for(int i = 0; i < lin * col; i++){

        printf("%.0f ", matriz[i/col][i%col]);

        if(i % col == col - 1){
            printf("\n");
        }
    }

    printf("\n\n======================================================\n\n");


    return 0;
}