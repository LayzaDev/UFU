<?php

require "../conexaoMysql.php";
$pdo = mysqlConnect();

try {

  $sql = <<<SQL
  SELECT nome, email, telefone, logradouro, estado, cidade
  FROM pessoa INNER JOIN paciente 
  ON pessoa.codigo = id_pessoa
  SQL;

  // Neste exemplo não é necessário utilizar prepared statements
  // porque não há possibilidade de inj. de S Q L, 
  // pois nenhum parâmetro é utilizado na query SQL
  $stmt = $pdo->query($sql);
} 
catch (Exception $e) {
  exit('Ocorreu uma falha: ' . $e->getMessage());
}
?>
<!doctype html>
<html lang="pt-BR">

<head>
  <meta charset="utf-8">
  <!-- 1: Tag de responsividade -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Lista de pacientes</title>

  <!-- 2: Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

  <style>
    body {
      padding-top: 2rem;
    }
  </style>
</head>

<body>

  <div class="container">
    <h3>Pacientes e seus endereços</h3>
    <table class="table table-striped table-hover">
      <tr>
        <th></th>
        <th>Paciente</th>
        <th>Email</th>
        <th>Telefone</th>
        <th>Logradouro</th>
        <th>Estado</th>
        <th>Cidade</th>
      </tr>

      <?php
      while ($row = $stmt->fetch()) {

        // limpa os dados produzidos pelo usuario
        // com possibilidade x s s
        $nome = htmlspecialchars($row['nome']);
        $email = htmlspecialchars($row['email']);
        $telefone = htmlspecialchars($row['telefone']);
        $logradouro = htmlspecialchars($row['logradouro']);
        $estado = htmlspecialchars($row['estado']);
        $cidade = htmlspecialchars($row['cidade']);

        echo <<<HTML
          <tr>
            <td>$nome</td>
            <td>$email</td>
            <td>$telefone</td>
            <td>$logradouro</td>
            <td>$estado</td>
            <td>$cidade</td>
          </tr>
        HTML;
      }
      ?>

    </table>
    <a href="../index.html">Menu de Opções</a>
  </div>

</body>

</html>
