#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Crie uma estrutura que represente um atleta.
   A estrutura deve conter: 
        - nome do atleta
        - seu esporte
        - idade
        - peso
        - altura. 
   Escreva um programa que leia os dados de cinco atletas em um vetor. 
   Calcule e exiba os nomes do atleta mais alto e do atleta mais velho.
   Escreva uma função fazer a leitura da estrutura.
*/

typedef struct ATLETA {

    char nome[40];
    char esporte[40];
    int idade;
    float peso, altura;

} atleta;

void leitura(atleta *V) {

    printf("\nNome: "); scanf("%s", &V->nome);

    printf("\nEsporte: "); scanf("%s", &V->esporte);

    printf("\nIdade: "); scanf("%d", &V->idade);

    printf("\nPeso: "); scanf("%f", &V->peso);

    printf("\nAltura: "); scanf("%f", &V->altura);

    setbuf(stdin, NULL);

    printf("\n\n=========================================================\n\n");
}

int main(){

    atleta A[2];

    for(int i = 0; i < 2; i++){

        leitura(&A[i]);
    }

    // Atleta mais alto

    float maiorAltura = A[0].altura;

    for(int i = 1; i < 2; i++){

        if(maiorAltura < A[i].altura){

            maiorAltura = A[i].altura;

        }
        printf("Maior atleta: %s com altura de %.2f kg \n\n ", maiorAltura, A[i].nome);
    }
   
    return 0;
}