<?php
session_start();

if (!isset($_SESSION['idusuario'])) {
  die("Você não tem permissão para acessar essa pagina!");
}

$nomeusuario = $_SESSION['nome'];
$idusuario = $_SESSION['idusuario'];
require_once('../conexao.php');

$filtro = '';
$campo = 'p.descproduto';
if (isset($_GET['filtro'])) {
  $filtro = $_GET['filtro'];
}
if (isset($_GET['campo'])) {
  $campo = $_GET['campo'];
}




$sql = "select p.*, s.descsegmproduto, u.descrunidmedida 
    from produto p 
    join unidmedida u on u.idUnidMedida = p.UnidadeMedida join 
    segmento s on s.idSegmProduto = p.Segmento  
    WHERE " . $campo . " like concat ('%',?,'%')"; //comando sql a ser mandado para o banco
$statement = $conexao->prepare($sql); //preparacao do preparestatemant
$statement->execute([$filtro]); //execucao do preparestatemant

$sql = "select * from segmento"; //comando sql a ser mandado para o banco
$statementSegmento = $conexao->prepare($sql); //preparacao do preparestatemant
$statementSegmento->execute(); //execucao do preparestatemant

$sql = "select * from unidmedida"; //comando sql a ser mandado para o banco
$statementUnidade = $conexao->prepare($sql); //preparacao do preparestatemant
$statementUnidade->execute(); //execucao do preparestatemant

// Definir as configurações iniciais
$registrosPorPagina = 10;
$paginaAtual = isset($_GET['pagina']) ? $_GET['pagina'] : 1;
$offset = ($paginaAtual - 1) * $registrosPorPagina;

// Consultar o banco de dados para obter os registros da página atual
// Contar o número total de registros
$totalRegistros = $conexao->query("SELECT COUNT(*) AS total FROM produto")->fetchColumn();

// Consultar os registros da página atual
// Consultar os registros da página atual
$resultado = $conexao->prepare("SELECT p.idProduto, s.DescSegmProduto as descsegmproduto, u.DescrUnidMedida as descrunidmedida, p.DescProduto, p.valorUnitario
                FROM produto p
                INNER JOIN segmento s ON s.idSegmProduto = p.Segmento
                INNER JOIN unidmedida u ON u.idUnidMedida = p.UnidadeMedida
                ORDER BY p.idProduto
                LIMIT :offset, :registrosPorPagina");

$resultado->bindParam(':offset', $offset, PDO::PARAM_INT);
$resultado->bindParam(':registrosPorPagina', $registrosPorPagina, PDO::PARAM_INT);
$resultado->execute();



$registros = $statement->fetchAll(PDO::FETCH_ASSOC);
$registros = $resultado->fetchAll(PDO::FETCH_ASSOC);
// Calcular o número total de páginas
$totalPaginas = ceil($totalRegistros / $registrosPorPagina);



?>

<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PRODUTOS</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" href="../css/style_produtos.css">
  <style>


  </style>
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
          <a class="nav-link" href="unidade.php">UNIDADE</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="produtos.php">PRODUTOS</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="usuarios.php">USUARIOS</a>
        </li>
      </ul>
      <form class="d-flex" role="search" action="produtos.php" method="get">
        <input type="hidden" name="campo" value="<?= $campo ?>" />
        <input class="form-control me-2" type="search" placeholder="filtro" aria-label="Search" name="filtro">
        <button class="btn btn-outline-success" type="submit">PESQUISA</button>
        <p class="usuario" style="text-align: right;"><a href="../logout.php"> Sair </a></p>
      </form>
    </div>
    </div>
  </nav>


  <form action="../produto/excluirprodutos.php" method="post">
    <table class="table table-dark table-striped">
      <thead>
        <tr>
          <th> <input class="btn btn-outline-success" type="submit" value="APAGAR" title="Apagar"> </th>
          <th scope="col"><a href="?campo=p.idProduto"> ID </a></th>
          <th scope="col"><a href="?campo=s.DescSegmProduto">SEGMENTO </a></th>
          <th scope="col"><a href="?campo=u.DescrUnidMedida">UNIDADE DE MEDIDA </a></th>
          <th scope="col"><a href="?campo=p.DescProduto">DESCRICAO</a></th>
          <th scope="col"><a href="?campo=p.valorUnitario"><a href="idProduto">VALOR UNITÁRIO</a></th>
          <th> &nbsp; </th>
          <th> &nbsp; </th>



        </tr>
      </thead>
      <tbody>
        <?php
        //$registros = $resultado->fetchAll(PDO::FETCH_ASSOC);

        foreach ($registros as $linha) {
        ?>
          <tr>
            <td><input type="checkbox" name="ids[]" value="<?= $linha['idProduto'] ?>"></td>
            <td><?= $linha['idProduto'] ?></td>
            <td><?= $linha['descsegmproduto'] ?></td>
            <td><?= $linha['descrunidmedida'] ?></td>
            <td><?= $linha['DescProduto'] ?></td>
            <td><?= $linha['valorUnitario'] ?></td>
            <td> <a href="formproduto.php?id=<?= $linha['idProduto'] ?>"> Editar </a> </td>
            <td> <a href="../produto/excluiproduto.php?id=<?= $linha['idProduto'] ?>"> Excluir </a> </td>


          </tr>
        <?php
        }
        ?>
      </tbody>
    </table>
  </form>
  <form action="../produto/cadastraproduto.php" method="post">
    <div class="cadastro">
      <div class="mb-3">
        <label for="segmento" class="form-label">CADASTRAR NOVO PRODUTO</label>
        <label for="segmento" class="form-label"></label>
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

        <input type="text" class="form-control" id="descricao" name="descricao" placeholder="descricao produto">
      </div>
      <div class="mb-3">

        <input type="text" class="form-control" id="valor" name="valor" placeholder="valor unitario">
      </div>
      <div class="col-auto">
        <button type="submit" class="btn btn-outline-success">Cadastrar</button>
      </div>
    </div>
  </form>
  <div class="pagination">
    <?php if ($paginaAtual > 1) : ?>
      <a href="?pagina=<?= ($paginaAtual - 1) ?>"></a>
    <?php else : ?>
      <span class="disabled"></span>
    <?php endif; ?>

    <?php for ($i = 1; $i <= $totalPaginas; $i++) : ?>
      <?php if ($i == $paginaAtual) : ?>
        <span class="current"><?= $i ?></span>
      <?php else : ?>
        <a href="?pagina=<?= $i ?>"><?= $i ?></a>
      <?php endif; ?>
    <?php endfor; ?>

    <?php if ($paginaAtual < $totalPaginas) : ?>
      <a href="?pagina=<?= ($paginaAtual + 1) ?>"></a>
    <?php else : ?>
      <span class="disabled">Próxima</span>
    <?php endif; ?>
  </div>



  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>

</html>