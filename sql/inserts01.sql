USE db_Agencia_Empregos;

-- ==========================================
-- 1. INSERINDO AS EMPRESAS (Tabela: usuarios)
-- ==========================================
-- Nota: O hash de senha abaixo corresponde à senha literal '123456'
INSERT INTO tbl_Usuarios (usuario_id, nome, email, senha, tipo_perfil) VALUES
(1, 'Tech Solutions Ltda', 'contato@techsolutions.com', '$2y$10$wVb786MvE.BfU7ZcL7S2A.bEwX4C6Qz1hKx7tZ6hI7W8n5Zg5xW2e', 'empresa'),
(2, 'Inova Apps', 'rh@inovaapps.com', '$2y$10$wVb786MvE.BfU7ZcL7S2A.bEwX4C6Qz1hKx7tZ6hI7W8n5Zg5xW2e', 'empresa');


-- ==========================================
-- 2. INSERINDO AS VAGAS (Tabela: vagas)
-- ==========================================
-- Observe o campo 'usuario_id': ele vincula a vaga diretamente ao ID da empresa acima.
INSERT INTO tbl_Vagas (usuario_id, titulo, descricao, requisitos, salario, localizacao, status) VALUES
(1, 'Desenvolvedor Back-End Junior', 'Procuramos programador focado em PHP e MySQL para trabalhar em nossa equipe interna. Você atuará na criação e manutenção de APIs e sistemas web corporativos.', 'Conhecimento em PHP, manipulação de banco de dados SQL e versionamento com Git.', 3500.00, 'São Paulo - SP (Híbrido)', 'ativa'),

(2, 'Estágio em Desenvolvimento Web', 'Oportunidade para estudantes de tecnologia que desejam ingressar no mercado. Você aprenderá a integrar layouts HTML5/CSS3 com regras de negócio em back-end.', 'Cursando Técnico ou Superior em Desenvolvimento de Sistemas, TI ou áreas correlatas.', 1500.00, 'Remoto', 'ativa'),

(1, 'Programador Full Stack PHP / Vue', 'Vaga para desenvolvedor atuar na sustentação e evolução de plataformas SaaS. O profissional lidará tanto com a arquitetura de dados quanto com interfaces responsivas.', 'Experiência com PHP moderno, JavaScript (Vue ou React) e queries complexas em MySQL.', 5800.00, 'Curitiba - PR (Presencial)', 'ativa'),

(2, 'Analista de Banco de Dados Junior', 'Apoiará a equipe de desenvolvimento na modelagem de tabelas, criação de views, otimização de consultas e rotinas de backup do nosso ecossistema MySQL.', 'Domínio de comandos DDL/DML, entendimento de relacionamentos (1:N, N:M) e JOINS.', 4200.00, 'Remoto', 'ativa');


/*
	vagas 1 e 3. Mostre que ambas possuem o usuario_id = 1.
    O relacionamento de 1 para N na prática funciona. 
    A empresa cujo id é 1 é dona de duas vagas diferentes ao mesmo tempo, enquanto cada vaga aponta para apenas um dono.
*/