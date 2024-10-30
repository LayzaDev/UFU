CREATE TABLE aluno
(
   nome varchar(50),
   telefone varchar(50)
) ENGINE=InnoDB;

CREATE TABLE cliente
(
   id int PRIMARY KEY auto_increment,
   nome varchar(50),
   cpf char(14) UNIQUE,
   email varchar(50) UNIQUE,
   hash_senha varchar(255),
   data_nascimento date,
   estado_civil varchar(30),
   altura int
) ENGINE=InnoDB;

CREATE TABLE endereco_cliente
(
   id int PRIMARY KEY auto_increment,
   cep char(10),
   endereco varchar(100),
   bairro varchar(50),
   cidade varchar(50),
   id_cliente int not null,
   FOREIGN KEY (id_cliente) REFERENCES cliente(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE produto
(
   id int PRIMARY KEY auto_increment,
   nome varchar(50),
   marca varchar(50),
   descricao varchar(50)
) ENGINE=InnoDB;

CREATE TABLE pessoa (
   codigo int PRIMARY KEY auto_increment,
   nome varchar(50),
   sexo char(1),
   email varchar(50) UNIQUE,
   telefone varchar(20),
   cep char(10),
   logradouro varchar(100),
   cidade varchar(50),
   estado varchar(50)
) ENGINE=InnoDB;

CREATE TABLE paciente
(
   codigo int PRIMARY KEY auto_increment,
   peso float,
   altura int,
   tipo_sanguineo char(2),
   id_pessoa int not null,
   FOREIGN KEY (id_pessoa) REFERENCES pessoa(id) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO aluno VALUES ("Fulano", "123");
INSERT INTO aluno VALUES ("Ciclano", "456");



/*
CREATE TABLE base_de_enderecos_ajax
(
   cep char(10) PRIMARY KEY,
   logradouro varchar(100),
   cidade varchar(50),
   estado varchar(50),
) ENGINE=InnoDB;

CREATE TABLE funcionario
(
   codigo int PRIMARY KEY auto_increment,
   data_contrato date,
   salario float,
   senha_hash varchar(256),
   FOREIGN KEY (codigo_pessoa) REFERENCES pessoa(codigo)
) ENGINE=InnoDB;

CREATE TABLE medico
(
   codigo int PRIMARY KEY auto_increment,
   especialidade varchar(50),
   CRM varchar(30) UNIQUE,
   FOREIGN KEY (codigo_funcionario) REFERENCES funcionario(codigo)
) ENGINE=InnoDB;

CREATE TABLE agenda
(
   codigo int PRIMARY KEY auto_increment,
   data_agendada date,
   horario time,
   nome varchar(100),
   sexo char(1),
   email varchar(50),
   FOREIGN KEY (codigo_medico) REFERENCES medico(codigo)
)
*/



