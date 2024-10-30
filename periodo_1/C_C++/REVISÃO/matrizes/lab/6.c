#include <stdio.h>
#include <stdlib.h>
#define lin 3
#define col 4

// ordena matriz com dois laços

int main(){

    float mat[lin][col] = { { 51, 21,  32, 4 },
                        {5, 60,  7,  80 },
                        { 9, 10, 110, 12 }}, aux;

    for(int i = 0; i < lin * col; i++){
        for(int j = i+1; j < lin * col; j++){

            if(mat[i / col][i % col] > mat[j / col][j % col]){
                
                aux = mat[j/col][j%col];
                mat[j/col][j%col] = mat[i/col][i%col];
                mat[i/col][i%col] = aux;
            }
        }
    }


    for(int i = 0; i < lin * col; i++){ 

        printf("%.2f ", mat[i/col][i%col]);
        if(i % col == col-1){
            printf("\n");
        }
    }
    
    return 0;
}