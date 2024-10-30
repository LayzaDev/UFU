/*
Crie uma estrutura denominada Retângulo. 
Essa estrutura deverá conter o ponto superior esquerdo e o ponto inferior direito do retângulo. 
Cada ponto é definido pela estrutura Ponto, que contém as posições X e Y. 
Faça um programa que declare e leia uma estrutura Retângulo e exiba a área, o perímetro e o comprimento da diagonal desse retângulo.
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct PONTO{

    int X;
    int Y;

};

typedef struct RETANGULO{

    struct PONTO supEsq, infDir;
    
} retangulo;

int Area(int x1, int y1, int x2, int y2){

    int area; 

    area = ((x2 - x1) * (y1 - y2));

    return area;

}

int Perimetro(int x1, int y1, int x2, int y2){

    int perimetro; 

    perimetro = ((2 * (x2 - x1)) + (2 * (y1 - y2)));

    return perimetro;

}

float Diametro(int x1, int y1, int x2, int y2){

    float diametro;

    diametro = sqrt(pow((x2 - x1), 2)+ pow((y1 - y2),2));

    return diametro;
}

int main(){

    retangulo r;

    printf("\n\n===============================================\n\n");
    printf(" Valor do ponto superior esquerdo X: ");
    scanf("%d", &r.supEsq.X);

    printf("\n\n Valor do ponto superior esquerdo Y: ");
    scanf("%d", &r.supEsq.Y);

    printf("\n\n P1(%d, %d)", r.supEsq.X, r.supEsq.Y);

    printf("\n\n===============================================\n\n");

    printf(" Valor do ponto inferior direito X: ");
    scanf("%d", &r.infDir.X);

    printf("\n\n Valor do ponto inferior direito Y: ");
    scanf("%d", &r.infDir.Y);

    printf("\n\n P2(%d, %d)", r.infDir.X, r.infDir.Y);
    
    printf("\n\n===============================================\n\n");

    int area = Area(r.supEsq.X, r.supEsq.Y, r.infDir.X, r.infDir.Y);
    printf("AREA: %d ", area);

    printf("\n\n===============================================\n\n");

    int perimetro = Perimetro(r.supEsq.X, r.supEsq.Y, r.infDir.X, r.infDir.Y);
    printf("PERIMETRO: %d ", perimetro);

    printf("\n\n===============================================\n\n");

    float diametro = Diametro(r.supEsq.X, r.supEsq.Y, r.infDir.X, r.infDir.Y);
    printf("DIAMETRO: %.2f ", diametro);

    printf("\n\n===============================================\n\n");

    return 0;
}