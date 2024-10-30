#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>

// Declaração de funções
void *funcao_barbeiro(void *idp);
void *funcao_cliente(void *idp);
void servir_cliente();
void *criar_funcao_cliente();

// Declaração de variáveis globais
pthread_mutex_t atenderCliente; 
sem_t barbeiro_pronto; 
sem_t cliente_pronto; 
sem_t modificarAssentos;

int quantidade_cadeiras; 
int assentos_disponiveis;
int total_clientes; 
int clientes_nao_atendidos = 0;

time_t soma_tempo_espera;

void *funcao_barbeiro(void *idp)
{    
  int contador = 0;
  
  while (1)
  {
    sem_wait(&cliente_pronto); 
    sem_wait(&modificarAssentos); 

    assentos_disponiveis++; 

    sem_post(&modificarAssentos); 
    sem_post(&barbeiro_pronto); 

    pthread_mutex_lock(&atenderCliente); 
    servir_cliente();   
    pthread_mutex_unlock(&atenderCliente); 
    printf("Cliente foi atendido.\n");

    contador++; 

    if (contador == (total_clientes - clientes_nao_atendidos)) {
      break; 
    }
  }
  pthread_exit(NULL);    
}

void *funcao_cliente(void *idp)
{  
  struct timeval inicio, fim; 
  sem_wait(&modificarAssentos);

  if (assentos_disponiveis >= 1){

    assentos_disponiveis--;
    sem_post(&modificarAssentos); 

    printf("Cliente[pid = %lu] está esperando.\n", pthread_self());
    printf("Assentos disponíveis: %d\n", assentos_disponiveis); 

    gettimeofday(&inicio, NULL); 
    sem_post(&cliente_pronto); 
    sem_wait(&barbeiro_pronto);
    gettimeofday(&fim, NULL);

    double segundos = (double)(fim.tv_usec - inicio.tv_usec) / 1000000 + (double)(fim.tv_sec - inicio.tv_sec);

    soma_tempo_espera += 1000 * segundos;

    printf("Cliente[pid = %lu] está sendo atendido.\n", pthread_self());  

  } else {
    sem_post(&modificarAssentos);
    clientes_nao_atendidos++;
    printf("Todas as cadeiras estao ocupadas.\nUm cliente foi embora.\n");
  }
  pthread_exit(NULL);
}

void servir_cliente() {
  int s = rand() % 401; 
  s = s * 1000; 
  usleep(s); 
}

void *criar_funcao_cliente() {
  int tmp;   
  int contador = 0;

  while (contador < total_clientes)
  {
    pthread_t thread_cliente;

    tmp = pthread_create(&thread_cliente, NULL, (void *)funcao_cliente, NULL); 
    if (tmp){
      printf("Falha ao criar a thread.");
    }
    contador++;
    usleep(100000); 
  }
}

int main() {    

  srand(time(NULL)); 

  pthread_t barbeiro;
  pthread_t criador_cliente;
  int tmp;
 
  pthread_mutex_init(&atenderCliente, NULL);
  sem_init(&cliente_pronto, 0, 0); 
  sem_init(&barbeiro_pronto, 0, 0); 
  sem_init(&modificarAssentos, 0, 1); 

  printf("Por favor, insira o número de assentos: \n");
  scanf("%d", &quantidade_cadeiras); 
  printf("Por favor, insira o total de clientes: \n");
  scanf("%d", &total_clientes);

  assentos_disponiveis = quantidade_cadeiras; 

  
  tmp = pthread_create(&barbeiro, NULL, (void *)funcao_barbeiro, NULL);
  if (tmp){
    printf("Falha ao criar a thread do barbeiro."); 
  }

  tmp = pthread_create(&criador_cliente, NULL, (void *)criar_funcao_cliente, NULL);
  if (tmp){
    printf("Falha ao criar a thread do criador de clientes."); 
  }
 
  pthread_join(barbeiro, NULL);
  pthread_join(criador_cliente, NULL);
  
  printf("\n------------------------------------------------\n");
  printf("Tempo médio de espera dos clientes: %f ms.\n", (soma_tempo_espera / (double)(total_clientes - clientes_nao_atendidos)));
  printf("Número de clientes que foram embora: %d\n", clientes_nao_atendidos);     
}