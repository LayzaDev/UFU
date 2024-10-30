#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void ordena(char V[][15], int N){

    char aux[15];

    for(int i = 0; i < N; i++){
        for(int j = i+1; j < N; j++){

            if(strcmp(V[i], V[j]) > 0){

                strcpy(aux, V[i]);
                strcpy(V[i], V[j]);
                strcpy(V[j], aux);

            }
        }
    }

    printf("\nORDENADO\n\n");

    for(int i = 0; i < N; i++){

        printf("%s, ", V[i]);

    }

    printf("\n\n");
    
}

int main(){

    char v[5][15] = {"manga", "uva", "abacaxi", "pera", "kiwi"};

    ordena(v, 5);

    return 0;
}