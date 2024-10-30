// Leia n valores numéricos e os armazene no vetor v. 
// O valor de n também deve ser lido. 
// Calcule e exiba o valor da série S onde vi é o i-ésimo valor armazenado no vetor v. 

#include <stdio.h>

int main(){

    // Declarando variaveis
    int n, valor, soma;

    printf("Defina o tamanho do vetor: \n");
    scanf("%d", &n);

    // Criando vetor de tamanho n
    int v[n];

    // Loop para percorrer o vetor
    for(int i = 1; i < n; i++){

        printf("Digite um numero: \n");
        scanf("%d", &valor);
        
        // inserindo valor dentro do vetor
        v[i] = valor;
    }

    // Loop para o somatorio
    for(int i = 1; i < n; i++){

       if (i == 1) {
            soma = ((v[i - 1]) / (i * i));
        }
       if (i > 1) { 
            soma += ((v[i - 1]) / (i * i));
        }
    }

    // Tirando raiz cubica do somatorio
    float S = pow(soma, 1/3);

    printf("Somatorio: %.2f \n", S);

    return 0;
}