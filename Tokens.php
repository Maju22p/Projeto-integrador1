<?php
    require 'vendor/autoload.php';
    require_once 'conexao.php';
    require 'funcoes.php';

    //$email = $_POST['email'];
    $user_id = 67; // Exemplo de ID de usuário, substitua pelo ID real do usuário
    $email = 'rayica8235@flownue.com'; // Exemplo de email, substitua pelo email real do usuário
    
    $token = criarToken($user_id, $email);
    enviarEmail($email, $token);

    //tirar vardump ao terminar
    //var_dump($token);
    //var_dump($expiracao);
    //var_dump($hash);
?>
