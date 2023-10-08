<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
    die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];

$sigla = $_POST['sigla'];
$descricao = $_POST['descricao'];

require_once('../conexao.php');

try {
    $sql = "INSERT INTo unidmedida(siglaunidmedida,descrunidmedida)values(?,?)"; //comando sql a ser mandado para o banco
    $statement = $conexao->prepare($sql); //preparacao do preparestatemant
    $statement->execute([$sigla, $descricao]); //execucao do preparestatemant 

    header('location:../view/unidade.php');
} catch (Exception $e) {
    $msg = "Falha ao realizar cadastro: " . $e->getMessage();
}
?>
<html>

<head>
    <title>Cadastro de Unidade de Medidas</title>
</head>

<body>
    <p><?= $msg ?></p>
    <a href="view/unidade.php">Voltar</a>
</body>

</html>