/*
Escreva um programa exiba a soma dos números naturais menores que 100.000 que são múltiplos de 3 ou que são múltiplos de 5.
Nota: os números naturais são números inteiros positivos N = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12...} 
*/
#include <stdio.h>
#include <stdlib.h>

int main() {
    int N = 100000, soma = 0;

    int V[N];

    for(int i = 1; i < N; i++){

        if(V[i] % 3 == 0 || V[i] % 5 == 0){

            soma += V[i];
            
        }
    }
        
    printf("\n%d \n\n", soma);

    return 0;
}