/*
Faça um programa que crie um vetor de pessoas. 
Os dados de uma pessoa devem ser armazenados em um variavel do tipo struct. 
O programa deve permitir que o usuário digite o nome de 3 pessoas e a seguir imprimi os dados de todas as pessoas. 
A struct deve armazenar os dados de idade, peso e altura.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct PESSOA{

    char nome[40];
    int idade;
    float peso, altura;
    
} pessoa;

int main(){

    pessoa p[3];

    printf("Digite o nome de 3 pessoas: \n\n");

    for(int i = 0; i < 3; i++){

        printf("NOME: "); scanf("%s", &p[i].nome);
        printf("IDADE: "); scanf("%d", &p[i].idade);
        printf("PESO: "); scanf("%f", &p[i].peso);
        printf("ALTURA: "); scanf("%f", &p[i].altura);

    }  

    char nome[30];

    printf("Digite o nome do usuario que esta procurando: \n");
    scanf("%s ", &nome);

    printf("\n\nDADOS DA PESSOA \n\n");
    
    for(int i = 0; i < 3; i++){

        if(strcmp(nome, p[i].nome)== 0){

            printf("NOME: %s \n", p[i].nome);
            printf("IDADE: %d\n", p[i].idade);
            printf("PESO: %f\n", p[i].peso);
            printf("ALTURA: %f\n", p[i].altura);

        }
    }

    return 0;
}