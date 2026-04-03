-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/03/2026 às 02:58
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `quiz_golpes_digitais`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alternativas`
--

CREATE TABLE `alternativas` (
  `id_alternativa` int(11) NOT NULL,
  `id_pergunta` int(11) DEFAULT NULL,
  `texto_alternativa` text DEFAULT NULL,
  `correta` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `alternativas`
--

INSERT INTO `alternativas` (`id_alternativa`, `id_pergunta`, `texto_alternativa`, `correta`) VALUES
(1609, 1, 'Tentativa de roubar dados fingindo ser empresa confiável', 1),
(1610, 1, 'Sistema automático de proteção de e-mails', 0),
(1611, 1, 'Tipo de backup de segurança online', 0),
(1612, 1, 'Ferramenta usada para acelerar a internet', 0),
(1613, 2, 'Erros de escrita e endereço estranho do remetente', 1),
(1614, 2, 'Layout moderno e bem organizado', 0),
(1615, 2, 'Envio automático do banco oficial', 0),
(1616, 2, 'Mensagem com assinatura digital válida', 0),
(1617, 3, 'Nunca informar e entrar em contato com o banco', 1),
(1618, 3, 'Responder rapidamente para evitar bloqueio', 0),
(1619, 3, 'Clicar no link e atualizar os dados', 0),
(1620, 3, 'Ignorar e continuar usando normalmente', 0),
(1621, 4, 'Fraude onde o golpista engana a vítima para transferir dinheiro', 1),
(1622, 4, 'Erro no sistema bancário durante transferência', 0),
(1623, 4, 'Taxa obrigatória cobrada pelo banco', 0),
(1624, 4, 'Atualização de segurança do aplicativo', 0),
(1625, 5, 'Boleto adulterado que direciona pagamento ao golpista', 1),
(1626, 5, 'Documento oficial emitido pelo banco', 0),
(1627, 5, 'Comprovante automático de pagamento', 0),
(1628, 5, 'Cobrança legítima de serviço contratado', 0),
(1629, 6, 'Conferindo o endereço e se possui HTTPS com cadeado', 1),
(1630, 6, 'Observando se o site é colorido e bonito', 0),
(1631, 6, 'Verificando se possui muitas imagens', 0),
(1632, 6, 'Acessando apenas pelo celular', 0),
(1633, 7, 'Roubo de dados pessoais ou instalação de vírus', 1),
(1634, 7, 'Melhoria no desempenho do dispositivo', 0),
(1635, 7, 'Atualização automática do sistema', 0),
(1636, 7, 'Aumento da velocidade da internet', 0),
(1637, 8, 'Técnica de manipulação psicológica para enganar pessoas', 1),
(1638, 8, 'Sistema de segurança digital avançado', 0),
(1639, 8, 'Ferramenta de criptografia de dados', 0),
(1640, 8, 'Programa para melhorar redes sociais', 0),
(1641, 9, 'Para dificultar o acesso de invasores às contas', 1),
(1642, 9, 'Para aumentar a velocidade da internet', 0),
(1643, 9, 'Para melhorar o desempenho do celular', 0),
(1644, 9, 'Para evitar atualizações do sistema', 0),
(1645, 10, 'Camada extra de segurança além da senha', 1),
(1646, 10, 'Substituição completa da senha', 0),
(1647, 10, 'Sistema que desativa contas automaticamente', 0),
(1648, 10, 'Ferramenta para limpar dados do dispositivo', 0),
(1649, 11, 'Pode permitir interceptação de dados por terceiros', 1),
(1650, 11, 'Sempre aumenta a segurança da conexão', 0),
(1651, 11, 'Bloqueia automaticamente ataques virtuais', 0),
(1652, 11, 'Impede acesso a sites perigosos', 0),
(1653, 12, 'Possível golpe ou fraude online', 1),
(1654, 12, 'Desconto oficial do governo', 0),
(1655, 12, 'Campanha obrigatória das empresas', 0),
(1656, 12, 'Erro de sistema sempre corrigido depois', 0),
(1657, 13, 'Conter vírus ou programas maliciosos', 1),
(1658, 13, 'Ser mais seguros que os oficiais', 0),
(1659, 13, 'Melhorar o desempenho do celular', 0),
(1660, 13, 'Aumentar a duração da bateria', 0),
(1661, 14, 'Denunciar e evitar compartilhar a informação falsa', 1),
(1662, 14, 'Ignorar completamente e não fazer nada', 0),
(1663, 14, 'Compartilhar para avisar amigos sem verificar', 0),
(1664, 14, 'Responder ao golpista para entender melhor', 0),
(1665, 15, 'Quando alguém acessa sua conta usando código de verificação', 1),
(1666, 15, 'Atualização automática do aplicativo', 0),
(1667, 15, 'Erro no servidor do WhatsApp', 0),
(1668, 15, 'Falha temporária de conexão com a internet', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`, `descricao`) VALUES
(1, 'Phishing', 'Golpes por email ou mensagens falsas'),
(2, 'Golpes Bancarios', 'Fraudes envolvendo bancos'),
(3, 'Redes Sociais', 'Golpes em redes sociais'),
(4, 'Compras Online Falsas', NULL),
(5, 'Segurança Digital', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cenarios_golpe`
--

CREATE TABLE `cenarios_golpe` (
  `id_cenario` int(11) NOT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cenarios_golpe`
--

INSERT INTO `cenarios_golpe` (`id_cenario`, `titulo`, `imagem`, `descricao`) VALUES
(1, 'Site falso de banco', 'banco_falso.png', 'Identifique sinais de golpe.'),
(2, 'Loja online suspeita', 'loja_falsa.png', 'Identifique sinais de fraude.'),
(3, 'Email phishing', 'email_phishing.png', 'Identifique sinais de phishing.'),
(4, 'Email falso Receita Federal', 'golpe1.png', NULL),
(5, 'Site falso Banco', 'golpe2.png', NULL),
(6, 'Promoção falsa PlayStation', 'golpe3.png', NULL),
(7, 'SMS falso Correios', 'golpe4.png', NULL),
(8, 'Loja falsa ecommerce', 'golpe5.png', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conquistas`
--

CREATE TABLE `conquistas` (
  `id_conquista` int(11) NOT NULL,
  `nome_conquista` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `xp_bonus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conquistas`
--

INSERT INTO `conquistas` (`id_conquista`, `nome_conquista`, `descricao`, `xp_bonus`) VALUES
(1, 'Primeira Resposta', 'Responder primeira pergunta', 10),
(2, 'Acertou 10 perguntas', 'Especialista iniciante', 50);

-- --------------------------------------------------------

--
-- Estrutura para tabela `erros_cenario`
--

CREATE TABLE `erros_cenario` (
  `id_erro` int(11) NOT NULL,
  `id_cenario` int(11) DEFAULT NULL,
  `pos_x` int(11) DEFAULT NULL,
  `pos_y` int(11) DEFAULT NULL,
  `raio` int(11) DEFAULT 50,
  `explicacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `erros_cenario`
--

INSERT INTO `erros_cenario` (`id_erro`, `id_cenario`, `pos_x`, `pos_y`, `raio`, `explicacao`) VALUES
(1, 4, 900, 520, 150, 'Email phishing: domínio falso e link suspeito pedindo regularização urgente.'),
(2, 5, 420, 260, 150, 'Página falsa de banco pedindo dados de acesso para roubo de credenciais.'),
(3, 6, 780, 420, 150, 'Preço extremamente baixo e link encurtado indicam possível golpe.'),
(4, 7, 550, 420, 150, 'Mensagem SMS com link falso solicitando pagamento de taxa.'),
(5, 8, 140, 80, 120, 'Site marcado como NÃO SEGURO pelo navegador.');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `estatisticas_usuario`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `estatisticas_usuario` (
`nome` varchar(100)
,`total_respostas` bigint(21)
,`total_acertos` decimal(25,0)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `fases`
--

CREATE TABLE `fases` (
  `id_fase` int(11) NOT NULL,
  `nome_fase` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `nivel_minimo` int(11) DEFAULT NULL,
  `xp_recompensa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fases`
--

INSERT INTO `fases` (`id_fase`, `nome_fase`, `descricao`, `nivel_minimo`, `xp_recompensa`) VALUES
(1, 'Fase 1', 'Golpes básicos', 1, 50),
(2, 'Fase 2', 'Phishing e links falsos', 2, 80),
(3, 'Fase 3', 'Golpes avançados', 3, 120);

-- --------------------------------------------------------

--
-- Estrutura para tabela `memoria_cartas`
--

CREATE TABLE `memoria_cartas` (
  `id_carta` int(11) NOT NULL,
  `id_tema` int(11) DEFAULT NULL,
  `conteudo` varchar(255) DEFAULT NULL,
  `id_par` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `memoria_cartas`
--

INSERT INTO `memoria_cartas` (`id_carta`, `id_tema`, `conteudo`, `id_par`) VALUES
(1, 1, 'Phishing', 1),
(2, 1, 'Email falso', 1),
(3, 1, 'Golpe do PIX', 2),
(4, 1, 'Transferência urgente', 2),
(5, 1, 'Boleto falso', 3),
(6, 1, 'Código de barras adulterado', 3),
(7, 1, 'Perfil falso', 4),
(8, 1, 'Golpe em redes sociais', 4),
(9, 1, 'WhatsApp clonado', 5),
(10, 1, 'Código SMS roubado', 5),
(11, 1, 'Senha fraca', 6),
(12, 1, 'Conta invadida', 6),
(13, 1, 'Promoção falsa', 7),
(14, 1, 'Site fraudulento', 7),
(15, 1, 'Engenharia social', 8),
(16, 1, 'Manipulação psicológica', 8),
(17, 1, 'Wi‑Fi público', 9),
(18, 1, 'Roubo de dados', 9),
(19, 1, 'Link suspeito', 10),
(20, 1, 'Site malicioso', 10),
(21, 1, 'Aplicativo falso', 11),
(22, 1, 'Malware', 11),
(23, 1, 'Loja falsa', 12),
(24, 1, 'Compra fraudulenta', 12),
(25, 1, 'Código de verificação', 13),
(26, 1, 'Roubo de conta', 13),
(27, 1, 'Mensagem urgente', 14),
(28, 1, 'Golpe emocional', 14),
(29, 1, 'Antivírus', 15),
(30, 1, 'Proteção contra malware', 15),
(31, 1, 'Senha forte', 16),
(32, 1, 'Segurança da conta', 16),
(33, 1, 'Autenticação 2 fatores', 17),
(34, 1, 'Proteção extra', 17),
(35, 1, 'Denunciar golpe', 18),
(36, 1, 'Proteção coletiva', 18),
(37, 1, 'Educação digital', 19),
(38, 1, 'Prevenção de fraudes', 19),
(39, 1, 'Verificar fonte', 20),
(40, 1, 'Informação confiável', 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `memoria_sessoes`
--

CREATE TABLE `memoria_sessoes` (
  `id_sessao` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `pontuacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `memoria_temas`
--

CREATE TABLE `memoria_temas` (
  `id_tema` int(11) NOT NULL,
  `nome_tema` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `memoria_temas`
--

INSERT INTO `memoria_temas` (`id_tema`, `nome_tema`, `descricao`) VALUES
(1, 'Golpes Digitais', 'Cartas educativas sobre golpes e segurança digital');

-- --------------------------------------------------------

--
-- Estrutura para tabela `memoria_tentativas`
--

CREATE TABLE `memoria_tentativas` (
  `id_tentativa` int(11) NOT NULL,
  `id_sessao` int(11) DEFAULT NULL,
  `carta1` int(11) DEFAULT NULL,
  `carta2` int(11) DEFAULT NULL,
  `acertou` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perguntas`
--

CREATE TABLE `perguntas` (
  `id_pergunta` int(11) NOT NULL,
  `texto_pergunta` text DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_fase` int(11) DEFAULT NULL,
  `nivel_dificuldade` int(11) DEFAULT NULL,
  `xp` int(11) DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perguntas`
--

INSERT INTO `perguntas` (`id_pergunta`, `texto_pergunta`, `id_categoria`, `id_fase`, `nivel_dificuldade`, `xp`) VALUES
(1, 'O que é phishing?', 1, 1, 1, 10),
(2, 'Qual é um sinal comum de email falso?', 1, 1, 1, 10),
(3, 'O que fazer ao receber mensagem pedindo senha do banco?', 1, 1, 1, 10),
(4, 'O que é golpe do PIX?', 1, 1, 1, 10),
(5, 'O que é um boleto falso?', 1, 1, 1, 10),
(6, 'Como verificar se um site é seguro?', 1, 1, 1, 10),
(7, 'O que pode acontecer ao clicar em link malicioso?', 1, 1, 1, 10),
(8, 'O que é engenharia social?', 1, 1, 1, 10),
(9, 'Por que usar senhas fortes?', 1, 1, 1, 10),
(10, 'O que é autenticação em dois fatores?', 1, 1, 1, 10),
(11, 'Wi-Fi público pode ser perigoso por quê?', 1, 1, 1, 10),
(12, 'Promoções com preços muito baixos podem indicar o quê?', 1, 1, 1, 10),
(13, 'Aplicativos fora da loja oficial podem:', 1, 1, 1, 10),
(14, 'O que fazer ao identificar um golpe online?', 1, 1, 1, 10),
(15, 'O que é golpe de clonagem de WhatsApp?', 1, 1, 1, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `progresso_fase`
--

CREATE TABLE `progresso_fase` (
  `id_progresso` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_fase` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_conclusao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `ranking_usuarios`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `ranking_usuarios` (
`nome` varchar(100)
,`xp_total` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `respostas_usuario`
--

CREATE TABLE `respostas_usuario` (
  `id_resposta` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_pergunta` int(11) DEFAULT NULL,
  `id_alternativa` int(11) DEFAULT NULL,
  `acertou` tinyint(1) DEFAULT NULL,
  `tempo_resposta` int(11) DEFAULT NULL,
  `data_resposta` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `xp_total` int(11) DEFAULT 0,
  `nivel` int(11) DEFAULT 1,
  `data_cadastro` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha`, `xp_total`, `nivel`, `data_cadastro`) VALUES
(1, 'Jogador Teste', 'teste@email.com', '123456', 0, 1, '2026-03-14 19:46:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_conquistas`
--

CREATE TABLE `usuario_conquistas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_conquista` int(11) DEFAULT NULL,
  `data_conquista` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `verdadeiro_falso`
--

CREATE TABLE `verdadeiro_falso` (
  `id_pergunta` int(11) NOT NULL,
  `pergunta` text DEFAULT NULL,
  `resposta_correta` tinyint(1) DEFAULT NULL,
  `explicacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `verdadeiro_falso`
--

INSERT INTO `verdadeiro_falso` (`id_pergunta`, `pergunta`, `resposta_correta`, `explicacao`) VALUES
(1, 'Golpistas podem enviar e-mails que imitam bancos ou empresas conhecidas para enganar usuários e roubar dados pessoais.', 1, 'Esse tipo de golpe é chamado de phishing. O criminoso finge ser uma empresa confiável para que a vítima informe dados sensíveis.'),
(2, 'Se um site possui cadeado HTTPS na barra do navegador, isso garante que ele é sempre legítimo e não pode ser um golpe.', 0, 'O HTTPS indica apenas que a conexão é criptografada, mas o site ainda pode ser falso se estiver imitando uma empresa.'),
(3, 'Nunca se deve compartilhar códigos de verificação recebidos por SMS, pois eles podem permitir que alguém acesse sua conta.', 1, 'Esses códigos são usados para autenticação e devem ser mantidos em segredo.'),
(4, 'Golpistas frequentemente criam senso de urgência em mensagens para fazer a vítima agir rapidamente sem verificar a informação.', 1, 'A pressão psicológica é uma técnica comum usada em engenharia social.'),
(5, 'Aplicativos baixados fora das lojas oficiais são sempre seguros se tiverem muitas avaliações positivas.', 0, 'Aplicativos fora de lojas oficiais podem conter malware ou programas maliciosos.'),
(6, 'Perfis falsos em redes sociais podem ser usados para aplicar golpes financeiros ou coletar informações pessoais.', 1, 'Criminosos criam perfis falsos para ganhar confiança e manipular vítimas.'),
(7, 'Usar a mesma senha em vários sites é uma prática segura porque facilita lembrar as senhas.', 0, 'Se um site for invadido, todas as contas com a mesma senha podem ser comprometidas.'),
(8, 'Atualizar aplicativos e sistemas operacionais ajuda a corrigir falhas de segurança.', 1, 'Atualizações frequentemente corrigem vulnerabilidades exploradas por hackers.'),
(9, 'Golpes de falso suporte técnico acontecem quando criminosos fingem ser técnicos de empresas para pedir acesso ao computador.', 1, 'Nesse golpe, o criminoso tenta convencer a vítima a instalar softwares ou revelar informações.'),
(10, 'Redes Wi-Fi públicas são sempre seguras para acessar aplicativos bancários.', 0, 'Em redes públicas, criminosos podem interceptar dados se a conexão não for segura.'),
(11, 'Golpistas podem clonar contas de WhatsApp usando códigos de verificação enviados para o celular da vítima.', 1, 'Se a vítima informar o código, o criminoso pode assumir a conta.'),
(12, 'Um e-mail com muitos erros de ortografia e links estranhos pode indicar tentativa de golpe.', 1, 'Mensagens fraudulentas frequentemente apresentam erros e links suspeitos.'),
(13, 'Sites de compras com preços extremamente baixos sempre indicam promoções legítimas.', 0, 'Preços muito abaixo do mercado podem indicar lojas falsas ou golpes.'),
(14, 'Engenharia social é uma técnica usada por criminosos para manipular pessoas e obter informações confidenciais.', 1, 'Nesse tipo de ataque o criminoso explora emoções e confiança da vítima.'),
(15, 'Antivírus e softwares de segurança ajudam a reduzir o risco de infecção por malware.', 1, 'Eles detectam e bloqueiam programas maliciosos.'),
(16, 'Se um amigo pedir dinheiro por mensagem, não é necessário confirmar porque a conta sempre pertence à pessoa.', 0, 'Golpistas podem invadir contas ou cloná-las para pedir dinheiro.'),
(17, 'Links enviados por desconhecidos em redes sociais podem direcionar para sites maliciosos.', 1, 'Esses sites podem roubar dados ou instalar vírus.'),
(18, 'Um certificado digital HTTPS impede completamente qualquer tipo de fraude online.', 0, 'Mesmo com HTTPS, o site pode ser fraudulento se estiver imitando outro.'),
(19, 'Golpes de investimento prometendo lucros garantidos e muito rápidos são frequentemente usados por criminosos.', 1, 'Promessas de ganhos altos e rápidos são um sinal clássico de fraude.'),
(20, 'Verificar a fonte de uma informação antes de compartilhá-la ajuda a evitar a disseminação de golpes digitais.', 1, 'Checar a veracidade da informação reduz a propagação de fraudes.');

-- --------------------------------------------------------

--
-- Estrutura para view `estatisticas_usuario`
--
DROP TABLE IF EXISTS `estatisticas_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estatisticas_usuario`  AS SELECT `u`.`nome` AS `nome`, count(`r`.`id_resposta`) AS `total_respostas`, sum(`r`.`acertou`) AS `total_acertos` FROM (`usuarios` `u` left join `respostas_usuario` `r` on(`u`.`id_usuario` = `r`.`id_usuario`)) GROUP BY `u`.`nome` ;

-- --------------------------------------------------------

--
-- Estrutura para view `ranking_usuarios`
--
DROP TABLE IF EXISTS `ranking_usuarios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ranking_usuarios`  AS SELECT `usuarios`.`nome` AS `nome`, `usuarios`.`xp_total` AS `xp_total` FROM `usuarios` ORDER BY `usuarios`.`xp_total` DESC ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alternativas`
--
ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`id_alternativa`),
  ADD KEY `id_pergunta` (`id_pergunta`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `cenarios_golpe`
--
ALTER TABLE `cenarios_golpe`
  ADD PRIMARY KEY (`id_cenario`);

--
-- Índices de tabela `conquistas`
--
ALTER TABLE `conquistas`
  ADD PRIMARY KEY (`id_conquista`);

--
-- Índices de tabela `erros_cenario`
--
ALTER TABLE `erros_cenario`
  ADD PRIMARY KEY (`id_erro`),
  ADD KEY `idx_cenario` (`id_cenario`);

--
-- Índices de tabela `fases`
--
ALTER TABLE `fases`
  ADD PRIMARY KEY (`id_fase`);

--
-- Índices de tabela `memoria_cartas`
--
ALTER TABLE `memoria_cartas`
  ADD PRIMARY KEY (`id_carta`),
  ADD KEY `id_tema` (`id_tema`);

--
-- Índices de tabela `memoria_sessoes`
--
ALTER TABLE `memoria_sessoes`
  ADD PRIMARY KEY (`id_sessao`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `memoria_temas`
--
ALTER TABLE `memoria_temas`
  ADD PRIMARY KEY (`id_tema`);

--
-- Índices de tabela `memoria_tentativas`
--
ALTER TABLE `memoria_tentativas`
  ADD PRIMARY KEY (`id_tentativa`),
  ADD KEY `id_sessao` (`id_sessao`);

--
-- Índices de tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD PRIMARY KEY (`id_pergunta`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_fase` (`id_fase`);

--
-- Índices de tabela `progresso_fase`
--
ALTER TABLE `progresso_fase`
  ADD PRIMARY KEY (`id_progresso`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_fase` (`id_fase`);

--
-- Índices de tabela `respostas_usuario`
--
ALTER TABLE `respostas_usuario`
  ADD PRIMARY KEY (`id_resposta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pergunta` (`id_pergunta`),
  ADD KEY `id_alternativa` (`id_alternativa`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `usuario_conquistas`
--
ALTER TABLE `usuario_conquistas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_conquista` (`id_conquista`);

--
-- Índices de tabela `verdadeiro_falso`
--
ALTER TABLE `verdadeiro_falso`
  ADD PRIMARY KEY (`id_pergunta`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alternativas`
--
ALTER TABLE `alternativas`
  MODIFY `id_alternativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1669;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cenarios_golpe`
--
ALTER TABLE `cenarios_golpe`
  MODIFY `id_cenario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `conquistas`
--
ALTER TABLE `conquistas`
  MODIFY `id_conquista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `erros_cenario`
--
ALTER TABLE `erros_cenario`
  MODIFY `id_erro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `fases`
--
ALTER TABLE `fases`
  MODIFY `id_fase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `memoria_cartas`
--
ALTER TABLE `memoria_cartas`
  MODIFY `id_carta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `memoria_sessoes`
--
ALTER TABLE `memoria_sessoes`
  MODIFY `id_sessao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `memoria_temas`
--
ALTER TABLE `memoria_temas`
  MODIFY `id_tema` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `memoria_tentativas`
--
ALTER TABLE `memoria_tentativas`
  MODIFY `id_tentativa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perguntas`
--
ALTER TABLE `perguntas`
  MODIFY `id_pergunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `progresso_fase`
--
ALTER TABLE `progresso_fase`
  MODIFY `id_progresso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `respostas_usuario`
--
ALTER TABLE `respostas_usuario`
  MODIFY `id_resposta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario_conquistas`
--
ALTER TABLE `usuario_conquistas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `verdadeiro_falso`
--
ALTER TABLE `verdadeiro_falso`
  MODIFY `id_pergunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alternativas`
--
ALTER TABLE `alternativas`
  ADD CONSTRAINT `alternativas_ibfk_1` FOREIGN KEY (`id_pergunta`) REFERENCES `perguntas` (`id_pergunta`);

--
-- Restrições para tabelas `memoria_cartas`
--
ALTER TABLE `memoria_cartas`
  ADD CONSTRAINT `memoria_cartas_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `memoria_temas` (`id_tema`);

--
-- Restrições para tabelas `memoria_sessoes`
--
ALTER TABLE `memoria_sessoes`
  ADD CONSTRAINT `memoria_sessoes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `memoria_tentativas`
--
ALTER TABLE `memoria_tentativas`
  ADD CONSTRAINT `memoria_tentativas_ibfk_1` FOREIGN KEY (`id_sessao`) REFERENCES `memoria_sessoes` (`id_sessao`);

--
-- Restrições para tabelas `perguntas`
--
ALTER TABLE `perguntas`
  ADD CONSTRAINT `perguntas_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `perguntas_ibfk_2` FOREIGN KEY (`id_fase`) REFERENCES `fases` (`id_fase`);

--
-- Restrições para tabelas `progresso_fase`
--
ALTER TABLE `progresso_fase`
  ADD CONSTRAINT `progresso_fase_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `progresso_fase_ibfk_2` FOREIGN KEY (`id_fase`) REFERENCES `fases` (`id_fase`);

--
-- Restrições para tabelas `respostas_usuario`
--
ALTER TABLE `respostas_usuario`
  ADD CONSTRAINT `respostas_usuario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `respostas_usuario_ibfk_2` FOREIGN KEY (`id_pergunta`) REFERENCES `perguntas` (`id_pergunta`),
  ADD CONSTRAINT `respostas_usuario_ibfk_3` FOREIGN KEY (`id_alternativa`) REFERENCES `alternativas` (`id_alternativa`);

--
-- Restrições para tabelas `usuario_conquistas`
--
ALTER TABLE `usuario_conquistas`
  ADD CONSTRAINT `usuario_conquistas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuario_conquistas_ibfk_2` FOREIGN KEY (`id_conquista`) REFERENCES `conquistas` (`id_conquista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
