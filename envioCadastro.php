<?php
    require 'vendor/autoload.php';
    require_once 'conectarcadastro.php';

    // Recebe os dados do formulário
    $nome = $_POST['nome'];
    $username = $_POST['username'];
    $data_nascimento = $_POST['Data de nascimento'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $hash_senha = password_hash($senha, PASSWORD_DEFAULT);
    // Prepara a consulta SQL para inserir os dados na tabela "cadastro"
    $sql = "INSERT INTO cadastro (nome, username, data_nascimento, email, senha) VALUES (:nome, :username, :data_nascimento, :email, :senha)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':data_nascimento', $data_nascimento);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':senha', $hash_senha);
    
    // Consulta SQL
    if ($stmt->execute()) {
        echo "Cadastro realizado com sucesso!";
    } else {
        echo "Erro ao realizar o cadastro.";
    }
?>