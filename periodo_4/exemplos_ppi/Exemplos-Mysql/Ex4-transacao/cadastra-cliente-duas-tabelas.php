<?php

require "../conexaoMysql.php";
$pdo = mysqlConnect();

// Resgata os dados do cliente
$nome = $_POST["nome"] ?? "";
$cpf  = $_POST["cpf"] ?? "";
$email = $_POST["email"] ?? "";
$senha = $_POST["senha"] ?? "";
$altura = $_POST["altura"] ?? "";
$estadocivil = $_POST["estadocivil"] ?? "";
$datanascimento = $_POST["datanascimento"] ?? "";

// Resgata os dados do endereço do cliente
$cep = $_POST["cep"] ?? "";
$endereco = $_POST["endereco"] ?? "";
$bairro = $_POST["bairro"] ?? "";
$cidade = $_POST["cidade"] ?? "";

// calcula um hash de senha seguro para armazenar no BD
$hashsenha = password_hash($senha, PASSWORD_DEFAULT);

$sql1 = <<<SQL
  INSERT INTO cliente (nome, cpf, email, hash_senha, 
                       data_nascimento, estado_civil, altura)
  VALUES (?, ?, ?, ?, ?, ?, ?)
  SQL;

$sql2 = <<<SQL
  INSERT INTO endereco_cliente 
    (cep, endereco, bairro, cidade, id_cliente)
  VALUES (?, ?, ?, ?, ?)
  SQL;

try {
  $pdo->beginTransaction();

  // Inserção na tabela cliente. Repare que o campo id foi omitido por do tipo auto_increment
  // É necessário utilizar prepared statements para prevenir
  // inj. de S Q L, pois temos parâmetros fornecidos pelo usuário.
  // Uma exceção será lançada em caso de falha no prepare ou no execute.
  $stmt1 = $pdo->prepare($sql1);
  $stmt1->execute([$nome, $cpf, $email, $hashsenha, $datanascimento, $estadocivil, $altura]);

  // Inserção na tabela endereco_cliente
  // O id do novo cliente gerado automaticamente na inserção anterior 
  // é resgatado por meio do método lastInsertId(). Precisamos desse id
  // para o campo id_cliente, que é chave estrangeira conectando o endereço
  // ao cliente da outra tabela.
  // Uma exceção será lançada em caso de falha no prepare ou no execute.
  $idNovoCliente = $pdo->lastInsertId();
  $stmt2 = $pdo->prepare($sql2);
  $stmt2->execute([$cep, $endereco, $bairro, $cidade, $idNovoCliente]);

  // Efetiva as operações
  $pdo->commit();

  header("location: ../index.html");
  exit();
} 
catch (Exception $e) {
  // Caso ocorra alguma falha nas operações da transação, a operação
  // rollback irá desfazer as operações que eventualmente tenham sido feitas,
  // voltando o banco de dados ao estado em que se encontrava antes da chamada
  // de beginTransaction.
  $pdo->rollBack();
  exit('Rollback executado: ' . $e->getMessage());
}
