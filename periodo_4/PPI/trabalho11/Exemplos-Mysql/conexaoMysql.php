<?php

function mysqlConnect()
{
  $db_host = "sql109.infinityfree.com";
  $db_username = "if0_35771771";
  $db_password = "cAs7W51PPftuwb";
  $db_name = "if0_35771771_ppi";

  $options = [
    PDO::ATTR_EMULATE_PREPARES => false, // desativa a execução emulada de prepared statements
  ];

  try {
    $pdo = new PDO("mysql:host=$db_host;dbname=$db_name;charset=utf8mb4", $db_username, $db_password, $options);
    return $pdo;
  } 
  catch (Exception $e) {
    exit('Ocorreu uma falha na conexão com o MySQL: ' . $e->getMessage());
  }
}
?>
