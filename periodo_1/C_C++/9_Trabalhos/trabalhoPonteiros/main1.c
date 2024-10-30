#include <stdio.h>
#include <stdlib.h>

int main (){
    int **matA;
    int **matB;
    int **res;

    int linhasA;
    int colunasA;
    int colunasB;

    printf("Insira a qtd de linhas de A \n");
    scanf("%d", &linhasA);


    printf("Insira a qtd de colunas de A \n");
    scanf("%d", &colunasA);

    matA = (int **) malloc(linhasA * sizeof(int *));

    for(int i = 0; i < colunasA; i++){
        matA[i] = (int *) malloc(colunasA * sizeof(int)); 
    }

    for(int i = 0; i < linhasA; i++){
        for(int j = 0; j < colunasA; i++){
            printf("Insira os ele na matrizA \n");
            int v;
            
            scanf("%d", &matA[i][j]);
        }
    }

    matB = (int **) malloc(colunasA * sizeof(int *));

    printf("Insira a qtd de colunas de b \n");
    scanf("%d", &colunasB);
    
    for(int i = 0; i < colunasB; i++){
        matB[i] = (int *) malloc(colunasB * sizeof(int));
    }

    res = (int **) malloc(linhasA * sizeof(int *));
    for(int i = 0; i < colunasB; i++){
        res[i] = (int*) malloc(colunasB * sizeof(int));
    }

    for(int i = 0; i < colunasA; i++){
        for(int j = 0; j < colunasB; i++){
            printf("Insira os ele na matrizB \n");
            scanf("%d", &matB[i][j]);
        }
    }

    for(int i = 0; i < linhasA; i++){
        for(int j = 0; j < colunasB; i++){
            res[i][j] = 0;
        }
    }


    for(int i = 0; i < linhasA; i++){
        for(int j = 0; j < colunasB; j++){
            for(int k = 0; k < colunasA; k++){
                res[i][j] += matA[i][k] * matB[k][j];
            }
        }
    }

    for(int i = 0; i < linhasA; i++){
        for(int j = 0; j < colunasB; i++){
            printf("%d \n ", res[i][j]);
        }
    }
    
    
    free(matA);
    free(matB);
    free(res);



    return 0;
}