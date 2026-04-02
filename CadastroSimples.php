<?php session_start(); ?>
<html>
    <head>
        <title>Cadastro simples</title>
    </head>
    <body>
        <h1>Cadastro simples</h1>
        <?php if (!empty($_SESSION['erro'])): ?>
            <p style="color:red;"><?= $_SESSION['erro']; unset($_SESSION['erro']); ?></p>
        <?php endif; ?>

        <?php if (!empty($_SESSION['sucesso'])): ?>
            <p style="color:green;"><?= $_SESSION['sucesso']; unset($_SESSION['sucesso']); ?></p>
        <?php endif; ?>

         <form method="POST" action="http://localhost/envioCadastro.php">
            
            <label for="usuario">Usuário:</label>
            <input type="text" id="usuario" name="usuario" required><br><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br><br>

            <label for="senha">Senha:</label>
            <input type="password" id="senha" name="senha" required><br><br>

            <label for ="confirmar_senha">Confirmar senha:</label>
            <input type="password" id="confirmar_senha" name="confirmar_senha" required><br><br>

            <input type="submit" value="Cadastrar">
        </form>
    </body>
</html>