<?php
    require 'vendor/autoload.php';
    require_once 'conexao.php';
    require 'funcoes.php';

    $email = $_POST['email']; // email do usuário para enviar o token
    
    // Verifica se o email existe no banco de dados
    $smtmt = $conn->prepare("SELECT id FROM usuarios WHERE email = :email");
    $smtmt->execute(['email' => $email]);
    $user = $smtmt->fetch(PDO::FETCH_ASSOC);
    if (!$user) {
        echo "Email não encontrado!";
        exit;
    }
    
    $token = criarToken($user['id'], $email);
    $link = "http://localhost/Verificar-token.php?token=$token"; // alterar para o domínio real depois
    enviarEmail($email, $link);
?>
