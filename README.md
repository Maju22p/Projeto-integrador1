# Redefinição de Senha
 
Módulo responsável pelo fluxo completo de redefinição de senha.
 
## Arquivos
 
| Arquivo | Descrição |
|---|---|
| `redefinirsenha` | Formulario para inserir o email|
| `Tokens.php` | Recebe o email, verifica no banco e dispara o email com o link |
| `funcoes.php` | Funções `criarToken()` e `enviarEmail()` |
| `Verificar-token.php` | Valida o token recebido pela URL |
| `redefinir_senha.php` | Formulário de nova senha |
| `atualizar_senha.php` | Atualiza a senha no banco |
| `conexao.php` | Conecta outros arquivos ao banco de dados|
| `banco-dados.php` | Cria o banco de dados da redefinição de senha|
 
## Fluxo
 
```
Usuário informa email
    → verifica se existe no banco
    → gera token e envia link por email
    → usuário clica no link
    → token é validado
    → usuário redefine a senha
```
 
## Variáveis de ambiente necessárias
 
```env
DB_HOST=
DB_USER=
DB_PASS=
DB_NAME2=
 
SMTP_HOST=smtp.gmail.com
SMTP_USER=
SMTP_PASS=   # Senha de App do Google, não a senha normal
SMTP_PORT=587
```
