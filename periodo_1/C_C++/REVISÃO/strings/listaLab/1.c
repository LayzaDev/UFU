#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){

    char str[30];

    printf("Digite algo: \n"); fgets(str, 30, stdin);

    for(int i = 0; str[i] != '\0'; i++){

        if(str[i] >= 97 && str[i] <= 122 ){

            str[i] -= 32;

        }
    }

    printf("%s \n", str);

    return 0;
}