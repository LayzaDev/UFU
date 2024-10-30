<?php

// Classe para representar a resposta da requisição
class RequestResponse
{
  // Propriedades para indicar o sucesso da requisição e seus detalhes
  public $success;
  public $detail;

  // Construtor da classe para definir os valores das propriedades quando um novo objeto RequestResponse for criado.
  function __construct($success, $detail)
  {
    $this->success = $success;
    $this->detail = $detail;
  }
}

// Recebe os dados do formulário através do método POST e atribui as suas respectivas variáveis, caso não haja nenhum valor define como uma String vazia
$email = $_POST['email'] ?? '';
$senha = $_POST['senha'] ?? '';

// Validação simplificada para fins didáticos. Não faça isso!
// Verifica se o email e senha fornecidos correspondem ao email e senha pré-definidos
if ($email == 'teste@mail.com' && $senha == '123456')
  // Cria um objeto da RequestResponse com sucesso verdadeiro e redireciona para 'home.html'
  $response = new RequestResponse(true, 'home.html');
else
    // Caso contrário, cria um objeto RequestResponse com sucesso falso e define detalhes como uma String vazia
  $response = new RequestResponse(false, '');

// Define o tipo de conteúdo como JSON
header('Content-type: application/json');
// Converte $response para JSON e imprime a saída
echo json_encode($response);