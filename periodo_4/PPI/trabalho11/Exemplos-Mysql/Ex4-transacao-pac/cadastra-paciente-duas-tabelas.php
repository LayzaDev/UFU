<?php

require "../conexaoMysql.php";
$pdo = mysqlConnect();

// resgata os dados da tabela pessoa
$nome = $_POST["nome"] ?? "";
$sexo = $_POST["sexo"] ?? "";
$email = $_POST["email"] ?? "";
$telefone = $_POST["telefone"] ?? "";
$cep = $_POST["cep"] ?? "";
$logradouro = $_POST["logradouro"] ?? "";
$estado = $_POST["estado"] ?? "";
$cidade = $_POST["cidade"] ?? "";

// resgatar os dados da tabela paciente
$peso = $_POST["peso"] ?? "";
$altura = $_POST["altura"] ?? "";
$tipoSanguineo = $_POST["tipoSanguineo"] ?? "";


$sql1 = <<<SQL
  INSERT INTO pessoa (nome, sexo, email, telefone,    cep, logradouro, estado, cidade)
  VALUES (?, ?, ?, ?, ?, ?, ?, ?)
SQL;

$sql2 = <<<SQL
  INSERT INTO paciente (peso, altura, tipoSanguineo, id_pessoa)
  VALUES (?, ?, ?, ?)
SQL;

try {
  // inicia transacao
  $pdo->beginTransaction();

  // Inserção na tabela pessoa
  /*Neste caso utilizamos prepared statements para prevenir inj. de S Q L,
    pois estamos inserindo dados fornecidos pelo usuário
  */
  $stmt1 = $pdo->prepare($sql1);
  if (!$stmt1->execute([$nome, $sexo, $email, $telefone, $cep, $logradouro, $estado, $cidade])) throw new Exception("Falha na primeira inserção");
  

  // Inserção na tabela paciente
  // Inserção na tabela endereco_cliente
  // Precisamos do id do cliente cadastrado, que
  // foi gerado automaticamente pelo MySQL
  // na operação acima (campo auto_increment), para
  // prover valor para o campo do tipo chave estrangeira
  $idNovoPaciente = $pdo->lastInsertId();
  $stmt2 = $pdo->prepare($sql2);
  if (!$stmt2->execute([$peso, $altura, $tipoSanguineo, $idNovoPaciente])) throw new Exception("Falha na segunda inserção");

  // efetiva as operações
  $pdo->commit();

  header("location: ../index.html");
  exit();
} 
catch (Exception $e) {

  $pdo->rollBack();

  $pdo->rollBack();
  if ($stmt1->errorInfo()[1] === 1062)
    exit('Dados duplicados: ' . $e->getMessage());
  else
    exit('Falha ao cadastrar os dados: ' . $e->getMessage());
}
