#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

//use o comando para observar o processo zumbi
// cat /proc/2519/status | grep State


int main() {
    pid_t pid;

    /* usa o fork para criar um filho */
    pid = fork();

    if (pid < 0) {
        /* tratamento de erro */
        fprintf(stderr, "Fork falhou");
        exit(-1);
    }
    else if (pid == 0) {
        /* processo filho */
        printf("Processo Filho - PID: %d\n", getpid());
        exit(0);
    }
    else {
        /* parent process */
        printf("Processo Pai - PID: %d, Processo Filho PID: %d\n", getpid(), pid);
        /* pai dorme por 30 segundos para mostrar o processo zumbi */
        sleep(30); 
    }
    exit(0);
}