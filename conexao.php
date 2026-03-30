<?php
require __DIR__ . '/vendor/autoload.php';
use Dotenv\Dotenv; 
$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();
require_once 'banco-dados.php';
// Conexão com o banco de dados usando PDO
try {
    $conn = new PDO("mysql:host={$_ENV['DB_HOST']};dbname={$_ENV['DB_NAMEU']}", $_ENV['DB_USER'], $_ENV['DB_PASS']);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Erro de conexão: " . $e->getMessage();
}

?>