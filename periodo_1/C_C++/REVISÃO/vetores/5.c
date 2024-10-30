#include <stdio.h>
#include <stdlib.h>

/*
Leia n valores numéricos e os armazene no
vetor v. O valor de n também deve ser lido.
Calcule e exiba o valor da série S onde vi é o i-
ésimo valor armazenado no vetor v
*/
int main(){

    int N;

    printf("Valor de N: "); scanf("%d", &N);

    float V[N];

    printf("Insira elementos no vetor: \n");

    for(int i = 1; i <= N; i++){

        scanf("%f", &V[i]);
    }

    float S;

    for (int i = 1; i <= N; i++){


        S += (i / V[i]);

    }

    printf("%f ", S);
    
    return 0;
}