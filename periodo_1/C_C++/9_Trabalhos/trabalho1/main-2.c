// ALUNA: LAYZA NAUANE DE PAULA SILVA
// N° MATRICULA: 12211BSI251

#include <stdio.h>

int main(){

    // Declarando o vetor de tamanho 10 e variavel auxiliar;
    int vetor[10], valor;

    // Loop para percorrer o vetor
    for(int i = 0; i < 10; i++){

        // Inserir valor no vetor
        printf("Digite um numero: \n");
        scanf("%d", &valor);

        // Verificando se existe algum elemento igual aos valores que já estão no vetor
        for(int j = 0; j < 10; j++){

            while (vetor[j] == valor)
            {
                printf("Digite um numero diferente dos anteriores: \n");
                scanf("%d", &valor);
            }
        }

        // Inserindo elementos no vetor
        vetor[i] = valor;
    }

    for(int i = 0; i < 10; i++){

        printf("Vetor: %d \n", vetor[i]);

    }

    return 0;
}