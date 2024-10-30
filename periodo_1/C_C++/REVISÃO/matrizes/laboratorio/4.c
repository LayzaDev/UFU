/*
Utilizando structs para representar alunos e notas de uma turma
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct ALUNO{

    char nome[40];
    int matricula;
    float nota1, nota2, media;

}aluno;

int main(){

    aluno turma[3];

    for(int i = 0; i < 3; i++){

        printf("Nome do aluno %d: ", i+1);
        scanf("%s ", turma[i].nome); setbuf(stdin, NULL);
        printf("Matricula do aluno %d: ", i+1);
        scanf("%d ", &turma[i].matricula); setbuf(stdin, NULL);
        printf("Notas do aluno %d: ", i+1);
        scanf("%f %f", &turma[i].nota1, &turma[i].nota2); setbuf(stdin, NULL);

        turma[i].media = (turma[i].nota1 +  turma[i].nota2)/2;
    }

    for(int i = 0; i < 3; i++){

        printf("Aluno: %s \nMatricula: %d \nNota 1: %.2f \nNota 2: %.2f \nMedia: %.2f \n\n", 
        turma[i].nome, turma[i].matricula, turma[i].nota1, turma[i].nota2, turma[i].media);

    }

    return 0;
}