---
layout: default
transition: slide-up
---
# DROP

<div>
  A cláusula DROP remove permanentemente tabelas, schemas ou bancos de dados. ⚠️ Esta operação é irreversível!
</div>

```sql
-- Remover tabela
DROP TABLE nome_tabela;

-- Remover tabela se existir (evita erro)
DROP TABLE IF EXISTS notas;

-- Remover schema/banco de dados
DROP SCHEMA IF EXISTS escola_avancada;
DROP DATABASE IF EXISTS escola_avancada;
```