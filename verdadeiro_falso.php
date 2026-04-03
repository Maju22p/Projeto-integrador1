<?php
session_start();
include("testeconexao.php");

if (!isset($_SESSION['vf_pergunta'])) {
    $_SESSION['vf_pergunta'] = 1;
}

$id = $_SESSION['vf_pergunta'];

$sql = "SELECT * FROM verdadeiro_falso WHERE id_pergunta = $id";
$result = $conn->query($sql);
$pergunta = $result->fetch_assoc();

if (!$pergunta) {

    echo "<h1>Fim do questionário</h1>";
    echo '<a href="index.php"><button>Voltar ao menu</button></a>';
    session_destroy();
    exit();
}

$resposta_dada = false;
$mensagem = "";
$explicacao = "";

if (isset($_POST['resposta'])) {

    $resposta_usuario = $_POST['resposta'];
    $resposta_dada = true;

    if ($resposta_usuario == $pergunta['resposta_correta']) {
        $mensagem = "✅ Resposta correta!";
    } else {
        $mensagem = "❌ Resposta incorreta!";
    }

    $explicacao = $pergunta['explicacao'];
}

if (isset($_POST['proxima'])) {

    $_SESSION['vf_pergunta']++;
    header("Location: verdadeiro_falso.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verdadeiro ou Falso</title>

<style>
body{
font-family:Arial;
background:#0f172a;
color:white;
text-align:center;
}

button{
margin:10px;
padding:15px;
border-radius:10px;
cursor:pointer;
}

.explicacao{
margin-top:20px;
max-width:700px;
margin-left:auto;
margin-right:auto;
}
</style>

</head>

<body>

<h2><?php echo $pergunta['pergunta']; ?></h2>

<?php if(!$resposta_dada){ ?>

<form method="POST">
<button name="resposta" value="1">Verdadeiro</button>
<button name="resposta" value="0">Falso</button>
</form>

<?php } ?>

<?php if($resposta_dada){ ?>

<h3><?php echo $mensagem; ?></h3>

<div class="explicacao">
<p><b>Explicação:</b> <?php echo $explicacao; ?></p>
</div>

<form method="POST">
<button name="proxima">Próxima pergunta</button>
</form>

<?php } ?>

</body>
</html>