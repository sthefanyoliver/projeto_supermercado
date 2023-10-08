<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
  die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];

$id = $_GET['id'];

require_once('../conexao.php');


$sql = "SELECT*FROM segmento WHERE idsegmproduto=?"; //comando sql a ser mandado para o banco
$statement = $conexao->prepare($sql); //preparacao do preparestatemant
$statement->execute([$id]); //execucao do preparestatemant 

$registros = $statement->fetchAll();


?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ALTERAR SEGUIMENTO</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/style_form_segmento.css">
</head>

<body>


  <form action="../segmento/alterasegmento.php" method="post">
    <div class="alterar">

      <div class="mb-3">
        <div class="login">
          <div>
            <img src="../img/intercambio.png">
          </div>
        </div>
        <label for="id" class="form-label">ID: </label>
        <input type="text" class="form-control" id="id" name="id" value="<?= $registros[0]['idSegmProduto'] ?>" readonly>
      </div>
      <div class="mb-3">
        <label for="segmento" class="form-label">Segmento: </label>
        <input type="text" class="form-control" id="segmento" name="segmento" value="<?= $registros[0]['DescSegmProduto'] ?>">
      </div>
      <div class="col-auto">
        <button type="submit" class="btn btn-outline-success">Alterar</button>

      </div>

    </div>
  </form>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>

</html>