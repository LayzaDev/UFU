<?php

class Endereco
{
  public $rua;
  public $bairro;
  public $cidade;

  function __construct($rua, $bairro, $cidade)
  {
    $this->rua = $rua;
    $this->bairro = $bairro;
    $this->cidade = $cidade;
  }
}

$cep = $_POST['cep'] ?? '';

if ($cep == '38400-100')
  $endereco = new Endereco('Av Floriano', 'Centro', 'Uberlândia');
else if ($cep == '38400-200')
  $endereco = new Endereco('Rua Tiradentes', 'Fundinho', 'Uberlândia');
else
  $endereco = new Endereco('', '', '');

header('Content-Type: application/json');
echo json_encode($endereco);


// UTILIZANDO O MÉTODO POST
// $stringJSON = file_get_contents('php://input');
// $dados = json_decode($stringJSON);
// $cep = $dados->cep;