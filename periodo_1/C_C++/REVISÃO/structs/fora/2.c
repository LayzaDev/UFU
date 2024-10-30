#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*
    Crie uma struct atleta que possui os seguintes dados: 
    - nome
    - struct dados (em que dados é uma outra struct)com as seguintes informações: Qtd de partidas, Qtd de gols;

    Feito isso, crie uma matriz do tipo atleta e aloque-a dinamicamente.
    Após isso, crie uma função chamada insereNaMatriz, essa função recebe: O ponteiro pra matriz 
    Faz a inserção de 5 atletas dentro da matriz e retorna a matriz;
    Por fim, dentro da main mostre o nome de cada atleta que está dentro da matriz e sua média de gols.
*/

struct DADOS {
    int qtd_partidas;
    int qtd_gols; 
};

struct ATLETA {

    char nome[40];
    int idade;
    struct DADOS dados;
};

typedef struct ATLETA atleta;

atleta **insereNaMatriz(atleta **m){

    for(int i = 0; i < 5; i++){
        for(int j = 0; j < 5; j++){
            atleta **A;
            printf("\nNome do atleta: "); fgets(A[i][j].nome, 40, stdin);
            printf("\nIdade do atleta: "); scanf("%d", &A[i][j].idade);
            printf("\nQuantidade de partidas: "); scanf("%d", &A[i][j].dados.qtd_partidas);
            printf("\nQuantidade de gols: "); scanf("%d", &A[i][j].dados.qtd_gols);
           
            m[i][j] = A[i][j];

        }
    }

    return m;
}

int main(){

    atleta **matriz = (atleta **) malloc(5 * sizeof(atleta *));
    for(int i = 0; i < 5; i++){
        matriz[i] = (atleta *) malloc(5 * sizeof(atleta));
    }

    atleta **a = insereNaMatriz(matriz);

    float media = 0;

    media = a.dados.qtd_gols / a.dados.qtd_partidas;

    printf("INFORMAÇÕES DO ATLETA\n\n");

    for (int i = 0; i < 5; i++){
        for(int j = 0; j < 5; j++){
            printf("NOME: %s \n", a[i][j].nome);
            printf("IDADE: %d \n", a[i][j].idade);
            printf("MEDIA DE GOLS: %f \n", media);
        }
    }

    return 0;
}