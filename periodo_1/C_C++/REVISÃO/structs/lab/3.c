#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/*
Crie uma estrutura que represente um atleta que contenha:
- nome do atleta
- seu esporte
- idade
- peso
- altura. 
*/

typedef struct ATLETA{

    char nome[40];
    char esporte[40];
    int idade;
    float peso;
    float altura;

} atleta;

/*
Função 1: criar um atleta dinamico e retornar a instância
*/

atleta *criaAtletaD(){

    atleta *novoAtletaD = (atleta *) malloc(sizeof(atleta));

    printf("\n\nINFORMAÇÕES DO ATLETA DINAMICO \n\n");

    printf("Nome: "); scanf("%s", &novoAtletaD->nome);

    printf("Esporte: "); scanf("%s", &novoAtletaD->esporte);

    printf("Idade: "); scanf("%d", &novoAtletaD->idade);

    printf("Peso: "); scanf("%f", &novoAtletaD->peso);

    printf("Altura: "); scanf("%f", &novoAtletaD->altura);

    return(novoAtletaD);
}

/*
Função 2: criar um atleta estático e retorná-lo
*/

atleta criaAtletaE(){

    atleta novoAtletaE;

    printf("\n\nINFORMAÇÕES ATLETA ESTATICO \n\n");

    printf("Nome: "); scanf("%s", &novoAtletaE.nome);

    printf("Esporte: "); scanf("%s", &novoAtletaE.esporte);

    printf("Idade: "); scanf("%d", &novoAtletaE.idade);

    printf("Peso: "); scanf("%f", &novoAtletaE.peso);

    printf("Altura: "); scanf("%f", &novoAtletaE.altura);

    return(novoAtletaE);
}

/*
Função 3: imprimir um vetor de atletas recebidos por parâmetro
*/

void *imprimeAtletaPorParametro(atleta *p){

    for(int i = 0; i < 3; i++){
        
        printf("Nome: %s \n", p[i].nome);

        printf("Esporte: %s \n", p[i].esporte); 

        printf("Idade: %d \n", p[i].idade); 

        printf("Peso: %f \n", p[i].peso); 

        printf("Altura: %f \n", p[i].altura); 
        
    }
}

/*
Função 4: imprimir um atleta recebido por valor
*/

void imprimeAtletaPorValor(atleta v){

    for(int i = 0; i < 3; i++){

        printf("Nome: %s \n", v.nome);

        printf("Esporte: %s \n", v.esporte); 

        printf("Idade: %d \n", v.idade); 

        printf("Peso: %f \n", v.peso); 

        printf("Altura: %f \n", v.altura); 
        
    }
}

int main(){

    atleta *Din = criaAtletaD();

    atleta Est = criaAtletaE();

    imprimeAtletaPorParametro(Din); 
    imprimeAtletaPorValor(Est);
    
    return 0;
}