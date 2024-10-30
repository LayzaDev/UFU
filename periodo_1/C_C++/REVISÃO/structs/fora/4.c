#include <stdio.h>
#include <stdlib.h>

struct livro {
    char isbn[13], titulo[30], **autores;
    int numautores;
    float preco;
};

struct livro *endereco(struct livro *x){
    int n = x -> numautores;
    struct livro *y = (struct livro*) malloc(sizeof(struct livro));

    strcpy(y->isbn, x->isbn);
    strcpy(y->titulo, x->titulo);
    y->autores = (char **) malloc(n * sizeof(char *));
    for(int i = 0; i < n; i++){
        y->autores[i] = (char *) malloc()
    }
}

int main(){


    return 0;
}