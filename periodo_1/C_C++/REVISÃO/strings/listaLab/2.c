#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){

    char str1[100];

    printf("Digite algo: "); fgets(str1, 100, stdin);
    printf("\nString 1: %s \n", str1);

    int tamanho = strlen(str1);
    printf("Tamanho da string: %d \n\n", tamanho);

    char str2[100];

    strcpy(str2, str1);
    printf("String 2: %s \n", str2);

    printf("Digite mais algo: "); fgets(str2, 100, stdin);

    printf("\nNovo conteudo da string 2: %s \n\n", str2);

    strcat(str1, str2);
    printf("Concatenacao str1 + str2: %s \n\n", str1);

    char busca[100]; 
    printf("Busca: "); gets(busca);

    int contagem = 0;
    int ocorrencia;

    for(int i = 0; i < 100; i++){

        while(ocorrencia != '\0'){
            ocorrencia++;
            ocorrencia = strstr(str1, busca);
            contagem++;
        }

    }

    printf("A palavra %s ocorreu %d vezes \n", busca, contagem);

    return 0;
}