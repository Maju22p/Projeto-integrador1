<?php 
session_start();
require_once 'conexao.php';

if (!isset($_GET['token'])) {
    die("Token inválido!");
}

$token = $_GET['token'];

try {
    $stmt = $conn->prepare("SELECT * FROM tokens WHERE expiracao > NOW() AND usado = FALSE");
    $stmt->execute();
    $tokens = $stmt->fetchAll();

    $tokenValido = null;

    foreach ($tokens as $t) {
        var_dump(password_verify($token, $t['token'])); // vê se algum bate
        if (password_verify($token, $t['token'])) {
            $tokenValido = $t;
            break;
        }
    }

    if (!$tokenValido) {
        die("Token inválido ou expirado!");
    }

    $stmt = $conn->prepare("UPDATE tokens SET usado = TRUE WHERE id = :id");
    $stmt->execute(['id' => $tokenValido['id']]);

    $_SESSION['user_id'] = $tokenValido['user_id'];
    header("Location: redefinir_senha.php");
    exit;
    
} catch (PDOException $e) {
    die("Erro: " . $e->getMessage());
}

?> 
