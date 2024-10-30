#include <stdio.h>

int main(){

  int N, N2, linha, coluna, profundidade;
  float soma = 0;


  printf("Valor de N: \n");
  scanf("%d", &N);

  float ***matriz3dimensoes = (float ***) malloc(N * sizeof(float **));

  for(int i = 0; i < N; i++){

    matriz3dimensoes[i] = (float **) malloc(N * sizeof(float *));

    for(int j = 0; j < N; j++){

      matriz3dimensoes[i][j] = (float *) malloc(N * sizeof(float));

      for(int count = 0; count < N; count++){

        printf("Insira elementos na matriz: \n");
        scanf("%f", &matriz3dimensoes[i][j][count]);

      }
    }
  }

  printf("Digite 1, 2 ou 3: \n");
  scanf("%d", &N2);

  if(N2 == 1){

    printf("Valor da linha: \n");
    scanf("%d", &linha);

    printf("Digite o valor da coluna: \n");
    scanf("%d", &coluna);

    for(int i = 0; i < N; i++){

      soma += matriz3dimensoes[linha][coluna][i];

    }

  } else if(N == 2){

    printf("Valor da linha: \n");
    scanf("%d", &linha);

    printf("Digite o valor da profundidade: \n");
    scanf("%d", &profundidade);

    for(int i = 0; i < N; i++){

      soma += matriz3dimensoes[linha][i][profundidade];

    }

  } else if(N == 3){

    printf("Valor da coluna: \n");
    scanf("%d", &coluna);

    printf("Digite o valor da profundidade: \n");
    scanf("%d", &profundidade);

    for(int i = 0; i < N; i++){

      soma += matriz3dimensoes[i][coluna][profundidade];

    }
  } 

  printf("Agregacao: %f \n", soma);

  return 0;
}


