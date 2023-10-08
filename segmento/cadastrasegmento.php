<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
  die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];


$segmento = $_POST['segmento'];

require_once('../conexao.php');

try {
  $sql = "INSERT INTO segmento(descsegmproduto)values(?)"; //comando sql a ser mandado para o banco
  $statement = $conexao->prepare($sql); //preparacao do preparestatemant
  $statement->execute([$segmento]); //execucao do preparestatemant 

  header('location: ../view/segmento.php');
} catch (Exception $e) {
  $msg = "Falha ao realizar cadastro: " . $e->getMessage();
}
?>
<html>

<head>
  <title>Cadastro de Segmentos</title>
</head>

<body>
  <p><?= $msg ?></p>
  <a href="..view/segmento.php">Voltar</a>
</body>

</html>