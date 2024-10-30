// ALUNA: LAYZA NAUANE DE PAULA SILVA
// N° MATRICULA: 12211BSI251

#include <stdio.h>

int main (){

    // Declaracao da matriz 3X3 com posicoes 0
    int matriz[3][3] = {{0,0,0},{0,0,0},{0,0,0}};

    // Declaracao das variaveis
    int jogador1, jogador2, linha, coluna;
    int alguemVenceu = 0;

    // Loop para percorrer o vetor
    for(int i = 0; i < 10 && alguemVenceu == 0; i++ ){

        // Condição para jogador 1 e jogador 2 marcarem alternadamente
        if(i % 2 == 0){

            printf("Jogador 1 insira a linha e a coluna da matriz: \n");
            scanf("%d %d", &linha, &coluna);

            matriz[linha][coluna] = 1;

        } else {

            printf("Jogador 2 insira a linha e a coluna da matriz: \n");
            scanf("%d %d", &linha, &coluna);

            matriz[linha][coluna] = 2;
        }

        // Jogador 1 vence se ...

        int jog1VenceNaHoriz = matriz[0][0] == 1 && matriz[0][1] == 1 && matriz[0][2] == 1 || matriz[1][0] == 1 && matriz[1][1] == 1 && matriz[1][2] == 1 || matriz[2][0] == 1 && matriz[2][1] == 1 && matriz[2][2] == 1;

        int jog1VenceNaVert=  matriz[0][0] == 1 && matriz[1][0] == 1 && matriz[2][0] == 1 || matriz[0][1] == 1 && matriz[1][1] == 1 && matriz[2][1] == 1 || matriz[0][2] == 1 && matriz[1][2] == 1 && matriz[2][2] == 1;

        int jog1VenceNaDiagPrinc =  matriz[0][0] == 1 && matriz[1][1] == 1 && matriz[2][2] == 1;

        int jog1VenceNaDiagSec =  matriz[0][2] == 1 && matriz[1][1] == 1 && matriz[2][0] == 1;

        // Jogador 2 vence se...

        int jog2VenceNaHoriz =  matriz[0][0] == 2 && matriz[0][1] == 2 && matriz[0][2] == 2 || matriz[1][0] == 2 && matriz[1][1] == 2 && matriz[1][2] == 2 || matriz[2][0] == 1 && matriz[2][1] == 1 && matriz[2][2] == 2;

        int jog2VenceNaVert=  matriz[0][0] == 2 && matriz[1][0] == 2 && matriz[2][0] == 2 || matriz[0][1] == 2 && matriz[1][1] == 2 && matriz[2][1] == 2 || matriz[0][2] == 2 && matriz[1][2] == 2 && matriz[2][2] == 2;

        int jog2VenceNaDiagPrinc =  matriz[0][0] == 2 && matriz[1][1] == 2 && matriz[2][2] == 2;

        int jog2VenceNaDiagSec =  matriz[0][2] == 2 && matriz[1][1] == 2 && matriz[2][0] == 2;

        //Condição para definir o vencedor
        if(jog1VenceNaHoriz || jog1VenceNaVert || jog1VenceNaDiagPrinc || jog1VenceNaDiagSec)
        {
            printf("Jogador 1 venceu! \n");
            alguemVenceu = 1;

        } else if (jog2VenceNaHoriz || jog2VenceNaVert || jog2VenceNaDiagPrinc || jog2VenceNaDiagSec) 
        {
            printf("Jogador 2 venceu! \n");
            alguemVenceu = 2;
        }

        // Condição de empate
        if (i == 9) {

            printf("Empate! \n");

        }
    }

    return 0;
}


/*

| 0,0 | 0,1 | 0,2 |
| 1,0 | 1,1 | 1,2 |
| 2,0 | 2,1 | 2,2 |

*/