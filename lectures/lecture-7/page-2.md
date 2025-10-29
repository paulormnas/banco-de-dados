---
layout: default
transition: slide-up
---

# INSERT

<div>
Quando precisamos adicionar novos registros ao banco de dados utilizamos o INSERT. Temos que seguir a estrutura abaixo indicando o nome da tabela, as colunas que receberão novos registros e os valores a serem inseridos
</div>


```sql
-- Sintaxe básica
INSERT INTO nome_tabela (coluna1, coluna2, ...) 
VALUES (valor1, valor2, ...);

-- Inserção única
INSERT INTO professores (nome, email, data_contratacao, salario) 
VALUES ('Prof. Carlos', 'carlos.p@exemplo.com', '2020-08-15', 7500.00);

-- Inserção múltipla
INSERT INTO estudantes (nome, email, curso, data_matricula, ativo) 
VALUES
    ('Ana Silva', 'ana@exemplo.com', 'Informática', '2024-02-01', TRUE),
    ('João Santos', 'joao@exemplo.com', 'Informática', '2024-02-01', TRUE),
    ('Maria Oliveira', 'maria@exemplo.com', 'Administração', '2024-02-15', TRUE);

-- Inserindo com relacionamento (Foreign Key)
INSERT INTO notas (estudante_id, disciplina_id, nota, data_avaliacao) 
VALUES (1, 1, 8.5, '2024-03-15');
```