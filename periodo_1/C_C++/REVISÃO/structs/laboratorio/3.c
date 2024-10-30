/*
1) Crie uma estrutura que represente um atleta. 
2) A estrutura deve conter o nome do atleta, seu esporte, idade, peso e altura.
3) Escreva um programa que execute as seguintes funções:
    - Função 1: criar um atleta com alocação dinâmica e retornar a instância
    - Função 2: criar um atleta estático e retorná-lo
    - Função 3: imprimir um vetor de atletas recebidos por parâmetro
    - Função 4: imprimir um atleta recebido por valor
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct ATLETA {

    char nome[40];
    char esporte[40];
    int idade;
    float peso, altura;
};

typedef struct ATLETA atleta;

// Função 1: criar um atleta com alocação dinâmica e retornar a instância
atleta *criaAtletaDin(){

    atleta *atletaD = (atleta *) malloc(sizeof(atleta));

    printf("\nNome: "); scanf("%s", &atletaD->nome);

    printf("\nEsporte: "); scanf("%s", &atletaD->esporte);

    printf("\nIdade: "); scanf("%d", &atletaD->idade);

    printf("\nPeso: "); scanf("%f", &atletaD->peso);

    printf("\nAltura: "); scanf("%f", &atletaD->altura);

    setbuf(stdin, NULL);

    printf("\n\n");

    return atletaD;
}

void imprimeAtletaPar(atleta *grupoAtlet, int qtd_Atlet){

    printf("\n\nATLETA DINAMICA\n\n");

    for(int i = 0; i < qtd_Atlet; i++){

        printf("NOME: %s \n\n", grupoAtlet[i].nome);

        printf("ESPORTE: %s \n\n", grupoAtlet[i].esporte);

        printf("IDADE: %d \n\n", grupoAtlet[i].idade);

        printf("PESO: %.2f \n\n", grupoAtlet[i].peso);

        printf("ALTURA: %.2f \n\n", grupoAtlet[i].altura);

    }
}

atleta criarAtletaEst(){

    atleta atletaE;

    printf("\nNome: "); scanf("%s", &atletaE.nome);

    printf("\nEsporte: "); scanf("%s", &atletaE.esporte);

    printf("\nIdade: "); scanf("%d", &atletaE.idade);

    printf("\nPeso: "); scanf("%f", &atletaE.peso);

    printf("\nAltura: "); scanf("%f", &atletaE.altura);

    setbuf(stdin, NULL);

    printf("\n\n");

    return atletaE;
}

void imprimeAtletaVal(atleta atlet){

    printf("\n\nATLETA ESTATICO\n\n");

    printf("NOME: %s \n\n", atlet.nome);
    printf("ESPORTE: %s \n\n", atlet.esporte);
    printf("IDADE: %d \n\n", atlet.idade);
    printf("PESO: %.2f \n\n", atlet.peso);
    printf("ALTURA: %.2f \n\n", atlet.altura);
}

int main(){

    int qtd_atletas = 3;
    atleta *attD, attE;

    for(int i = 0; i < qtd_atletas; i++){

        criaAtletaDin();
        
    }

    imprimeAtletaPar(attD, qtd_atletas);
    
    criarAtletaEst();
    imprimeAtletaVal(attE);

    return 0;
}