#include <stdio.h>
#include <stdlib.h>

void ordena(float *v, float N){

    int aux;

    for(int i = 0; i < N; i++){
        for(int j = i+1; j < N; j++){

            if(v[i] > v[j]){

                aux = v[j];
                v[j] = v[i];
                v[i] = aux;

            }
        }
    }
}

int main(){

    float v[5] = {3, 1, 5, 2, 6};

    float *v1 = (float *) malloc(5 * sizeof(float));
    float *v2 = (float *) calloc(5, sizeof(float));

    ordena(v, 5);

    printf("\n\n");

    for(int i = 0; i < 5; i++){

        printf("%.2f ", v[i]);
    }

    printf("\n\n");

    return 0;
}