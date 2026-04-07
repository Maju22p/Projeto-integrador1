F# 📌 Funcionalidades Implementadas

- Criação automática do banco de dados e tabela `usuarios` via `BancoCadastro.php`
- Campos da tabela:
  - `id`
  - `usuario`
  - `email`
  - `senha`
- Cadastro com validação de campos vazios
- Validação de formato de e-mail
- Regras de senha:
  - Mínimo de 8 caracteres  
  - Pelo menos uma letra maiúscula  
  - Pelo menos um número  
  - Pelo menos um caractere especial  
- Confirmação de senha
- Prevenção de duplicação de usuário e e-mail
- Hash de senha utilizando `password_hash()`
- Mensagens de erro e sucesso via sessão (`$_SESSION`)
- Redirecionameto para páginas de Login e de Redefinição de senha

---

# 📂 Arquivos Modificados / Criados

- `BancoCadastro.php` — criação do banco e tabelas  
- `conectarcadastro.php` — conexão com o banco  
- `envioCadastro.php` — lógica de validação e inserção  
- `cadastro.php` — formulário com exibição de mensagens  

---

# ⚠️ Pendente

- Implementação de CAPTCHA *(aguardando decisão da equipe)*  
- Verificação de e-mail *(será implementada junto com redefinição de senha)*  
- Mudança de diretório de alguns arquivos  
