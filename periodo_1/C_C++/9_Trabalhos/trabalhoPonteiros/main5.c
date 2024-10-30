#include <stdio.h>
#include <stdlib.h>

#define QUANTIDADE 21

int main() {
   
   char temp[12];
   char novaLista[QUANTIDADE][12];
   int contador = 0;

   char lista[QUANTIDADE][12] = 
   { 
    "Vinicius", "Guilherme", "Vitor", "Lucas", "Igor", "Joao", "Pedro", "Abel", "Luiz", "Wemerson", "Rafael", "Pablo", "Saint", "Thais", "Matheus", "Douglas", "Gabriel", "Viviane", "Reginaldo", "Jose", "Leonardo" 
    };

    printf("Antes de ordenar:\n=====================\n");
    
    while(contador < QUANTIDADE){

        for (int i = 0; i < QUANTIDADE; i++) {
        
            printf("%s\n",lista[i]);

            int resultado = strcmp(lista[i], lista[i + 1]);

            if(resultado > 0){

                strcpy(temp, lista[i]);
                strcpy(lista[i], lista[i + 1]);
                strcpy(lista[i + 1], temp);

            }
        }

        contador++;
    }

   printf("\n\nApos ordenar:\n=====================\n");

   for (int i = 0; i < QUANTIDADE; i++)
    {
        printf("%s\n",lista[i]);

    }
   
   
   
   return 0;
    
}