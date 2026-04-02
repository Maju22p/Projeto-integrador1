Funcionalidades implementadas:

Criação automática do banco de dados e tabela usuarios via BancoCadastro.php
Campos: id, usuario, email, senha
Cadastro com validação de campos vazios
Validação de formato de e-mail
Regras de senha: mínimo 8 caracteres, uma letra maiúscula, um número e um caractere especial
Confirmação de senha
Prevenção de duplicação de usuário e email
Hash de senha com password_hash()
Mensagens de erro e sucesso via sessão ($_SESSION)
Limite de tentativas de cadastro por IP com janela de 15 minutos (tabela tentativas_cadastro)

Arquivos modificados/criados:

BancoCadastro.php — criação do banco e tabelas
conectarcadastro.php — conexão com o banco
envioCadastro.php — lógica de validação e inserção
cadastro.php — formulário com exibição de mensagens

Pendente:

Implementação de CAPTCHA (aguardando decisão da equipe)
Verificação de email (será implementada junto com redefinição de senha)
Mudança de diretório a certos arquivos
