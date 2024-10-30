<?php
$codigo = $_GET['codigo'] ?? '';

if ($codigo) {
    $apiKey = 'RTYY2SBJ2SWWM8E3';
    $apiURL = "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol={$codigo}.SA&apikey={$apiKey}";

    $response = file_get_contents($apiURL);
    header('Content-Type: application/json');
    echo json_encode($response);
} else { 
  http_response_code(404);
  echo "Acao não encontrada.";
}
?>

