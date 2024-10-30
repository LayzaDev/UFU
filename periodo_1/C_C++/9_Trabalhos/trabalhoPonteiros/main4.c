#include <stdio.h>
#include <string.h>

int imprimeTamanho(char M[100]){

    int contador = 0;

    for(int i = 0; i < 100; i++){

        if(M[i] != NULL){

            contador++;

        } else {

            //printf("%d \n", contador);

            return 0;

        }
    }

}

int copiar(char M[100], char R[100]){

    for(int i = 0; i < 100; i++){

        if(M[i] != NULL){

            R[i] = M[i];

            //printf("%c ", R[i]);

        }

    }

    //printf("\n");

    return 0;
}

int concatena(char N[100], char R[100]){

    for(int i = 0; i < 100; i++){

        if(R[i] != NULL) printf("%c \n", R[i]);

    }

    for(int i = 0, j = 0; i < 100; i++){

        if(R[i] == NULL){
            
            R[i] += N[j];
            j++;

        }

        printf("%c \n", R[i]);
    }
    
  

    return 0;
}


int main(){

    char M[100] = "The quick brown fox jumps over the lazy dog";
    char N[100] = "A ligeira raposa marrom saltou sobre o cachorro preguicoso";
    char R[100];

    imprimeTamanho(M);
    imprimeTamanho(N);

    copiar(M, R);

    concatena(N, R);

    return 0;
}