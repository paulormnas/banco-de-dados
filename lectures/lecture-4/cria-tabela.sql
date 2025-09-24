-- CREATE SCHEMA escola;

-- Script de criação de tabelas para o banco escola
USE escola;

-- Tabela de estudantes
CREATE TABLE IF NOT EXISTS estudantes (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	curso VARCHAR(50) NOT NULL,
	data_matricula DATE NOT NULL,
	ativo BOOLEAN DEFAULT TRUE
);

-- Tabela de disciplinas
CREATE TABLE IF NOT EXISTS disciplinas (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	codigo VARCHAR(20) UNIQUE NOT NULL,
	carga_horaria INT NOT NULL,
	professor VARCHAR(100)
);

-- Tabela de notas
CREATE TABLE IF NOT EXISTS notas (
	id INT AUTO_INCREMENT PRIMARY KEY,
	estudante_id INT,
	disciplina_id INT,
	nota DECIMAL(5,2),
	data_avaliacao DATE,
	FOREIGN KEY (estudante_id) REFERENCES estudantes(id),
	FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);

-- Inserindo dados de exemplo em estudantes
INSERT INTO estudantes (nome, email, curso, data_matricula, ativo) VALUES
('Ana Silva', 'ana@exemplo.com', 'Informática', '2024-02-01', TRUE),
('João Santos', 'joao@exemplo.com', 'Informática', '2024-02-01', TRUE),
('Maria Oliveira', 'maria@exemplo.com', 'Administração', '2024-02-15', TRUE),
('Carlos Mendes', 'carlos@exemplo.com', 'Administração', '2024-03-01', FALSE),
('Fernanda Costa', 'fernanda@exemplo.com', 'Redes', '2024-03-10', TRUE),
('Lucas Rocha', 'lucas@exemplo.com', 'Informática', '2024-04-01', TRUE),
('Juliana Souza', 'juliana@exemplo.com', 'Redes', '2024-04-05', FALSE);

-- Inserindo dados em disciplinas
INSERT INTO disciplinas (nome, codigo, carga_horaria, professor) VALUES
('Programação Web', 'PROG001', 80, 'Prof. Carlos'),
('Banco de Dados', 'BD001', 60, 'Prof. Ana'),
('Sistemas Operacionais', 'SO001', 70, 'Prof. Roberto'),
('Redes de Computadores', 'RED001', 60, 'Prof. Fernanda'),
('Empreendedorismo', 'ADM001', 40, 'Prof. Paula');

-- Inserindo dados em notas
INSERT INTO notas (estudante_id, disciplina_id, nota, data_avaliacao) VALUES
-- Ana Silva
(1, 1, 8.5, '2024-03-15'),
(1, 2, 9.0, '2024-03-20'),
(1, 3, 7.5, '2024-04-10'),

-- João Santos
(2, 1, 7.5, '2024-03-15'),
(2, 2, 8.0, '2024-03-20'),
(2, 3, 6.5, '2024-04-12'),

-- Maria Oliveira
(3, 3, 8.0, '2024-03-25'),
(3, 5, 9.5, '2024-04-01'),

-- Carlos Mendes (inativo)
(4, 5, 6.0, '2024-04-10'),

-- Fernanda Costa
(5, 1, 9.2, '2024-04-15'),
(5, 4, 8.8, '2024-04-20'),

-- Lucas Rocha
(6, 1, 6.5, '2024-04-18'),
(6, 2, 7.0, '2024-04-25'),
(6, 4, 7.5, '2024-05-02'),

-- Juliana Souza (inativa)
(7, 4, 8.0, '2024-05-05'),
(7, 2, 7.8, '2024-05-10');

-- Verificar dados inseridos
SELECT 'Dados inseridos com sucesso!' as status;
