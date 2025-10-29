---
layout: two-cols
transition: slide-up
---

# UPDATE

<div class="text-justify mr-8">
A cláusula UPDATE é utilizada para modificar um registro que já foi inserido anteriormente. Um ponto importante aqui é sempre utilizar o WHERE em conjunto com UPDATE, para evitar alterar todos os registros de uma tabela. Vamos ver os exemplos a lado:
</div>


::right::

```
-- Sintaxe básica
UPDATE nome_tabela 
SET coluna1 = valor1, coluna2 = valor2, ...
WHERE condição;

-- Atualizar salário de um professor específico
UPDATE professores 
SET salario = 8000.00 
WHERE id = 1;

-- Atualizar múltiplas colunas
UPDATE professores 
SET salario = salario * 1.10,
    email = 'carlos.novo@exemplo.com'
WHERE nome = 'Prof. Carlos';

-- Desativar estudante
UPDATE estudantes 
SET ativo = FALSE 
WHERE id = 4;

-- ⚠️ SEM WHERE atualiza TODOS os registros!
UPDATE estudantes SET ativo = TRUE;  -- CUIDADO!
```