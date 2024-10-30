/*
1) Crie uma estrutura que represente um atleta. 
2) A estrutura deve conter o nome do atleta, seu esporte, idade, peso e altura. 
3) Escreva um programa que leia os dados de cinco atletas em um vetor. 
4) Calcule e exiba os nomes do atleta mais alto e do atleta mais velho.
5) Escreva uma função fazer a leitura da estrutura.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct ATLETA 
{
    char nome[40];
    char esporte[20];
    int idade;
    float peso, altura;
};

typedef struct ATLETA atleta;

void lerAtleta(atleta *v){

    printf("\nNome: "); scanf("%s", &v->nome);

    printf("\nEsporte: "); scanf("%s", &v->esporte);

    printf("\nIdade: "); scanf("%d", &v->idade);

    printf("\nPeso: "); scanf("%f", &v->peso);

    printf("\nAltura: "); scanf("%f", &v->altura);

    setbuf(stdin, NULL);

    printf("\n\n");
}

void maiorAltura(atleta *v){

    float maisAlto = 0;
    char nomeMaisAlto[40];
    
    for(int i = 0; i < 5; i++){

        if(maisAlto < v[i].altura){

            maisAlto = v[i].altura;
            strcpy(nomeMaisAlto, v[i].nome);

        }
    }

    printf("\nO atleta mais alto eh '%s' com '%.2f' m. \n\n", nomeMaisAlto, maisAlto);
}

void maiorIdade(atleta *v){

    int maisVelho = 0;
    char nomeMaisVelho[40];

    for(int i = 0; i < 5; i++){

        if(maisVelho < v[i].idade){

            maisVelho = v[i].idade;
            strcpy(nomeMaisVelho, v[i].nome);

        }
    }

    printf("\nO atleta mais velho eh '%s' com '%d' anos. \n\n", nomeMaisVelho, maisVelho);

}

int main(){

    atleta v[3];

    for(int i = 0; i < 3; i++){
        lerAtleta(&v[i]);
    }

    maiorAltura(v);
    maiorIdade(v);

    return 0;
}