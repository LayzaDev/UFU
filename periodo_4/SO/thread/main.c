#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

#define NTHREADS 50000

void *do_nothing(void *null) {
  int i;
  i=0;
  pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
  int rc, j;
  pid_t pid;

  for (j=0; j<NTHREADS; j++) {
    pid = fork();

    if (pid < 0) {
      printf("ERROR; return code from fork() is %d\n", pid);
      exit(-1);
    } else if (pid == 0) {
      // Código executado pelo processo filho
      do_nothing(NULL);
      exit(0); // Importante para evitar que o filho continue a criar mais processos
    }
  }

  // Código a ser executado pelo processo pai

  // Espera todos os processos filhos terminarem
  for (j=0; j<NTHREADS; j++) {
    wait(NULL);
  }

  return 0;
/*int rc, i, j, detachstate;
  //pthread_t tid;
   pid_t pid;
  pthread_attr_t attr;

  pthread_attr_init(&attr);
  pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_JOINABLE);

  
  for (j=0; j<NTHREADS; j++) {
    //rc = pthread_create(&tid, &attr, do_nothing, NULL);
    pid = fork();
  
    if (rc) {
      printf("ERROR; return code from pthread_create() is %d\n", rc);
      exit(-1);
    }

    Wait for the thread 
    rc = pthread_join(pid, NULL);
    if (rc) {
      printf("ERROR; return code from pthread_join() is %d\n", rc);
      exit(-1);
    }*/

 // pthread_attr_destroy(&attr);
 // pthread_exit(NULL);
}

 