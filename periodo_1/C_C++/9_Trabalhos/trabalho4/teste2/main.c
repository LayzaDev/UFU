#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

// =================== STRUCTS ==========================
struct funcionario {
    char cpf[12];
    char nome[30];
    time_t entrada;
    time_t saida;
    char status;
};

typedef struct funcionario Funcionario;

struct registrolog {

    char cpf[11];
    time_t horario;
    char evento;
};

typedef struct registrolog RegistroLog;

// =================== FUNCTIONS ==========================
void registro(FILE *funcionarios, FILE *log) {
    // completar
    Funcionario x;

    printf("DADOS DO FUNCIONARIOS \n");

    printf("CPF: ");
    gets(x.cpf);

    printf("NOME: ");
    setbuf(stdin, NULL);
    gets(x.nome); 

    time_t relogio; 
    time(&relogio);     
    x.entrada = relogio;    

    printf("STATUS: ");
    setbuf(stdin, NULL);
    scanf("%c", &x.status);

    fwrite(&x, sizeof(Funcionario),1, funcionarios);

    fseek(funcionarios, 0, SEEK_END);

}

void listagem_funcionarios(FILE *funcionarios) {
    // completar
    
    Funcionario func;

    printf("========= LISTAGEM FUNCIONARIOS ========== \n");

    while(1){
        fread(&func, sizeof(Funcionario), 1, funcionarios);
        printf("CPF: %s \n", func.cpf);

        printf("NOME: %s \n", func.nome);
        printf("STATUS: %c \n", func.status);

        printf("ENTRADA: %ld \n", func.entrada);
        printf("SAIDA : %ld \n\n\n\n", func.saida);

        if(feof(funcionarios)){
            break;
        }



    }


    
    printf("===== FIM LISTAGEM FUNCIONARIOS  ========\n");
}

void listagem_log(FILE *log) {
    // completar

    RegistroLog logs;

    printf("========= LISTAGEM LOGS ========== \n");

    while(1){
        fread(&logs, sizeof(Funcionario), 1, log);
        printf("CPF: %s \n", logs.cpf);

        printf("EVENTO: %c \n", logs.evento);
        printf("STATUS: %ld \n", logs.horario);

        if(feof(log)){
            break;
        }



    }


    
    printf("===== FIM LISTAGEM LOGS  ========\n");


}


// =================== ARQUIVO PRINCIPAL ==========================

int main() {

    FILE *funcionarios;
    FILE *log;

    funcionarios = fopen("funcionarios.bin", "ab+");
    log = fopen("log.bin", "ab+");

    if(funcionarios == NULL || log == NULL){
        printf("Erro ao abrir arquivo! \n");

        funcionarios = fopen("funcionarios.bin", "wb+");
        log = fopen("log.bin", "wb+");        
    
    }

    listagem_funcionarios(funcionarios); 




    // a partir daqui nesta função main() o código não deve ser alterado
    /*int opcao;
    do {
        printf("\n\n 0-sair\n 1-registro entrada/saida\n 2-lista funcionarios\n 3-lista log\n");
        printf("\n Opcao: "); scanf(" %d",&opcao);
        switch(opcao) {
            case 1: registro(funcionarios,log); break;
            case 2: listagem_funcionarios(funcionarios); break;
            case 3: listagem_log(log); break;
            printf("\n\n\n");
        }
    } while (opcao != 0);*/

    // registro(funcionarios, log);



    fclose(funcionarios);
    fclose(log);
    return 0;
}