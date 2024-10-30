<?php

// Resgata o cep informado no formulario
$cep = $_GET['cep'] ?? '';

if ($cep == '38400-100') // Se o cep informado for igual a '38400-100', imprime "Uberlândia"
  echo 'Uberlândia';
else if ($cep == '38700-000') // Se não, se o cep informado for igual a '38700-000', imprime "Patos de Minas"
  echo 'Patos de Minas';
else { // Se não, se as verificações acima forem falsas, então:
  http_response_code(404); // Define a resposta HTTP como 404, indicando que o recurso não está disponível
  echo "$cep is not available"; // Em seguida, imprime uma mensagem dizendo que o cep não foi encontrado
}