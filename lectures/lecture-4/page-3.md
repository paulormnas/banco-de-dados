---
layout: default
transition: slide-up
class: text-justify
---

# GROUP BY

<div>
Ainda podemos combinar GROUP BY com filtros WHERE para aprimorar a query.
<br><br>
</div>


```sql
SELECT COUNT(*) AS alunos_inscritos, curso FROM estudantes WHERE ativo = TRUE GROUP BY curso;
```

| alunos_inscritos   |  curso  |
| --------  | -------- |
| 3 | Informática  |
| 1 | Administração  |
| 1 | Redes  |