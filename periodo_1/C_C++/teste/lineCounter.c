/*
DESCRIPTION

This program counts the number of lines in the "data.txt" file and displays the result. The count is based on the presence of newline characters ('\n') in the file.
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(){ 

    FILE * file = fopen("data.txt", "r");

    int quantityLines = 0;

    while(!feof(file)){

        if(fgetc(file) == '\n'){

            quantityLines++;
        }
    }

    printf("\nNumber of lines: %d \n\n", quantityLines+1);

    fclose(file);

    return 0;
}