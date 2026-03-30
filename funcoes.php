<?php
    require 'vendor/autoload.php';
    require_once 'conexao.php';
    
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception as MailerException;
    
    $mail = new PHPMailer(true);

    function criarToken($user_id, $email){
        global $conn; 
        $token = bin2hex(random_bytes(32)); // Criação de um token 
        $expiracao = time() + 300; //  expiração do token (5 minutos)
        $hash = password_hash($token, PASSWORD_BCRYPT); // Hash do token para armazenamento seguro

        try {
            $stmt = $conn->prepare("INSERT INTO tokens (user_id, email, token, expiracao) VALUES (:user_id, :email, :token, :expiracao)");
            $stmt->bindParam(':user_id', $user_id);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':token', $hash);
            $expiracaoformatada = date('Y-m-d H:i:s', $expiracao);
            $stmt->bindParam(':expiracao', $expiracaoformatada);
            $stmt->execute();
            return $token; // Retorna o token original para envio por email
        } catch(PDOException $e){
            echo "Erro ao salvar token: " . $e->getMessage();
            return null;
        }
    }

    function enviarEmail($email, $token){
        global $mail; // Acessa a instância global do PHPMailer
        try {
            $mail->isSMTP();
            $mail -> Host = $_ENV['SMTP_HOST'];
            $mail -> SMTPAuth = true;
            $mail -> Username = $_ENV['SMTP_USER'];
            $mail -> Password = $_ENV['SMTP_PASS'];
            $mail -> Port = $_ENV['SMTP_PORT'];

            // Configurações do email
            $mail->setFrom($_ENV['SMTP_USER'], 'Redefinir Senha');
            $mail->addAddress($email);
            $mail->Subject = 'Redefinir sua senha';
            $mail->Body = "Use o seguinte token para redefinir sua senha: $token";

            // Enviar o email
            $mail->send();
            echo "Email enviado com sucesso para $email";
        } catch (MailerException $e) {
            echo "Erro ao enviar email: " . $e->getMessage();
        }
    }
