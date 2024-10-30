<?php

function checkLogin($pdo, $email, $senha)
{
  $sql = <<<SQL
    SELECT hash_senha
    FROM cliente
    WHERE email = ?
    SQL;

  try {
    // Neste caso utilize prepared statements para prevenir
    // inj. de S Q L, pois precisamos inserir dados fornecidos
    // pelo usuário na consulta SQL (o email do usuário)
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$email]);
    $row = $stmt->fetch();
    if (!$row) return false; // nenhum resultado (email não encontrado)

    /* EXPLICAÇÃO DA FUNÇÃO PASSWORD_VERIFY
      A função password_veridy verifica se a senha informada pelo usuario no formulario 
      é igual a hash de senha armazenada no banco de dados. Se for igual retorna true e 
      deixa o usuário logar, se não, retorna false e impede o usuário de fazer login na
      conta.
    */
    return password_verify($senha, $row['hash_senha']);
  } 
  catch (Exception $e) {
    exit('Falha inesperada: ' . $e->getMessage());
  }
}

require "../conexaoMysql.php";
$pdo = mysqlConnect();

$email = $_POST["email"] ?? "";
$senha = $_POST["senha"] ?? "";

if (checkLogin($pdo, $email, $senha))
  header("location: home.html");
else
  header("location: index.html");
