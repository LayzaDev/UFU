#include <stdio.h>
#include <stdlib.h>

int main(){

   float a, *b, **c, ***d;

   printf("Valor de A: ");
   scanf("%f", &a);

   b = &a;
   c = &b;
   d = &d;

   printf("dobro %.0f: %.0f", a, 2 * *b);
   printf("triplo %f: %f ", b, 3 * **c);
   printf("Quadruplo %f: %f ", a, 4 * ***d);
   
    
}