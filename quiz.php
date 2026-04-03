<?php
session_start();
include("testeconexao.php");

// iniciar pergunta
if (!isset($_SESSION['pergunta_atual'])) {
    $_SESSION['pergunta_atual'] = 1;
}

// verificar resposta
if (isset($_POST['resposta'])) {

    $id_alt = $_POST['resposta'];

    $sql_check = "SELECT correta FROM alternativas WHERE id_alternativa = $id_alt";
    $res_check = $conn->query($sql_check);
    $dados = $res_check->fetch_assoc();

    if ($dados && $dados['correta'] == 1) {
        $_SESSION['mensagem'] = "✅ Acertou!";
    } else {
        $_SESSION['mensagem'] = "❌ Errou!";
    }

    $_SESSION['pergunta_atual']++;

    header("Location: quiz.php");
    exit();
}

// 🔥 pega total de perguntas automaticamente
$sql_total = "SELECT COUNT(*) as total FROM perguntas";
$res_total = $conn->query($sql_total);
$total = $res_total->fetch_assoc()['total'];

// verifica fim do quiz
if ($_SESSION['pergunta_atual'] > $total) {
    echo "<h1>🎉 Fim do Quiz!</h1>";
    echo '<a href="index.php"><button>Voltar ao menu</button></a>';
    session_destroy();
    exit();
}

// buscar pergunta atual
$id_pergunta = $_SESSION['pergunta_atual'];

$sql = "SELECT * FROM perguntas WHERE id_pergunta = $id_pergunta";
$result = $conn->query($sql);
$pergunta = $result->fetch_assoc();

// 🔥 evita erro null
if (!$pergunta) {
    echo "<h1>Erro: pergunta não encontrada</h1>";
    exit();
}

// buscar alternativas aleatórias
$sql2 = "SELECT * FROM alternativas WHERE id_pergunta = $id_pergunta ORDER BY RAND()";
$result2 = $conn->query($sql2);
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Quiz</title>

<style>
body {
    font-family: Arial;
    background: #0f172a;
    color: white;
    text-align: center;
}

.container {
    margin-top: 100px;
}

button {
    display: block;
    margin: 10px auto;
    padding: 10px 20px;
    border-radius: 10px;
    cursor: pointer;
}
</style>
</head>

<body>

<div class="container">

<?php
// mostra progresso (TOP 🔥)
echo "<p>Pergunta ".$_SESSION['pergunta_atual']." de ".$total."</p>";

if (isset($_SESSION['mensagem'])) {
    echo "<p>" . $_SESSION['mensagem'] . "</p>";
    unset($_SESSION['mensagem']);
}
?>

<h2><?php echo $pergunta['texto_pergunta']; ?></h2>

<?php while($alt = $result2->fetch_assoc()) { ?>
    <form method="POST">
        <button type="submit" name="resposta" value="<?php echo $alt['id_alternativa']; ?>">
            <?php echo $alt['texto_alternativa']; ?>
        </button>
    </form>
<?php } ?>

</div>

</body>
</html>