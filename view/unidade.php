<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
  die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];


require_once('../conexao.php');

$filtro = '';
$campo = 'unidmedida. DescrUnidMedida';

if (isset($_GET['filtro'])) {
  $filtro = $_GET['filtro'];
}
if (isset($_GET['campo'])) {
  $campo = $_GET['campo'];
}


$sql = "select * from unidmedida WHERE " . $campo . " like concat ('%',?,'%')"; //comando sql a ser mandado para o banco
$statement = $conexao->prepare($sql); //preparacao do preparestatemant
$statement->execute([$filtro]); //execucao do preparestatemant
?>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>UNIDADE</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/style_principal.css">
</head>

<body>
  <nav class="navbar navbar-expand-lg bg-body-tertiary navbar bg-dark" data-bs-theme="dark"">
  <div class=" container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <div class="login">
        <div>
          <img src="../img/carrinho-de-compras.png">
        </div>
      </div>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="segmento.php">SEGMENTO</a>

        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="unidade.php">UNIDADE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="produtos.php">PRODUTOS</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="usuarios.php">USUARIOS</a>
        </li>
      </ul>
      <form class="d-flex" role="search" action="unidade.php" method="get">
        <input type="hidden" name="campo" value="<?= $campo ?>" />
        <input class="form-control me-2" type="search" placeholder="filtro" aria-label="Search" name="filtro">
        <button class="btn btn-outline-success" type="submit">PESQUISA</button>
        <p class="usuario" style="text-align: right;"><a href="../logout.php"> Sair </a></p>
      </form>
    </div>
    </div>
  </nav>


  <form action="../unidade/excluirunidades.php" method="post">
    <table class="table table-dark table-striped">
      <thead>
        <tr>
          <th> <input class="btn btn-outline-success" type="submit" value="APAGAR" title="Apagar"> </th>
          <th scope="col"><a href="?campo=unidmedida.idUnidMedida"> ID </a></th>
          <th scope="col"><a href="?campo=unidmedida.SiglaUnidMedida">SIGLA</a></th>
          <th scope="col"><a href="?campo=unidmedida.DescrUnidMedida">DESCRICAO </a></th>
          <th> &nbsp; </th>
          <th> &nbsp; </th>


        </tr>
      </thead>
      <tbody>
        <?php
        $registros = $statement->fetchAll();

        foreach ($registros as $linha) {
        ?>
          <tr>
            <td><input type="checkbox" name="ids[]" value="<?= $linha['idUnidMedida'] ?>"></td>
            <td><?= $linha['idUnidMedida'] ?></td>
            <td><?= $linha['SiglaUnidMedida'] ?></td>
            <td><?= $linha['DescrUnidMedida'] ?></td>
            <td> <a href="formunidade.php?id=<?= $linha['idUnidMedida'] ?>"> Editar </a> </td>
            <td> <a href="../unidade/excluiunidade.php?id=<?= $linha['idUnidMedida'] ?>"> Excluir </a> </td>
          </tr>
        <?php
        }
        ?>
      </tbody>
    </table>
  </form>
  <form action="../unidade/cadastraunidade.php" method="post">
    <div class="cadastro">
      <div class="mb-3">
        <label for="exampleFormControlInput1" class="form-label">CADASTRAR NOVA UNIDADE</label>
        <input type="text" class="form-control" id="sigla" name="sigla" placeholder="sigla">
      </div>
      <div class="mb-3">

        <input type="text" class="form-control" id="descricao" name="descricao" placeholder="descricao">
      </div>
      <div class="col-auto">
        <button type="submit" class="btn btn-outline-success">Cadastrar</button>

      </div>
    </div>
  </form>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>

</html>