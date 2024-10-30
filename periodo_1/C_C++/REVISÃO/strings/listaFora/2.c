
/* Crie uma estrutura denominada Poligono. Essa estrutura 
deverá conter uma lista de um ou mais pontos que definem 
um polígono. A lista é definida pela estrutura Ponto, que 
contém as posições X e Y e um ponteiro chamado Proximo do 
mesmo tipo da estrutura Ponto. Faça um programa que declare 
um Poligono denominado triangulo que contém os pontos 
{5,3}, {1,1}, {1,5} e um polígono denominado retângulo 
que contém os pontos {1,1}, {1,3}, {5,1}, {5,3}. */

#include <stdio.h>
#include <stdlib.h>

struct PONTO {

    int X, Y;
    struct PONTO *proximo;

};

typedef struct POLIGONO {

    struct PONTO lista;

}poligono;


int main(){

    //{5,3}, {1,1}, {1,5}

    poligono triangulo;

    triangulo.lista.X = 5;
    triangulo.lista.Y = 3;
    triangulo.lista.proximo = malloc(sizeof(struct PONTO));
    triangulo.lista.proximo->X = 1;
    triangulo.lista.proximo->Y = 1;
    triangulo.lista.proximo->proximo = malloc(sizeof(struct PONTO));
    triangulo.lista.proximo->proximo->X = 1;
    triangulo.lista.proximo->proximo->Y = 5;

    //{1,1}, {1,3}, {5,1}, {5,3}

    poligono retangulo;

    retangulo.lista.X = 1;
    retangulo.lista.Y = 1;
    retangulo.lista.proximo = malloc(sizeof(struct PONTO));
    retangulo.lista.proximo->X = 1;
    retangulo.lista.proximo->Y = 3;
    retangulo.lista.proximo->proximo = malloc(sizeof(struct PONTO));
    retangulo.lista.proximo->proximo->X = 5;
    retangulo.lista.proximo->proximo->Y = 1;
    retangulo.lista.proximo->proximo->proximo = malloc(sizeof(struct PONTO));
    retangulo.lista.proximo->proximo->proximo->X = 5;
    triangulo.lista.proximo->proximo->proximo->Y = 3;
    
    return 0;
}