#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(){

    int N; 

    printf("\nValor de N: "); scanf("%d", &N);

    printf("\n");

    int V[N];

    printf("\nInsira elementos no vetor: \n\n");

    for(int i = 1; i <= N; i++){

        scanf("%d", &V[i]);

    }
   
    float soma = 0;

    for(int i = 1; i <= N; i++){

        soma += V[i];

    }

    float m;

    m = soma/N;

    float somatorio;

    for(int i = 1; i <= N; i++){

        somatorio += ((V[i] - m) * (V[i] - m));
        
    }
    
    float prod;
 
    prod = somatorio * (1.0 / N);

    printf("\n=================================================\n\n");

    float d;

    d = sqrt(prod);

    printf("DESVIO PADRÃO\n\n");

    printf("%f", d);

    printf("\n=================================================\n\n");

    printf("MEDIA\n\n");

    printf("%f \n", m);

    printf("\n=================================================\n\n");

    return 0;
    
}