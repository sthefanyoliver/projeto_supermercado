<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
    die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];

$segmento = $_POST['segmento'];
$unidade = $_POST['unidade'];
$descricao = $_POST['descricao'];
$valor = $_POST['valor'];

require_once('../conexao.php');

try {
    $sql = "INSERT INTO produto(segmento, unidademedida, descproduto, valorunitario)values(?,?,?,?)"; //comando sql a ser mandado para o banco
    $statement = $conexao->prepare($sql); //preparacao do preparestatemant
    $statement->execute([$segmento, $unidade, $descricao, $valor]); //execucao do preparestatemant 

    header('location:../view/produtos.php');
} catch (Exception $e) {
    $msg = "Falha ao realizar cadastro: " . $e->getMessage();
}
?>
<html>

<head>
    <title>Cadastro de Produtos</title>
</head>

<body>
    <p><?= $msg ?></p>
    <a href="../view/produtos.php">Voltar</a>
</body>

</html>