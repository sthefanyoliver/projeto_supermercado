<?php

$db_host = "localhost";
$db_drive = "mysql";
$db_port = 3307;
$db_user = "root";
$db_pasword = "";
$db_database= "ob1";
try{
$conexao = new PDO ($db_drive.":host=".$db_host.":".$db_port.";dbname=".$db_database, $db_user,$db_pasword,
ARRAY (PDO::ATTR_PERSISTENT =>false)
);
//configura nivel de erro na conexão
$conexao->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
}
catch(Exception $E){
    die ("falha na conexão c/banco de dados:".$E->getMessage());
}
?>    