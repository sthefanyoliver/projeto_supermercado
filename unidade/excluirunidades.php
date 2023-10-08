<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
    die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];

$ids = $_POST['ids'];

require_once('../conexao.php');


$sql = "DELETE FROM unidmedida WHERE idunidmedida=?"; //comando sql a ser mandado para o banco
$statement = $conexao->prepare($sql); //preparacao do preparestatemant

$msg = "";

foreach ($ids  as $chave => $valor) {

    try {
        $statement->execute([$valor]); //execucao do preparestatemant 
        $msg = $msg . "<br /> Registro excluido com sucesso " . $valor;
    } catch (Exception $e) {
        $msg = $msg . " <br /> Falha ao realizar exclusão: " . $e->getMessage();
    }
}

?>
<html>

<head>
    <title>Excluir Unidades de Medidas com checkbox</title>
    <meta charset="UTF-8" />
</head>

<body>
    <p> <?php echo $msg; ?> </p>
    <a href="../view/unidade.php">Voltar</a>
</body>

</html>