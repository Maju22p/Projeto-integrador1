## Login

### Funcionalidades implementadas
- Login com email e senha
- Verificação da senha com `password_verify()` contra o hash armazenado no banco
- Validação de campos vazios
- Mensagens de erro via sessão (`$_SESSION['erro']`)
- Criação de sessão do usuário após login bem sucedido (`$_SESSION['usuario_id']` e `$_SESSION['usuario_nome']`)
- Logout com destruição completa da sessão via `session_destroy()`
- Redirecionamento para pagina de cadastro e redefinição de senha

### Arquivos
| Arquivo | Descrição |
|---|---|
| `login.php` | Formulário de login com exibição de mensagens |
| `envioLogin.php` | Lógica de autenticação e criação de sessão |
| `logout.php` | Encerramento da sessão e redirecionamento para login |
| `home.php` | Pagina teste para mostrar que esta funcionando (deve ser substituida) |

### Pendente
- [ ] Proteção de páginas internas (redirecionar para login se sessão não existir)
- [ ] Limite de tentativas de login por IP
