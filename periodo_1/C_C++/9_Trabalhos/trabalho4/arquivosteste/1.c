#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){

    char nome1[30]; 
    printf("\n Nome do arquivo 1: "); gets(nome1);

    FILE *arq1 = fopen(nome1, "r"); 

    if(arq1 == NULL){
        printf("Erro na abertura do arquivo 1 \n");
        system("pause");
        exit(1);
         printf("dentro \n");
    }

    char nome2[30];
    printf("\n Nome do arquivo 2: "); gets(nome2);

    FILE *arq2 = fopen(nome2, "r");

    if(arq2 == NULL){
        printf("Erro na abertura do arquivo 2 \n");
        system("pause");
        exit(1);
    }

    FILE *arq3 = fopen("destino.txt", "w");

    if(arq3 == NULL){
        printf("Erro na abertura do arquivo 3 \n");
        system("pause");
        exit(1);
    }

    char buffer[1024];

    while(!feof(arq1)){
        fgets(buffer, 1024, arq1);
        fputs(buffer, arq3);
    }

    while(!feof(arq2)){
        fgets(buffer, 1024, arq2);
        fputs(buffer, arq3);
    }

    fclose(arq1); fclose(arq2); fclose(arq3);

    return 0;
}