<?php
    require 'vendor/autoload.php';
    require_once 'conectarcadastro.php';

    // Recebe os dados do formulário
    $usuario = $_POST['usuario'];
    $email = $_POST['email'];
    $senha = $_POST['senha'];
    $confirmar_senha = $_POST['confirmar_senha'];

    // Valida os dados recebidos
    if (empty($usuario) || empty($email) || empty($senha)) {
     $_SESSION['erro'] = "Preencha todos os campos.";
        header("Location: http://localhost/cadastro.html");
        exit();
    }

    // Valida o formato do e-mail
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
     $_SESSION['erro'] = "Insira um e-mail válido.";
        header("Location: http://localhost/cadastro.html");
        exit();
    }
    // Valida a força da senha
    if (!preg_match('/^(?=.*[A-Z])(?=.*[0-9])(?=.*[\W]).{8,}$/', $senha)) {
    $_SESSION['erro'] = "A senha deve ter no mínimo 8 caracteres, uma maiúscula, um número e um caractere especial.";
    header("Location: http://localhost/cadastro.php");
    exit();
    }

    // Valida se as senhas coincidem
    if ($senha !== $confirmar_senha) {
     $_SESSION['erro'] = "As senhas não coincidem.";
        header("Location: http://localhost/cadastro.html");
        exit();
    }
    
    // Hash da senha - para armazanamento seguro no banco de dados
    $hash_senha = password_hash($senha, PASSWORD_DEFAULT);

    // Verifica se o nome de usuário já existe
    $sql = "SELECT id FROM usuarios WHERE usuario = :usuario";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':usuario', $usuario);
    $stmt->execute();
    if ($stmt->fetch()) {
    die("Usuário já cadastrado.");
    }

    // Prepara a consulta SQL para inserir os dados na tabela "usuarios"
    $sql = "INSERT INTO usuarios (usuario, email, senha) VALUES (:usuario,:email, :senha)";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':usuario', $usuario);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':senha', $hash_senha);
    
    // Consulta SQL
    if ($stmt->execute()) {
        echo "Cadastro realizado com sucesso!";
    } else {
        echo "Erro ao realizar o cadastro.";
    }
?>