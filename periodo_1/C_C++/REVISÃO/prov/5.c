#include <stdio.h>
#include <stdlib.h>

void crescente(int N){

    if(N == 0 || N == 1){

        printf("%d ", N);

    } else {

        if(N >= 0){

            crescente(N - 2);
            printf("%d ", N);
        }
    }
}

void decrescente(int N){

    if(N == 0 || N == 1){

        printf("%d ", N);

    } else {
        if(N >= 0){

            printf("%d ", N);
            decrescente(N - 2);
        }
    }
}

int main(){

    int valor = 20;

    printf("\ncrescente: "); crescente(20);

    printf("\n\ndecrescente: "); decrescente(20);

    printf("\n\ncrescente: "); crescente(21);

    printf("\n\ndecrescente: "); decrescente(21);

    printf("\n\n");

    return 0;
}