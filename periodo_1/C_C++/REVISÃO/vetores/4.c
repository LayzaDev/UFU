
// Crie uma struct aluno que possui os seguintes dados: nome, struct notas, em que struct notas possui as seguintes propriedades
// notamatematica, notaportuges e notahistoria
// apos isso, crie 10 alunos e insira os em um vetor alunos.
// No fim do programa, orderne o vetor alunos com base em suas notas de matematica, o aluno com a menor nota deve ficar na primeira posicao do vetor, e com a maior deve ficar na ultima posicao

#include <stdio.h>
#include <stdlib.h>

struct NOTAS{
    
    float notamatematica;
    float notaportugues;
    float notahistoria;
};

typedef struct ALUNO {

    char nome[30];
    struct NOTAS notas;

} aluno;

int main(){

    aluno A[3];

    for(int i = 0; i < 3; i++){

        printf("Nome: "); scanf("%s", &A[i].nome);
        printf("Nota Matematica: "); scanf("%f", &A[i].notas.notamatematica);
        printf("Nota Portugues: "); scanf("%f", &A[i].notas.notaportugues);
        printf("Nota Historia: "); scanf("%f", &A[i].notas.notahistoria);
        setbuf(stdin, NULL);
    }
    // No fim do programa, orderne o vetor alunos com base em suas notas de matematica, o aluno com a menor nota deve ficar na primeira posicao do vetor, e com a maior deve ficar na ultima posicao

    aluno menorNota;
    for(int i = 0; i < 3; i++){
        for(int j = 0; j < (3 - 1); j++){

            if(A[j].notas.notamatematica > A[j+1].notas.notamatematica){

                menorNota = A[j+1];
                A[j+1] = A[j];
                A[j] = menorNota;

            }
        }
    }

    printf("\n\n=================================================================");

    for(int j = 0; j < 3; j++){

        printf("\n\n%s %f %f %f \n\n", A[j].nome, A[j].notas.notamatematica, A[j].notas.notaportugues, A[j].notas.notahistoria);
    }

    printf("\n\n");

    return 0;
};