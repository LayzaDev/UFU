/*
    Escreva uma função que receba por parâmetro
    - altura
    - raio de um cilindro circular 
    E retorne o volume desse cilindro. 
    O volume do cilindro circular é calculado pela equação:
        V = pi * raio2 * altura
    em que pi = 3,141592
*/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

float cilindro(float H, float R){

    float pi = 3.141592;

    float V = pi * R * H;

    return V;
}

int main(){

    float h = 0.0, r;

    printf("Altura: "); 
    scanf("%f", &h);

    printf("Raio: "); 
    scanf("%f", &r);

    float volume = cilindro(h, r);

    printf("Volume do cilindro: %.2f \n", volume);

    return 0;
}