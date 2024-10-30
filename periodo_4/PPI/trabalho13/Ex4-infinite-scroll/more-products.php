<?php

// Define a classe Product para representar um produto
class Product
{
  // Declara as propriedades do produto: id, nome, preço e caminho da imagem do produto
  public $id;
  public $name;
  public $price;
  public $imagePath;

  // Construtor da classe para inicializar as propriedades do produto
  function __construct($id, $name, $price, $imagePath)
  {
    $this->id = $id;
    $this->name = $name; 
    $this->price = $price;
    $this->imagePath = $imagePath;
  }
}

// Cria um array de produtos com instâncias da classe Product
$products = array(
  new Product(1, 'Smart TV LED 55', 2900, 'tv.webp'),
  new Product(2, 'Smartphone 6.5 ABC', 1590, 'smartphone.webp'),
  new Product(3, 'Notebook 17 Ultra Slim', 4299, 'notebook.webp'),
  new Product(4, 'Mouse Óptico XYZ', 149, 'mouse.webp'),
  new Product(5, 'Monitor 28 4k', 1460, 'monitor.webp'),
  new Product(6, 'Fone Headset ABC', 250, 'headset.webp'),
  new Product(7, 'Pen-drive de 64GB', 90, 'pen-drive.webp')
);
 
// Seleciona aleatoriamente cinco produtos do array de produtos
$randProds = [
  $products[rand(0, 6)],
  $products[rand(0, 6)],
  $products[rand(0, 6)],
  $products[rand(0, 6)],
  $products[rand(0, 6)]
];

// Define o tipo de conteúdo da resposta como JSON
header('Content-type: application/json');
// Codifica os produtos selecionados para JSON e imprime
echo json_encode($randProds);
