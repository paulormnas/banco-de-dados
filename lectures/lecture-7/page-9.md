---
layout: default
transition: slide-up
---
# VIEW

<div>
  
</div>

```sql
-- Usando a view
SELECT * FROM vw_medias_estudantes WHERE status = 'Aprovado';

-- Atualizar view
CREATE OR REPLACE VIEW vw_medias_estudantes AS ...;

-- Remover view
DROP VIEW IF EXISTS vw_medias_estudantes;
```
