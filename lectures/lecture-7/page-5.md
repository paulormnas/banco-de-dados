---
layout: default
transition: slide-up
---

# DELETE

<div>
 
</div>


```sql
-- Deletar estudantes inativos sem notas
DELETE FROM estudantes 
WHERE ativo = FALSE 
AND id NOT IN (SELECT DISTINCT estudante_id FROM notas);

-- ⚠️ SEM WHERE apaga TODOS os registros!
DELETE FROM estudantes;  -- CUIDADO!

-- TRUNCATE: alternativa mais rápida para limpar tabela
TRUNCATE TABLE notas;  -- Remove todos os dados e reseta AUTO_INCREMENT
```