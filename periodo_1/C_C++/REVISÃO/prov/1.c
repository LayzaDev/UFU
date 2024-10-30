#include <stdio.h>
#include <stdlib.h>

void crescente(int n){

    //par crescente: 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20
    if(n == 0 || n == 1){

        printf("%d ", n);

    } else {

        //impar crescente: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21
        if(n >= 0){

            crescente(n - 2);
            printf("%d ", n);
        } 
    }
}

void decrescente(int n){

    //par descrescente: 20, 18, 16, 14, 12, 10, 8, 6, 4, 2, 0
    if(n == 0 || n == 1){

        printf("%d ", n);

    } else {
        // impar descrescente: 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1
        printf("%d ", n);
        decrescente(n - 2);
    }
}


int main(){

    int valor = 20;

    printf("Crescente: "); crescente(20);
    printf("\n");
    printf("Decrescente: "); decrescente(20);
    printf("\n");
    printf("Crescente: "); crescente(21);
    printf("\n");
    printf("Decrescente: "); decrescente(21); 
    printf("\n");

    return 0;
}