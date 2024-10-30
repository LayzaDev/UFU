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
/* Ex3 x Ex5
A principal diferença entre os dois arquivos está na forma como os dados do CEP são recebidos:
  1° -> No Ex5, utilizamos o método POST, por isso utilizamos a "$stringJSON = file_get_contents('php://input');" para ler os dados enviados da requisição, depois convertida a string JSON obtida em objeto PHP e por fim acessamos o valor do campo cep com o objeto $dados.
  2° -> No Ex3, obtemos o valor do parâmetro "cep" diretamente da URL usando o método GET,
*/

// php://input retorna todos os dados que vem depois
// das linhas de cabeçalho HTTP da requisição, 
// independentemente do tipo do conteúdo
$stringJSON = file_get_contents('php://input');

// converte a string JSON em objeto PHP
$dados = json_decode($stringJSON);
$cep = $dados->cep;

if ($cep == '38400-100')
  $endereco = new Endereco('Av Floriano', 'Centro', 'Uberlândia');
else if ($cep == '38400-200')
  $endereco = new Endereco('Rua Tiradentes', 'Fundinho', 'Uberlândia');
else
  $endereco = new Endereco('', '', '');
  
header('Content-type: application/json');
echo json_encode($endereco);