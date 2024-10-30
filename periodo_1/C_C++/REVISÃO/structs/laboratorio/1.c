/*
1) Crie uma estrutura denominada pessoa, contendo nome, idade e o endereço residencial. 
2) Crie uma instância estática e uma instância dinâmica dessa estrutura, fazendo a leitura dos dados do teclado. 
3) Após a leitura, imprima os dados lidos.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct ENDERECO {

    char rua[40];
    int numero;
    char bairro[20];

};

struct PESSOA {

    char nome[40];
    int idade;
    struct ENDERECO endereco;

} p1;

typedef struct PESSOA pessoa;

void lerPessoaEst(){

    printf("\nNome: "); gets(p1.nome); setbuf(stdin, NULL);
    
    printf("\nIdade: "); scanf("%d", &p1.idade); setbuf(stdin, NULL);
    
    printf("\nEndereco: \n");

    printf("\n   Rua: "); gets(p1.endereco.rua); setbuf(stdin, NULL);

    printf("\n   N° da casa: "); scanf("%d", &p1.endereco.numero); setbuf(stdin, NULL);

    printf("\n   Bairro: "); gets(p1.endereco.bairro); setbuf(stdin, NULL);
    
}   

void imprimePessoaE(){

    printf("\n\nPESSOA ESTATICA\n\n");

    printf("NOME: %s \n\n", p1.nome);
    printf("IDADE: %d \n\n", p1.idade);
    printf("Rua: %s \n\n", p1.endereco.rua);
    printf("N° da casa: %d \n\n", p1.endereco.numero);
    printf("Bairro: %s \n\n", p1.endereco.bairro);
}

void lerPessoaDin(pessoa *D){

    printf("\n\n=============================================================\n\n");

    printf("\nNome: "); gets(D -> nome); setbuf(stdin, NULL);

    printf("\nIdade: "); scanf("%d", &D -> idade); setbuf(stdin, NULL);

    printf("\nEndereco: \n");

    printf("\n    Rua: "); gets(D->endereco.rua); setbuf(stdin, NULL);

    printf("\n    N° da casa: "); scanf("%d", &D -> endereco.numero); setbuf(stdin, NULL);

    printf("\n    Bairro: "); gets(D -> endereco.bairro); setbuf(stdin, NULL);

    printf("\n\n=============================================================\n\n");
}

void imprimePessoaD(pessoa *D){

    printf("\n\nPESSOA DINAMICA\n\n");

    printf("NOME: %s \n\n", D->nome);
    printf("IDADE: %d \n\n", D->idade);
    printf("Rua: %s \n\n", D->endereco.rua);
    printf("N° da casa: %d \n\n", D->endereco.numero);
    printf("Bairro: %s \n\n", D->endereco.bairro);
}

int main(){

    lerPessoaEst();

    imprimePessoaE();

    pessoa *pessoaD;

    pessoaD = (pessoa *) malloc(sizeof(pessoa));

    lerPessoaDin(pessoaD);
    imprimePessoaD(pessoaD);

    free(pessoaD);
}