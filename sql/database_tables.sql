CREATE DATABASE IF NOT EXISTS db_Agencia_Empregos;
USE db_Agencia_Empregos;

-- 1. Tabela de Usuários (Centraliza Login)
CREATE TABLE tbl_Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    tipo_perfil ENUM('candidato', 'empresa') NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Tabela de Currículos (Relacionamento 1:1 com Usuários)
CREATE TABLE tbl_Curriculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL UNIQUE, -- UNIQUE garante o relacionamento 1:1
    resumo_profissional TEXT,
    experiencia TEXT,
    escolaridade VARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES tbl_Usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Tabela de Vagas (Relacionamento 1:N com Usuários/Empresas)
CREATE TABLE tbl_Vagas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL, -- ID da Empresa que criou a vaga
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT NOT NULL,
    requisitos TEXT,
    salario DECIMAL(10, 2) NULL, -- NULL caso a empresa queira "A combinar"
    localizacao VARCHAR(100),
    status ENUM('ativa', 'inativa') DEFAULT 'ativa',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES tbl_Usuarios(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Tabela Intermediária de Candidaturas (Relacionamento N:N)
CREATE TABLE tbl_Candidaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vaga_id INT NOT NULL,
    usuario_id INT NOT NULL, -- ID do Candidato
    data_candidatura TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vaga_id) REFERENCES tbl_Vagas(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES tbl_Usuarios(id) ON DELETE CASCADE,
    -- Restrição para impedir que o mesmo candidato se inscreva duas vezes na mesma vaga:
    UNIQUE KEY candidato_vaga_unica (usuario_id, vaga_id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;