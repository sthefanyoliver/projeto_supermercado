<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
    die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];


// recebe os dados do formulario
$id = $_POST['id'];
$sigla = $_POST['sigla'];
$descricao = $_POST['descricao'];

// estabelece a conexão com o banco de dados
require_once('../conexao.php');

// Realiza cadastro
try {
    $sql = "UPDATE unidmedida SET siglaunidmedida=?, descrunidmedida=? WHERE idunidmedida=?"; //:segmento)";  // comando SQL a ser executado
    $statement = $conexao->prepare($sql); // cria a prepare statement
    $statement->execute([$sigla, $descricao, $id]); // executa a prepare statement no bd.

    // $sql = "INSERT INTO pessoa(nome, altura, nascimento) VALUES (:nome,:altura,:nascimento)";//:nome,:altura,:nascimento)";  // comando SQL a ser executado
    // $statement = $conexao->prepare($sql); // cria a prepare statement
    // $statement->bindParam('nome', $nome);
    // $statement->bindParam('altura', $altura);
    // $statement->bindParam( 'nascimento', $nascimento);

    // $statement->execute(); // executa a prepare statement no bd.

    // $msg = "Cadastro realizado com sucesso!";
    header('location:../view/unidade.php');
} catch (Exception $e) {
    $msg = "Falha ao realizar cadastro: " . $e->getMessage();
}
?>

<html>

<head>
    <title>Alteração de Unidades de Medida</title>
    <meta charset="UTF-8" />
</head>

<body>
    <p> <?php echo $msg; ?> </p>
    <a href="javascript: history.go(-1);"> Voltar </a>
</body>

</html>