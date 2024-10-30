// ALUNA: LAYZA NAUANE DE PAULA SILVA
// N° MATRICULA: 12211BSI251

#include <stdio.h>
#include <math.h>

int main(){

    // Declarando variaveis
    int valor;
    double S = 0;

    // Declarando variavel n (tamanho do vetor)
    int n;

    printf("Defina o valor de n (tamanho do vetor): \n");
    scanf("%d", &n);

    // Criando vetor de tamanho n
    int v[n];

    // Loop para percorrer o vetor
    for(int i = 0; i < n; i++){

        printf("Digite um numero: \n");
        scanf("%d", &valor);

        // Inserindo elementos no vetor
        v[i] = valor;
    }

    // Loop para percorrer os elementos do vetor e calcular o somatório
    for(int i = 1; i < n; i++){

        // Calculo do somatório
        S += (v[i] / (i * i));

    }

    // Calculando raiz cúbica do somatório
    double cubo = pow(S, 1/3);

    printf("Somatório: %.2lf \n", cubo);

    return 0;
}