<?php session_start(); ?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Redefinir Senha</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <H2>Redefinir Senha</H2>
        <form action="tokens.php" method="POST">
            <label for="email">Digite seu email:</label>
            <input type="email" id="email" name="email" required>
            <button type="submit">Enviar</button>
            <p>Após clicar em "Enviar", um email com um link para redefinir sua senha será enviado para o endereço fornecido.</p>
        </form>
        <button onclick="window.location.href='login.php'">Voltar para Login</button>
    </body>
</html>