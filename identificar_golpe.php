<?php
session_start();
include("testeconexao.php");

if(!isset($_SESSION['cenario'])){
    $_SESSION['cenario']=1;
}

$cenario_id=$_SESSION['cenario'];

/* CORREÇÃO AQUI */
$sql="SELECT * FROM cenarios_golpe WHERE id_cenario=$cenario_id";
$res=$conn->query($sql);
$cenario=$res->fetch_assoc();

if(!$cenario){
    echo "<body style='font-family:Arial;background:#0f172a;color:white;text-align:center;margin-top:150px'>";
    echo "<h1>Parabéns! Você concluiu o jogo.</h1>";
    echo "<a href='index.php'><button>Voltar ao Menu</button></a>";
    echo "</body>";
    session_destroy();
    exit();
}

/* CORREÇÃO AQUI */
$sql2="SELECT * FROM erros_cenario WHERE id_cenario=$cenario_id";
$erros=$conn->query($sql2);

$lista=[];
while($e=$erros->fetch_assoc()){
    $lista[]=$e;
}

$resposta="";
$explicacao="";
$acertou=false;

if(isset($_POST['x'])){

    $x=$_POST['x'];
    $y=$_POST['y'];

    foreach($lista as $erro){

        $dist=sqrt(pow($x-$erro['pos_x'],2)+pow($y-$erro['pos_y'],2));

        if($dist<$erro['raio']){
            $resposta="✔ Você encontrou o golpe!";
            $explicacao=$erro['explicacao'];
            $acertou=true;
            break;
        }
    }

    if(!$acertou){
        $resposta="❌ Não é esse o problema. Tente novamente.";
    }

}

if(isset($_POST['proximo'])){
    $_SESSION['cenario']++;
    header("Location: identificar_golpe.php");
    exit();
}
?>

<html>
<head>
<meta charset="UTF-8">
<title>Identificador de Golpes</title>

<style>
body{
    font-family:Arial;
    background:#0f172a;
    color:white;
    text-align:center;
}

img{
    max-width:900px;
    border:3px solid white;
    cursor:pointer;
}

button{
    padding:12px;
    margin-top:20px;
    border-radius:8px;
}
</style>

</head>

<body>

<h2><?php echo $cenario['titulo']; ?></h2>
<p>Clique na parte da imagem que você acredita ser um sinal de golpe.</p>

<form method="POST" id="form">
<input type="hidden" name="x" id="x">
<input type="hidden" name="y" id="y">

<img src="imagens/<?php echo $cenario['imagem']; ?>" onclick="clicar(event)">
</form>

<h3><?php echo $resposta; ?></h3>
<p><?php echo $explicacao; ?></p>

<?php if($acertou){ ?>

<form method="POST">
<button name="proximo">Próxima imagem</button>
</form>

<?php } ?>

<script>

function clicar(e){

    var rect=e.target.getBoundingClientRect();

    var x=e.clientX-rect.left;
    var y=e.clientY-rect.top;

    document.getElementById("x").value=x;
    document.getElementById("y").value=y;

    document.getElementById("form").submit();
}

</script>

</body>
</html>