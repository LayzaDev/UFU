<?php
/* Retornaremos todos os registros da tabela aluno
como um array JSON. A função header do PHP é utilizada para definição adequada do cabeçalho Content-Type da resposta HTTP, uma vez que será 
retornado um conteúdo no formato JSON.
*/

// Faz a conexão com o banco de dados
require "../conexaoMysql.php";
$pdo = mysqlConnect();

// Consulta SQL, seleciona todas as colunas da tabela aluno
$sql = <<<SQL
  SELECT *
  FROM aluno
SQL;

try {

  $stmt = $pdo->query($sql); // executa a consulta e insere o resultado na variavel $stmt

  $alunos = $stmt->fetchAll(PDO::FETCH_OBJ);  // O método fetchAll() vai recuperar os resultados da consulta e inserir um array de objetos na variavel $alunos

  header('Content-Type: application/json; charset=utf-8'); // Dados do cabeçalho da resposta HTTP

  echo json_encode($alunos); // converte o array de alunos em uma string JSON
} 
catch (Exception $e) {
  exit('Falha inesperada: ' . $e->getMessage());
}
