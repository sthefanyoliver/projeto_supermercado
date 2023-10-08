<?php
$user = $_POST['usuario'];
$password = $_POST['senha'];

require_once('conexao.php');

try {
    $sql = "select * from user where usuario=? and senha=?"; //comando sql a ser mandado para o banco
    $statement = $conexao->prepare($sql); //preparacao do preparestatemant
    $statement->execute([$user, $password]); //execucao do preparestatemant
    $registros = $statement->rowCount();

    if ($registros === 1) {
        session_start();
        $registro = $statement->fetch();
        $_SESSION['idusuario'] = $registro['id'];
        $_SESSION['nome'] = $registro['nome'];
        $_SESSION['usuario'] = $registro['usuario'];
        $_SESSION['senha'] = $registro['senha'];


        header('Location: view/segmento.php');

    } else {
        $msg = "Usuario ou senha invalidos";
    }
} catch (exception $e) {
    $msg = "falha ao realizar login: " . $e->getMessage();
}
?>
<html>

<head>
    <title>FALHA NO LOGIN</title>
</head>

<body>
    <?= $msg; ?>
    <a href="javascript: history.go(-1);">Voltar</a>
</body>

</html>