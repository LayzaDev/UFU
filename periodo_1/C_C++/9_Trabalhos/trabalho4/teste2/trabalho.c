#include <stdio.h>
#include <stdlib.h>
#include <time.h> // biblioteca time.h
#include <string.h>

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


void registro(FILE *funcionarios, FILE *log) {

    Funcionario funcionario, aux;
    RegistroLog logs;
    char entrada_ou_saida;


    printf("Insira o CPF do funcionario \n");
    scanf("%s", &funcionario.cpf);

    int cpf_esta_na_base_de_dados = 0;

    // verifica se o funcionario esta no arquivo funcionarios
    while (!feof(funcionarios))
    {
        printf("ESTOU AQUI \n ");
        fread(&aux, sizeof(struct funcionario), 1, funcionarios);
        
        printf("AUX CPF %s \n", aux.cpf);
        printf("FUNCIONARIO CPF %s \n", funcionario.cpf);

        int compara = strcmp(funcionario.cpf, aux.cpf);

        if(compara == 0){

            cpf_esta_na_base_de_dados = 1;

        }

    }

    if(cpf_esta_na_base_de_dados == 0){ // cpf nao esta no arq funcionarios
        printf("CPF NAO ESTA NA BASE \n");

        printf("Insira o nome do funcionario \n"); 
        scanf("%s", &funcionario.nome);

        printf("Registrar Status: P = Presente. A = Ausente \n");
        scanf("%s", &funcionario.status);


        if(funcionario.status == 'A'){
            printf("O funcionario esta ausente! \n");
        } 
        else if(funcionario.status == 'P'){

            time_t relogio; 
            time(&relogio); 

            printf("Registrar: Entrada = E, Saida = S \n");
            scanf("%s", &entrada_ou_saida);

            if(entrada_ou_saida == 'E'){

                logs.horario = relogio; 
                strcpy(logs.cpf, funcionario.cpf);
                logs.evento = 'E';
            
            } else if (entrada_ou_saida == 'S'){
                logs.horario = relogio; 
                strcpy(logs.cpf, funcionario.cpf);
                logs.evento = 'S';      
            }

        } 

        int logx = fwrite(&logs, sizeof(RegistroLog), 1, log);  
        printf("TEste log %d \n", logx);

        printf("Teste func  %s \n", funcionario.nome);
        int x = fwrite(&funcionario, sizeof(struct funcionario), 1, funcionarios);
            
    } else if(cpf_esta_na_base_de_dados == 1) {

        time_t relogio; 
        time(&relogio);         
        
        printf("CPF ESTA NA BASE \n");

        strcpy(logs.cpf, funcionario.cpf);
        
        printf("Registrar: Entrada = E, Saida = S \n");
        scanf("%s", &entrada_ou_saida);

        if(entrada_ou_saida == 'E'){
            logs.evento = 'E';
        } else {
            logs.evento = 'S';
        }
        
        time(&relogio);         

        logs.horario = relogio; 

        fwrite(&logs, sizeof(struct funcionario), 1, log);

    }
}

void listagem_funcionarios(FILE *funcionarios) {

    Funcionario funcionario;

    printf("Funcionarios \n");

    while(!feof(funcionarios)){
        fread(&funcionario, sizeof(Funcionario), 1, funcionarios);

        
        printf("Registro \n");

        printf("O nome eh %s \n", funcionario.nome);
        printf("O cpf eh %s \n", funcionario.cpf);
        printf("STATUS %c \n", funcionario.status);

        printf("Entrada %ld \n", funcionario.entrada);
        printf("Saida %ld \n", funcionario.saida);


        printf("============== \n ");        
    }


}

void listagem_log(FILE *log) {
    // completar

    RegistroLog registros;
    
    printf("LOGS \n");
    

    while(!feof(log)){
        fread(&registros, sizeof(Funcionario), 1, log);

        
        printf("Registro \n");

        printf("CPF %s \n", registros.cpf);
        printf("EVENTO %c \n", registros.evento);
        printf("HORARIO %ld \n", registros.horario);

        printf("============== \n ");
    }

}

int main() {
    // abrir arquivos (completar). Sugestão: tentar abrir com "rb+", e se não abrir, tentar abrir com "wb+", 
	// e se não abrir, informar o usuário que não foi possível
    FILE *funcionarios;
    FILE *log;

    funcionarios = fopen("funcionarios.bin", "rb+");
    log = fopen("log.bin", "rb+");

    if(funcionarios == NULL || log == NULL){
        printf("Erro ao abrir arquivo! \n");
    }

    // a partir daqui nesta função main() o código não deve ser alterado
    int opcao;
     do {
        printf("\n\n 0-sair\n 1-registro entrada/saida\n 2-lista funcionarios\n 3-lista log\n");
        printf("\n Opcao: "); scanf(" %d",&opcao);
        switch(opcao) {
            case 1: registro(funcionarios,log); break;
            case 2: listagem_funcionarios(funcionarios); break;
            case 3: listagem_log(log); break;
            printf("\n\n\n");
        }
    } while (opcao != 0);

    fclose(funcionarios);
    fclose(log);
    return 0;
}
