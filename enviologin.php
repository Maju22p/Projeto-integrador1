<?php
session_start();
require 'vendor/autoload.php';
require_once 'conectarcadastro.php';

$email = $_POST['email'];
$senha = $_POST['password'];

if (empty($email) || empty($senha)) {
    $_SESSION['erro'] = "Preencha todos os campos.";
    header("Location: http://localhost/login.php"); //alterar para o caminho correto do login.php
    exit();
}

$sql = "SELECT * FROM usuarios WHERE email = :email";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':email', $email);
$stmt->execute();
$usuario = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$usuario || !password_verify($senha, $usuario['senha'])) {
    $_SESSION['erro'] = "Email ou senha incorretos.";
    header("Location: http://localhost/login.php"); //alterar para o caminho correto do login.php
    exit();
}

$_SESSION['usuario_id'] = $usuario['id'];
$_SESSION['usuario_nome'] = $usuario['usuario'];

header("Location: http://localhost/home.php"); //alterar para o caminho correto do home.php
exit();
?>