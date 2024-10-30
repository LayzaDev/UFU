#include <stdio.h>
#include <string.h>

int main(){

    char aux[30];

    char M[20][30] = 
    {
        "Vinicius", "Guilherme", "Vitor", "Lucas", "Igor", "Joao", "Pedro", "Abel", "Luiz", "Wemerson", "Rafael", "Pablo", "Saint", "Thais", "Matheus", "Douglas", "Gabriel", "Viviane", "Reginaldo", "Jose"
    };

    strcpy(aux, M[0]);

    for(int i = 0; i < 20; i++){

        int resultado = strcmp(M[i], aux);

        if(resultado < 0){

            strcpy(aux, M[i]);
            
        }
    }

    printf("%s \n", aux);
    
    return 0;
}