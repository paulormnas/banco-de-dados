---
layout: default
transition: slide-up
---

# GROUP BY

<div>
Uma vez que fizemos as agregações, podemos agora organizar os resultados das queries pro grupos para melhorar a vizualização dos resultados utilizando GROUP BY. Por exmeplo: <br><br>
</div>



```sql
select COUNT(*) as alunos_inscritos, curso from estudantes where ativo = TRUE group by curso;
```

| alunos_inscritos   |  curso  |
| --------  | -------- |
| 3 | Informática  |
| 2 | Administração  |
| 2 | Redes  |
