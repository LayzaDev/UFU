/*
crie um algoritmo que receba uma vetor de strings e retorne o seu inverso.

INPUT
string: "LAYZA"
OUTPUT
string: "AZYAL"
*/

#include <stdio.h>
#include <string.h>

int main(){

    char str[] = "ALGORITMO", aux;
    char tam = strlen(str);

    printf("PALAVRA ORIGINAL \n\n");

    for(int i = 0; i < tam; i++){
        printf("%c ", str[i]);
    }

    for(int i = 0; i < tam/2; i++){
        //amor
        aux = str[i]; //a m o r
        str[i] = str[tam - i - 1]; // r o m a
        str[tam - i - 1] = aux; // a m o r
    }

    printf("\n\nPALAVRA INVERTIDA \n\n");

    for(int i = 0; i < tam; i++){
        printf("%c ", str[i]);
    }

    printf("\n");

    return 0;


    
}

