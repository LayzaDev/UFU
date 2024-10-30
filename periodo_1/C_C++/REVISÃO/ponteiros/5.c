/*
1) Escreva um programa leia um valor inteiro N maior que zero. 
2) Se o valor de N for inválido, o usuário deve digitar outro até que ele seja válido (utilize um laço).
3) Em seguida, leia um vetor V contendo N posições de inteiros, em que cada valor deverá ser maior ou igual a 2.
4) Alocar esse vetor dinamicamente. Após a leitura, escreva outro laço para apresentar o vetor na saída padrão (printf). 
*/

#include <stdio.h>
#include <stdlib.h>

int main(){

    int N;
    
    printf("Valor de N: ");
    scanf("%d", &N);

    while(N <= 0){

        printf("\n\nValor invalido! N deve ser maior ou igual a zero!\n\n");
        scanf("%d", &N);

    }

    int *V = (int *) malloc (N * sizeof(int));

    printf("Insira elementos no vetor: \n");

    for(int i = 0; i < N; i++){

        if(N >= 2){
            scanf("%d ", &V[i]);
        } else {

            while(N <= 2){

                printf("\n Numero deve ser maior ou igual a 2! \n\n Digite outro numero: ");
                scanf("%d ", &V[i]);

            }
        }
    }

    printf("\n\nSAIDA \n\n");

    for(int i = 0; i < N; i++){

        printf("%d ", V[i]);

    }



    return 0;
}