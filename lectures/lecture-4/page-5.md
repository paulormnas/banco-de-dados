---
layout: default
transition: slide-up
---

# HAVING

<div>
Quando precisamos filtrar resultados por gerados por uma função agregada, não podemos usar o termo WHERE, pois isso gera erro de execução da query. Nestes caso precisamos usar o HAVING para criar novos filtros. Isto acontece porque o filtro com WHERE é executado antes das funções de agregação, dessa forma o resultado da agregação não existe durante a execução do WHERE. A seguir vemos um exemplo de uso do HAVING.
<br><br>
</div>

```sql
SELECT AVG(nota) AS nota_media, data_avaliacao FROM notas GROUP BY data_avaliacao HAVING nota_media >= 7;
```