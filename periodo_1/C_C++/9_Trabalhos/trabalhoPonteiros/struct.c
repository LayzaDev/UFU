#include <stdio.h>
#include <stdlib.h>

struct aluno {
    int matricula;
    struct aluno *proximo;
    
};

typedef struct aluno Aluno;

int main(){

    Aluno *lista = (Aluno *) malloc(sizeof(Aluno));

    lista -> matricula = 12345;
    lista -> proximo = (Aluno *) malloc(sizeof(Aluno));
    lista -> proximo -> matricula = 23455;
    lista -> proximo -> proximo = (Aluno *) malloc(sizeof(Aluno));
    lista -> proximo -> proximo  -> matricula = 45466;

    return 0;
}
