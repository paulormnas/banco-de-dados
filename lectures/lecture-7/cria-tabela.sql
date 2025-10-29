-- Criando um novo schema para a versão expandida
DROP SCHEMA IF EXISTS escola_avancada;
CREATE SCHEMA escola_avancada;
USE escola_avancada;

-- Tabela de professores (Nova)
CREATE TABLE IF NOT EXISTS professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10, 2)
);

-- Tabela de estudantes
CREATE TABLE IF NOT EXISTS estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    curso VARCHAR(50) NOT NULL,
    data_matricula DATE NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

-- Tabela de disciplinas (Atualizada com FOREIGN KEY para professores)
CREATE TABLE IF NOT EXISTS disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    carga_horaria INT NOT NULL,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professores(id)
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

-- Inserindo dados de exemplo em professores
INSERT INTO professores (nome, email, data_contratacao, salario) VALUES
('Prof. Carlos', 'carlos.p@exemplo.com', '2020-08-15', 7500.00),
('Prof. Ana', 'ana.p@exemplo.com', '2019-03-10', 8200.00),
('Prof. Roberto', 'roberto.p@exemplo.com', '2021-05-20', 6800.00),
('Prof. Fernanda', 'fernanda.p@exemplo.com', '2022-01-05', 7100.00),
('Prof. Paula', 'paula.p@exemplo.com', '2023-02-28', 6500.00),
('Prof. Ricardo', 'ricardo.p@exemplo.com', '2018-11-11', 9500.00);

-- Inserindo dados de exemplo em estudantes
-- IMPORTANTE: Alguns estudantes NÃO terão notas para demonstrar LEFT JOIN
INSERT INTO estudantes (nome, email, curso, data_matricula, ativo) VALUES
('Ana Silva', 'ana@exemplo.com', 'Informática', '2024-02-01', TRUE),
('João Santos', 'joao@exemplo.com', 'Informática', '2024-02-01', TRUE),
('Maria Oliveira', 'maria@exemplo.com', 'Administração', '2024-02-15', TRUE),
('Carlos Mendes', 'carlos@exemplo.com', 'Administração', '2024-03-01', FALSE),
('Fernanda Costa', 'fernanda@exemplo.com', 'Redes', '2024-03-10', TRUE),
('Lucas Rocha', 'lucas@exemplo.com', 'Informática', '2024-04-01', TRUE),
('Juliana Souza', 'juliana@exemplo.com', 'Redes', '2024-04-05', FALSE),
('Pedro Lima', 'pedro@exemplo.com', 'Informática', '2024-05-15', TRUE),
('Mariana Ferreira', 'mariana@exemplo.com', 'Administração', '2024-06-20', TRUE),
('Roberto Alves', 'roberto@exemplo.com', 'Informática', '2024-07-01', TRUE),  -- SEM NOTAS
('Patricia Gomes', 'patricia@exemplo.com', 'Redes', '2024-07-10', TRUE);      -- SEM NOTAS

-- Inserindo dados em disciplinas (atualizado com professor_id)
-- IMPORTANTE: Algumas disciplinas NÃO terão notas lançadas para demonstrar RIGHT JOIN
INSERT INTO disciplinas (nome, codigo, carga_horaria, professor_id) VALUES
('Programação Web', 'PROG001', 80, 1),      -- Prof. Carlos
('Banco de Dados', 'BD001', 60, 2),          -- Prof. Ana
('Sistemas Operacionais', 'SO001', 70, 3),   -- Prof. Roberto
('Redes de Computadores', 'RED001', 60, 4),  -- Prof. Fernanda
('Empreendedorismo', 'ADM001', 40, 5),       -- Prof. Paula
('Engenharia de Software', 'ES001', 90, 6),  -- Prof. Ricardo
('Inteligência Artificial', 'IA001', 80, 1), -- SEM NOTAS LANÇADAS
('Segurança da Informação', 'SEG001', 50, 4); -- SEM NOTAS LANÇADAS

-- Inserindo notas (propositalmente deixando alguns estudantes e disciplinas sem notas)
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

-- Carlos Mendes (inativo) - TEM NOTAS
(4, 5, 6.0, '2024-04-10'),

-- Fernanda Costa
(5, 1, 9.2, '2024-04-15'),
(5, 4, 8.8, '2024-04-20'),

-- Lucas Rocha
(6, 1, 6.5, '2024-04-18'),
(6, 2, 7.0, '2024-04-25'),
(6, 4, 7.5, '2024-05-02'),

-- Juliana Souza (inativa) - TEM NOTAS
(7, 4, 8.0, '2024-05-05'),
(7, 2, 7.8, '2024-05-10'),

-- Pedro Lima
(8, 1, 7.0, '2024-05-18'),
(8, 2, 6.5, '2024-05-25'),
(8, 6, 8.0, '2024-06-01'),

-- Mariana Ferreira
(9, 5, 8.5, '2024-07-01'),
(9, 3, 7.8, '2024-07-05');

-- NOTA: Roberto Alves (id=10) e Patricia Gomes (id=11) NÃO têm notas
-- NOTA: Disciplinas 'Inteligência Artificial' (id=7) e 'Segurança da Informação' (id=8) NÃO têm notas

-- Verificar dados inseridos
SELECT 'Dados e tabelas expandidas inseridos com sucesso!' as status;


-- ============================================================================
-- EXEMPLO DE CASE: Categorizar professores com base no salário
-- ============================================================================
SELECT
    nome AS Nome_Professor,
    salario AS Salario,
    -- A Cláusula CASE avalia o valor do salário para definir uma Categoria Salarial
    CASE
        WHEN salario >= 9000.00 THEN 'Sênior (Salário Alto)'
        WHEN salario >= 7000.00 THEN 'Pleno (Salário Médio)'
        ELSE 'Júnior (Salário Inicial)'
    END AS Categoria_Salarial
FROM
    professores
ORDER BY
    salario DESC;


-- ============================================================================
-- EXEMPLO DE JOIN: Retornando dados de ambas tabelas
-- ============================================================================
-- Cria alias para as tabelas estudantes e notas e retorna todas as colunas
--  de ambas as tabelas
SELECT * 
FROM 
    estudantes AS A
JOIN 
    notas AS B ON A.id = B.estudante_id;


-- ============================================================================
-- EXEMPLO DE JOIN REFINADO: Retornando menos dados de ambas tabelas
-- ============================================================================
-- Cria alias para as tabelas estudantes e notas e retorna todas as colunas
--  de ambas as tabelas
SELECT 
	A.nome AS Nome_do_Aluno,
    B.nota AS Nota
FROM 
    estudantes AS A
JOIN 
    notas AS B ON A.id = B.estudante_id;


-- ============================================================================
-- EXEMPLO DE LEFT JOIN
-- ============================================================================
-- Retorna todos os dados da tabela estudante e apenas os registros da tabela 
-- notas que possue um vínculo com a tabela estudnates. Aqui é possivel observar 
-- que as últimas linhas possuem valores null, pois não existem notas para aqueles 
-- alunos
SELECT * 
FROM 
    estudantes AS A
LEFT JOIN 
    notas AS B ON A.id = B.estudante_id;


-- ============================================================================
-- EXEMPLO DE RIGHT JOIN
-- ============================================================================
-- Retorna todos os dados da tabela notas e apenas os registros da tabela 
-- estudantes que possue um vínculo com a tabela notas. Neste caso, os alunos 
-- Roberto Alves e Patricia Gomes não aparecem nos resultados, pois novamente
-- não há uma associação de notas com esses alunos.
SELECT * 
FROM 
    estudantes AS A
RIGHT JOIN 
    notas AS B ON A.id = B.estudante_id;
    
    
-- ============================================================================
-- EXEMPLO DE CASE: Classificar notas como 'Aprovado' ou 'Reprovado'
-- ============================================================================
-- Considera nota de corte 7.0
-- A coluna 'Status_Aprovacao' é criada dinamicamente pela query.
SELECT
    e.nome AS Estudante,
    d.nome AS Disciplina,
    n.nota AS Nota,
    CASE
        WHEN n.nota >= 7.0 THEN 'Aprovado'
        ELSE 'Reprovado'
    END AS Status_Aprovacao
FROM
    estudantes AS e
JOIN
    notas AS n ON e.id = n.estudante_id
JOIN
    disciplinas AS d ON n.disciplina_id = d.id
ORDER BY
    e.nome, d.nome;
    

-- ============================================================================
-- EXEMPLO DE INNER JOIN: Retorna APENAS estudantes que TÊM notas
-- ============================================================================
-- Este é o JOIN mais comum. Ele só retorna linhas onde há correspondência 
-- em AMBAS as tabelas (estudantes E notas).
-- OBSERVE: Roberto Alves e Patricia Gomes NÃO aparecerão neste resultado.
SELECT
    e.nome AS Nome_Estudante,
    d.nome AS Nome_Disciplina,
    n.nota AS Nota_Final
FROM
    estudantes AS e
INNER JOIN
    notas AS n ON e.id = n.estudante_id
INNER JOIN
    disciplinas AS d ON n.disciplina_id = d.id
ORDER BY
    e.nome, d.nome;
    
    
-- ============================================================================
-- EXEMPLO DE LEFT JOIN: Retorna TODOS os estudantes, mesmo sem notas
-- ============================================================================
-- O LEFT JOIN retorna TODOS os registros da tabela da ESQUERDA (estudantes),
-- independentemente de haver correspondência na tabela da DIREITA (notas).
-- OBSERVE: Roberto Alves e Patricia Gomes aparecerão com nota = NULL
SELECT
    e.nome AS Nome_Estudante,
    e.curso AS Curso,
    d.nome AS Nome_Disciplina,
    n.nota AS Nota_Final,
    -- Usando CASE para identificar estudantes sem notas
    CASE
        WHEN n.nota IS NULL THEN 'Sem avaliação'
        WHEN n.nota >= 7.0 THEN 'Aprovado'
        ELSE 'Reprovado'
    END AS Status
FROM
    estudantes AS e
LEFT JOIN
    notas AS n ON e.id = n.estudante_id
LEFT JOIN
    disciplinas AS d ON n.disciplina_id = d.id
ORDER BY
    e.nome, d.nome;


-- ============================================================================
-- EXEMPLO DE RIGHT JOIN: Retorna TODAS as disciplinas, mesmo sem notas
-- ============================================================================
-- O RIGHT JOIN retorna TODOS os registros da tabela da DIREITA (disciplinas),
-- independentemente de haver correspondência na tabela da ESQUERDA (notas).
-- OBSERVE: 'Inteligência Artificial' e 'Segurança da Informação' aparecerão 
-- com estudante = NULL e nota = NULL
SELECT
    d.nome AS Nome_Disciplina,
    d.codigo AS Codigo_Disciplina,
    p.nome AS Professor,
    e.nome AS Nome_Estudante,
    n.nota AS Nota_Final,
    -- Usando CASE para identificar disciplinas sem alunos matriculados
    CASE
        WHEN n.nota IS NULL THEN 'Disciplina sem avaliações lançadas'
        WHEN n.nota >= 7.0 THEN 'Aluno aprovado'
        ELSE 'Aluno reprovado'
    END AS Status_Disciplina
FROM
    notas AS n
RIGHT JOIN
    disciplinas AS d ON n.disciplina_id = d.id
LEFT JOIN
    estudantes AS e ON n.estudante_id = e.id
LEFT JOIN
    professores AS p ON d.professor_id = p.id
ORDER BY
    d.nome, e.nome;


-- ============================================================================
-- EXEMPLO COMPARATIVO: Contando registros em cada tipo de JOIN
-- ============================================================================
-- Esta query ajuda a visualizar a diferença entre os tipos de JOIN

-- INNER JOIN: apenas estudantes COM notas
SELECT 'INNER JOIN' AS Tipo_Join, COUNT(DISTINCT e.id) AS Total_Estudantes
FROM estudantes AS e
INNER JOIN notas AS n ON e.id = n.estudante_id

UNION ALL

-- LEFT JOIN: TODOS os estudantes (com ou sem notas)
SELECT 'LEFT JOIN' AS Tipo_Join, COUNT(DISTINCT e.id) AS Total_Estudantes
FROM estudantes AS e
LEFT JOIN notas AS n ON e.id = n.estudante_id

UNION ALL

-- Total de estudantes cadastrados
SELECT 'TOTAL CADASTRADO' AS Tipo_Join, COUNT(id) AS Total_Estudantes
FROM estudantes;


-- ============================================================================
-- EXEMPLO PRÁTICO: Identificar estudantes que AINDA NÃO fizeram avaliações
-- ============================================================================
-- Usando LEFT JOIN para encontrar estudantes sem notas (WHERE nota IS NULL)
SELECT
    e.nome AS Estudante_Sem_Notas,
    e.curso AS Curso,
    e.data_matricula AS Data_Matricula,
    DATEDIFF(CURDATE(), e.data_matricula) AS Dias_Desde_Matricula
FROM
    estudantes AS e
LEFT JOIN
    notas AS n ON e.id = n.estudante_id
WHERE
    n.nota IS NULL
ORDER BY
    e.data_matricula DESC;