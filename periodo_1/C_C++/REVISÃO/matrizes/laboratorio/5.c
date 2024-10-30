/*
Utilizando ponteiros com matrizes e structs:
*/

#include <stdio.h>

typedef struct PESSOA
{
    char nome[40];
    int idade;
}pessoa;

int main(){

    pessoa pessoas[3] = {{"layza", 19}, {"Emanuel", 20}, {"José", 30}};

    pessoa *p;

    p = pessoas; 

    for(int i = 0; i < 3; i++){
        printf("Nome: %s \nIdade: %d \n", (p+i)->nome, (p+i)->idade);
    }
    
    return 0;
}