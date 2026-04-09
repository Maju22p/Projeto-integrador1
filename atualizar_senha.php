<?php
session_start();
require_once 'conexao.php';

// Verifica se o usuário tem permissão para acessar esta página
if (!isset($_SESSION['user_id'])) {
    die("Acesso inválido!");
}

// Verifica se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die('Requisição inválida.');
}

// Recebe os dados do formulário
$user_id = $_SESSION['user_id'];
$nova_senha = $_POST['senha'];
$confirmar_senha = $_POST['confirmar_senha'];

// Validação das senhas
if ($nova_senha !== $confirmar_senha) {
    die('As senhas não coincidem.');
}
// Verifica se a senha atende aos critérios de segurança
if (!preg_match('/^(?=.*[A-Z])(?=.*[0-9])(?=.*[\W]).{8,}$/', $nova_senha)) {
    die("A senha deve ter no mínimo 8 caracteres, uma letra maiúscula, um número e um caractere especial!");
}
//  Verifica se a nova senha é diferente da senha atual
try {
    $hash_nova_senha = password_hash($nova_senha, PASSWORD_BCRYPT);
    $stmt = $conn->prepare("UPDATE usuarios SET senha = :senha WHERE id = :user_id");
    $stmt->execute(['senha' => $hash_nova_senha, 'user_id' => $user_id]);

    unset($_SESSION['user_id']);
    echo 'Senha redefinida com sucesso!';
} catch (PDOException $e) {
    die('Erro ao redefinir senha: ' . $e->getMessage());
}
?>