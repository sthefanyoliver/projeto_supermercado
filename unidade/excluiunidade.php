<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
    die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];

$id = $_GET['id'];

require_once('../conexao.php');

try {
    $sql = "DELETE FROM unidmedida WHERE idunidmedida=?"; //comando sql a ser mandado para o banco
    $statement = $conexao->prepare($sql); //preparacao do preparestatemant
    $statement->execute([$id]); //execucao do preparestatemant 

    header('location:../view/unidade.php');
} catch (Exception $e) {
    $msg = "Falha ao realizar cadastro: " . $e->getMessage();
}
?>
<html>

<head>
    <title> Excluir Unidade</title>
    <meta charset="UTF-8" />
</head>

<body>
    <p> <?php echo $msg; ?> </p>
    <a href="javascript: history.go(-1);"> Voltar </a>
</body>

</html>