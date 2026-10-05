<?php

include "conexao.php";

if($_SERVER["REQUEST_METHOD"]=="POST"){
    $nome = trim($_POST['nome']);
    $email = trim($_POST['email']);
    $senha = $_POST['senha'];
    $tipo_perfil = $_POST['tipo_perfil'];

    $_verificaEmail = "select id from tbl_usuarios
                        where email = :email";
    $_preparaConsulta = $cn->prepare($_verificaEmail);
    $_preparaConsulta->bindValue(':email',email,PDO::PARAM_STR);
    $_preparaConsulta->execute();

    if($_preparaConsulta->rowCount() > 0){
        echo "<script>
                alert('O email informado ja está cadastrado no sistema! Tente fazer o login')
                window.location.href='login.php'
            </script>";
    }
}

?>