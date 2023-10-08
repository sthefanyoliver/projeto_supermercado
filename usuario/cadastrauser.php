<?php

$nome = $_POST['nome'];
$usuario = $_POST['usuario'];
$senha = $_POST['senha'];

require_once('../conexao.php');

try {
    $sql = "INSERT INTO user (nome,usuario,senha)values(?,?,?)"; //comando sql a ser mandado para o banco
    $statement = $conexao->prepare($sql); //preparacao do preparestatemant
    $statement->execute([$nome, $usuario, $senha]); //execucao do preparestatemant 

    header('location:../cadastrouser.html');
} catch (Exception $e) {
    $msg = "Falha ao realizar cadastro: " . $e->getMessage();
}
?>
<html>

<head>
    <title>Cadastro de Usuarios</title>
</head>

<body>
    <p><?= $msg ?></p>
    <a href="../cadastrouser.html">Voltar</a>
</body>

</html>