/*
    Crie uma estrutura denominada pessoa, contendo nome, idade e o endereço residencial. 
    Crie uma instância estática e uma instância dinâmica dessa estrutura, fazendo a leitura dos dados do teclado. 
    Após a leitura, imprima os dados lidos.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct ADDRESS {

    char nameStreet[40];
    int numberHouse;

};

struct PEOPLE{

    char name[40];
    int age;
    struct ADDRESS address;
};

typedef struct PEOPLE people;

int main(){

    people p, *q;

    q = (people *) malloc(sizeof(people));
     

    printf("INSTANCIA ESTÁTICA \n\n");

    printf("Name: "); fgets(p.name, 40, stdin);

    printf("Age: "); scanf("%d", &p.age);

    printf("\nStreet: "); fgets(p.address.nameStreet, 40, stdin);
    
    printf("\nNumber: "); scanf("%d", &p.address.numberHouse);

    printf("\nINFORMATIONS \n\n");

    printf("NAME: %s \nAGE: %d \nEDDRESS \nSTREET: %s \nNUMBER: %d \n", p.name, p.age, p.address.nameStreet, p.address.numberHouse);

 //=================================================================================================================================

    printf("INSTANCIA DINAMICA \n\n");

    printf("Name: "); fgets(q->name, 40, stdin);

    printf("Age: "); scanf("%d", &q->age);

    printf("\nStreet: "); fgets(q->address.nameStreet, 40, stdin);
    
    printf("\nNumber: "); scanf("%d", &q->address.numberHouse);

    printf("\nINFORMATIONS \n\n");

    printf("NAME: %s \nAGE: %d \nEDDRESS \nSTREET: %s \nNUMBER: %d \n", *q->name, q->age, q->address.nameStreet, q->address.numberHouse);

    return 0;
}