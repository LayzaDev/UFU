// ALUNA: LAYZA NAUANE DE PAULA SILVA
// N° MATRICULA: 12211BSI251

#include <stdio.h>
#include <math.h>

int main(){

    // Declaração de variaveis
    int n, valor, produto;
    int somatorio = 0, soma = 0; 
    float d, m;

    printf("Informe o valor de n: \n");
    scanf("%d", &n);

    // Vetor de tamanho n
    int V[n];

    // Loop para percorrer o vetor e inserir elementos
    for(int i = 0; i < n; i++){

        printf("Digite um numero: \n");
        scanf("%d", &valor);

        //Inserindo elementos no vetor
        V[i] = valor;
    }

    // Loop para percorrer o vetor e somar os elementos
    for(int i = 0; i < n; i++){

        // somando elementos do vetor
        soma += V[i];

    }

    // Media do vetor
    m = (soma / n);

    // Loop para percorrer o vetor e calcular o somatorio
    for(int i = 1; i <= n; i++){

        somatorio += ((V[i - 1] - m) * (V[i - 1] - m));

    }

    // calculo da variancia de uma amostra d
    d = (somatorio * (1 / (n-1)));

    printf("Valor de d: %.2f \n", d);

    printf("Media do vetor: %.2f \n", m);

    return 0;
}