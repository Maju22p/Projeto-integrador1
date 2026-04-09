<?php session_start();
if (!isset($_SESSION['user_id'])) {
    die("Acesso inválido!");
}
 ?>
<html>
    <head>Redefinir senha</head>
    <body>
        <h1>Redefinir senha</h1>
        <form method="POST" action="atualizar_senha.php">
            <label for="senha">Nova senha:</label>
            <input type="password" id="senha" name="senha" required>
            <label for="confirmar_senha">Confirmar nova senha:</label>
            <input type="password" id="confirmar_senha" name="confirmar_senha" required>
            <button type="submit">Redefinir senha</button>
        </form>
    </body>
</html>