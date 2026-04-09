<?php
    require 'vendor/autoload.php';
    require_once 'conexao.php';

    
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;    
    use PHPMailer\PHPMailer\Exception as MailerException;
    
    $mail = new PHPMailer(true);

    function criarToken($user_id, $email){
        global $conn; 
        $token = bin2hex(random_bytes(32)); // Criação de um token 
        $expiracao = time() + 300; //  expiração do token (5 minutos)
        $formatarexpiracao =gmdate('Y-m-d H:i:s', $expiracao); // Formata a data de expiração para o formato do banco de dados
        $hash = password_hash($token, PASSWORD_BCRYPT); // Hash do token para armazenamento seguro

        try {
            // Remove tokens antigos ou usados
            $conn->prepare("DELETE FROM tokens WHERE usado = TRUE OR expiracao < DATE_SUB(NOW(), INTERVAL 5 HOUR)")
                ->execute();

            $conn->prepare("INSERT INTO tokens (user_id, email, token, expiracao) VALUES (:user_id, :email, :token, :expiracao)")
                ->execute(['user_id' => $user_id, 'email' => $email, 'token' => $hash, 'expiracao' => $formatarexpiracao]); 

            return $token; // Retorna o token original para envio por email
        } catch(PDOException $e){
            echo "Erro ao salvar token: " . $e->getMessage();
            return null;
        }
    }

    function enviarEmail($email, $link){
        global $mail; // Acessa a instância global do PHPMailer
        try {
            $mail->isSMTP();
            $mail -> Host = $_ENV['SMTP_HOST'];
            $mail -> SMTPAuth = true;
            $mail -> Username = $_ENV['SMTP_USER'];
            $mail -> Password = $_ENV['SMTP_PASS'];
            $mail -> Port = $_ENV['SMTP_PORT'];
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;

            // Configurações do email
            $mail->setFrom($_ENV['SMTP_USER'], 'Redefinir Senha');
            $mail->addAddress($email); 
            $mail->isHTML(true);
            // Conteúdo do email
            $mail->Subject = 'Redefinir sua senha';
            $mail->Body = "Clique no link para redefinir sua senha: <a href='$link'>Redefinir senha</a>";
            $mail->AltBody = "Clique no link para redefinir sua senha: $link";

            if($mail->send()){
                echo "Email enviado para $email";
            } else {
                echo "Erro ao enviar email: " . $mail->ErrorInfo;
            }
            echo "Email enviado com sucesso para $email";
        } catch (MailerException $e) {
            echo "Erro ao enviar email: " . $e->getMessage();
        }
    }
    ?>