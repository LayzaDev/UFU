<?php

require "../conexaoMysql.php";
require "produto.php";

// resgata a ação a ser executada
$acao = $_GET['acao'] ?? '';

// conecta ao servidor do MySQL
$pdo = mysqlConnect();

switch ($acao) {
  
  case "adicionarProduto":
    // recupera os dados do formulário
    $nome = $_POST["nome"] ?? "";
    $marca = $_POST["marca"] ?? "";
    $descricao = $_POST["descricao"] ?? "";

    $novoProduto = new Produto($nome, $marca, $descricao);

    // adiciona o cliente na tabela do banco de dados
    novoProduto->AddToDatabase($pdo);
    header("location: controlador.php?acao=listarProdutos");
    break;

  //-----------------------------------------------------------------
  case "excluirProduto":
    $id = $_GET["id"] ?? "";
    Produto::RemoveById($pdo, $id);
    header("location: controlador.php?acao=listarProdutos");
    break;

  //-----------------------------------------------------------------
  case "listarProdutos":
    $arrayProdutos = Produto::GetAll($pdo);
    
    // O script mostra-clientes.php produzirá uma página dinâmica
    // utilizando os dados do array acima ($arrayClientes)
    include "mostra-produtos.php";
    break;

  //-----------------------------------------------------------------
  default:
    exit("Ação não disponível");
}
