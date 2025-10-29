---
layout: default
transition: slide-up
---
# DROP

<div>
  
</div>


```sql
-- ⚠️ ATENÇÃO: Ordem importa com Foreign Keys!
-- Correto:
DROP TABLE notas;          -- Primeiro as tabelas dependentes
DROP TABLE disciplinas;
DROP TABLE estudantes;
DROP TABLE professores;    -- Por último as tabelas referenciadas

-- Alternativa: desabilitar verificação de FK temporariamente
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE professores;
SET FOREIGN_KEY_CHECKS = 1;
```
<br>

### DROP vs DELETE vs TRUNCATE: 
<br>

1. DROP remove estrutura 
2. DELETE remove dados (mantém estrutura)
3. TRUNCATE limpa dados rapidamente