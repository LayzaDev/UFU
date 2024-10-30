struct marca{

    char nome[30];
    char origem[20];

};

struct carro{

    char nome[30];
    struct marca MARCA;
};

struct funcionario
{
    char cpf[12];
    char cargo[30];
    struct carro CARRO;
    
};

typedef struct funcionario FUNCIONARIO;

int criaFuncionario(){

    FUNCIONARIO f1[5];

    FUNCIONARIO FUNC;
    
    for(int i = 0; i < 5; i++){

        gets(FUNC.cpf);

        gets(FUNC.CARRO.MARCA.nome);

    }


}

int main(){


    return 0;

}
