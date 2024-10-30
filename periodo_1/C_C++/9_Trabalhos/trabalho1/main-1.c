// ALUNA: LAYZA NAUANE DE PAULA SILVA
// N° MATRICULA: 12211BSI251

#include <stdio.h>

int main(){

    // Declarando o vetor de tamanho 20 e variavel auxiliar;
    float vetor[20], valor; 

    // Loop para percorrer o vetor e inserir elementos no vetor
    for(int i = 0; i < 20; i++){

        printf("Digite um numero real: \n");
        scanf("%f", &valor);

        // Inserindo elementos digitados pelo usuario no vetor
        vetor[i] = valor;

    } 

    // Loop para percorrer o vetor
    for(int i = 0; i < 20; i++){

        int aux;

        // Loop para ordenar o vetor
        for(int next = i + 1; next < 20; next++){

            // Condição para verificar qual elemento é maior e ordena-lo
            if(vetor[i] > vetor[next]){

                aux = vetor[i];

                vetor[i] = vetor[next];

                vetor[next] = aux;

            }
        }

        printf("Vetor ordenado: %.2f \n", vetor[i]);

    }

    return 0;
    
}