<?php
require __DIR__ . '/vendor/autoload.php';
use Dotenv\Dotenv;
$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

$host = $_ENV['DB_HOST']; 
$dbname = $_ENV['DB_NAME2'];
$username = $_ENV['DB_USER']; // Variável de ambiente para o nome de usuário do banco de dados
$password = $_ENV['DB_PASS']; // Variável de ambiente para a senha do banco de dados

try {
    $conn = new PDO("mysql:host=$host", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
    $sql = "CREATE DATABASE IF NOT EXISTS $dbname";
    $conn->exec($sql); 
    echo "Banco criado com sucesso";
    $conn->exec("USE $dbname");
    // Criação da tabela de tokens 
    $sql = "CREATE TABLE IF NOT EXISTS tokens (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT NOT NULL,
        email VARCHAR(255) NOT NULL,
        token VARCHAR(255) NOT NULL,
        criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
        expiracao DATETIME NOT NULL,
        usado BOOLEAN DEFAULT FALSE
    ) ";
    $conn->exec($sql);
} catch(PDOException $e) {
    echo "Erro: " . $e->getMessage();
}