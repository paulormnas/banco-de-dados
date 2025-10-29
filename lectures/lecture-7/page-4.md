---
layout: default
transition: slide-up
---

# DELETE

<div>
Quando precisamos remover um ou mais registros de uma tabela do banco de dados utilizamos a cláusula DELETE.
</div>


```sql
-- Sintaxe básica
DELETE FROM nome_tabela 
WHERE condição;

-- Deletar um estudante específico
DELETE FROM estudantes 
WHERE id = 10;

-- Deletar por condição
DELETE FROM notas 
WHERE nota < 5.0;
```