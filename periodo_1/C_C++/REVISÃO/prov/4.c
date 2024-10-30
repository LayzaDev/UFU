#include <stdio.h>
#include <stdlib.h>

struct ponto { int x, y; };

struct ponto *copia(struct ponto *a){

    struct ponto *p = malloc(sizeof(struct ponto));

    p -> x = a -> x;
    p -> y = a -> y;

    return p;
}

struct ponto copiaE(struct ponto *a) {

   struct ponto p;

   p.x = a -> x;
   p.y = a -> y;

   return p;
};

int main(){

    struct ponto m = {4,5};
    struct ponto A = copiaE(&m);

    struct ponto *n = malloc(sizeof(struct ponto));

    n->x = 6; n->y = 7;

    struct ponto *r = copia(&m);
    struct ponto *s = copia(n);

    return 0;
}