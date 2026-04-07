<?php
    require 'vendor/autoload.php';
    require_once 'conexao.php';
    require 'funcoes.php';

    //$email = $_POST['email'];
    $user_id = 67; // Exemplo de ID de usuário, substitua pelo ID real do usuário
    $email = $_POST['email']; // email do usuário para enviar o token
    
    $token = criarToken($user_id, $email); // Cria um token e salva no banco de dados
    enviarEmail($email, $token); // Envia o token por email

?>
