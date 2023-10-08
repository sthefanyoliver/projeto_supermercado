<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
  die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];

$id = $_GET['id'];


require_once('../conexao.php');


$sql = "SELECT*FROM produto WHERE idproduto=?"; //comando sql a ser mandado para o banco
$statement = $conexao->prepare($sql); //preparacao do preparestatemant
$statement->execute([$id]); //execucao do preparestatemant 

$registros = $statement->fetchAll();

$sql = "select * from segmento"; //comando sql a ser mandado para o banco
$statementSegmento = $conexao->prepare($sql); //preparacao do preparestatemant
$statementSegmento->execute(); //execucao do preparestatemant

$sql = "select * from unidmedida"; //comando sql a ser mandado para o banco
$statementUnidade = $conexao->prepare($sql); //preparacao do preparestatemant
$statementUnidade->execute(); //execucao do preparestatemant



?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ALTERAR PRODUTO</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/style_form_produto.css">
</head>

<body>


  <form action="../produto/alteraproduto.php" method="post">
    <div class="alterar">
      <div class="mb-3">
        <div class="login">
          <div>
            <img src="../img/intercambio.png">
          </div>
        </div>
        <div class="mb-3">
          <label for="id" class="form-label">ID: </label>
          <input type="text" class="form-control" id="id" name="id" value="<?= $registros[0]['idProduto'] ?>" readonly>
        </div>
        <div class="mb-3">
          <label for="segmento" class="form-label">SEGMENTO</label>
          <select class="form-select" aria-label="Default select example" name="segmento">
            <?php
            $registros = $statementSegmento->fetchAll(); //cria a matriz de resultados
            foreach ($registros as $linha) {
            ?>
              <option value="<?= $linha['idSegmProduto'] ?>"><?= $linha['DescSegmProduto'] ?></option>
            <?php
            } // fechando o foreach de segmento
            ?>
          </select>
        </div>
        <div class="mb-3">
          <label for="unidade" class="form-label">UNIDADE DE MEDIDA</label>
          <select class="form-select" aria-label="Default select example" name="unidade">
            <?php
            $registros = $statementUnidade->fetchAll(); //cria a matriz de resultados
            foreach ($registros as $linha) {
            ?>
              <option value="<?= $linha['idUnidMedida'] ?>"><?= $linha['DescrUnidMedida'] ?></option>
            <?php
            } // fechando o foreach de segmento
            ?>
          </select>

        </div>
        <div class="mb-3">
          <label for="descricao" class="form-label">Descricao Produto: </label>
          <input type="text" class="form-control" id="descricao" name="descricao" value="<?= isset($registros[0]['DescProduto']) ? $registros[0]['DescProduto'] : '' ?>">

        </div>
        <div class="mb-3">
          <label for="descricao" class="form-label">Valor Unitário: </label>
          <input type="text" class="form-control" id="valor" name="valor" value="<?= isset($registros[0]['valorUnitario']) ? $registros[0]['valorUnitario'] : '' ?>">

        </div>
        <div class="col-auto">
          <button type="submit" class="btn btn-outline-success">ALTERAR</button>

        </div>
      </div>
  </form>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>

</html>