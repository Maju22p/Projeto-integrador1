<?php session_start(); ?>
<html>
<head>
    <title>Login simples</title>
</head>
<body>
    <h1>Login simples</h1>
    <form method="POST" action="enviologin.php">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>
        <label for="password">Senha:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Entrar">
        <input type="submit" value="Esqueci minha senha">
        
    </form>
</body>
</html>