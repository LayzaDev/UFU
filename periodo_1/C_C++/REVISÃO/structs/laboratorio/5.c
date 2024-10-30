/*
1) Crie uma estrutura denominada Retângulo. 
2) Essa estrutura deverá conter o ponto superior esquerdo e o ponto inferior direito do retângulo. 
3) Cada ponto é definido pela estrutura Ponto, que contém as posições X e Y. 
4) Faça um programa que declare e leia uma estrutura Retângulo e leia um Ponto,
   e informe se esse ponto está ou não está dentro do retângulo.
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct PONTO {
    int X;
    int Y;
}ponto;

typedef struct RETANGULO {

    struct PONTO supEsq, infDir;
    
}retangulo;

int main(){

    retangulo r;
    ponto p;

    printf("\n\n===============================================\n\n");

    printf("PONTO SUPERIOR ESQUERDO (X, Y)\n\n");

    printf("Ponto X: ");
    scanf("%d", &r.supEsq.X);

    printf("\nPonto Y: ");
    scanf("%d", &r.supEsq.Y);

    printf("\nP1(%d, %d)", r.supEsq.X, r.supEsq.Y);

    printf("\n\n===============================================\n\n");

    printf("PONTO INFERIOR DIREITO (X, Y)\n\n");

    printf("Ponto X: ");
    scanf("%d", &r.infDir.X);

    printf("\nPonto Y: ");
    scanf("%d", &r.infDir.Y);

    printf("\nP2(%d, %d)", r.infDir.X, r.infDir.Y);

    printf("\n\n===============================================\n\n");

    printf("PONTO PARA CONFERIR (X, Y)\n\n");

    printf("Ponto X: ");
    scanf("%d", &p.X);

    printf("\nPonto Y: ");
    scanf("%d", &p.Y);

    printf("\nP(%d, %d)", p.X, p.Y);

    printf("\n\n===============================================\n\n");

    printf("RESPOSTA \n\n");

    if(p.X >= r.supEsq.X && p.X <= r.infDir.X){
        if(p.Y >= r.infDir.Y && p.Y <= r.supEsq.Y){

            printf("P(%d, %d) esta dentro do retangulo. \n\n", p.X,p.Y);
            
        } else {

            printf("P(%d, %d) nao esta dentro do retangulo. \n\n", p.X,p.Y);

        }
    } else {

        printf("P(%d, %d) nao esta dentro do retangulo.", p.X,p.Y);
    }

    printf("===============================================\n\n");
    
    return 0;
}