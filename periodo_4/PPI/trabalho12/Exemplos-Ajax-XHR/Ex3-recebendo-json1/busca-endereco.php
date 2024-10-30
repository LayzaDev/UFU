<?php

// Classe criada para representar um Endereco.
class Endereco
{
  // Definindo as propriedades que compõem a classe Endereco
  public $rua;
  public $bairro;
  public $cidade;

  // Construtor da classe, quando um novo objeto Endereco é criado, inicializa as propriedades dele com os valores informados
  function __construct($rua, $bairro, $cidade)
  {
    $this->rua = $rua;
    $this->bairro = $bairro;
    $this->cidade = $cidade;
  }
}

// Obtem o valor do cep passado por meio do método GET. Se nenhum valor for passado, recebe uma string vazia
$cep = $_GET['cep'] ?? '';

if ($cep == '38400-100')
  // Se o valor de $cep for igual a '38400-100', cria um objeto Endereco com as propriedades associadas a ele
  $endereco = new Endereco('Av Floriano', 'Centro', 'Uberlândia');
else if ($cep == '38400-200')
  // Se o valor de $cep for igual a '38400-200', cria um objeto Endereco com as propriedades associadas a ele
  $endereco = new Endereco('Rua Tiradentes', 'Fundinho', 'Uberlândia');
else {
  // Caso contrário, cria um objeto Endereco com todos os paramêtros vazios
  $endereco = new Endereco('', '', '');
}

header('Content-type: application/json'); // Define o tipo de conteúdo da resposta json
echo json_encode($endereco); // Converte o objeto Endereco para JSON e imprime a saída
