/*
    Crie um programa que contenha um vetor estático e um vetor dinâmico de float contendo 10 elementos cada. 
    Imprima o endereço e o conteúdo de cada posição desses vetores.
*/

#include <stdio.h>
#include <stdlib.h>

int main(){

    printf("VETOR ESTATICO \n\n");

    float vetorE[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

    for(int i = 0; i < 10; i++){

        printf("CONTEUDO[%d]: %.2f \n", i, vetorE[i]);

        printf("ENDERECO[%d]: %p \n", i, vetorE + i);

    }

    printf("\n\n");

    printf("VETOR DINAMICO \n\n");

    float *vetorD, *p;
    p = vetorD;

    p = (float *) malloc(10 * sizeof(float));

    if(p == NULL){
        printf("ERRO");
        system("pause");
        exit(1);
    }

    printf("Insira elementos no vetor dinamico: \n");
    
    for(int i = 0; i < 10; i++){

        scanf("%f", &p[i]);

    }

    for(int i = 0; i < 10; i++){

        printf("CONTEUDO[%d]: %.2f \n", i, *(p + i));
        printf("ENDERECO[%d]: %p \n", i, p + i);

    }

    return 0;
}