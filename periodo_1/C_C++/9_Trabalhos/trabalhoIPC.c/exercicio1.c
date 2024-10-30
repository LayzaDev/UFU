// 1) Faça um programa que leia um vetor com 20 números de ponto flutuante. 
// 2) Em seguida, ordene os elementos desse vetor
// 3) Imprima o vetor na tela. 

#include <stdio.h>
#define TAM 5
int main(){

    // Declarar variavel
    float valor, maior;
    // Declarar vetor;

    float vetor[5];

    // Loop para percorrer o vetor
    for(int i = 0; i < 5; i++){

        //pegando os valores
        printf("Digite um numero: \n");
        scanf("%f", &valor);
        vetor[i] = valor;

        if(maior < vetor[i]){
           maior = vetor[i];
        }

    }


    for(int i = 0; i < 5; i++){

        printf("Ordenando: %.2f \n", maior);

    }
    return 0;
}