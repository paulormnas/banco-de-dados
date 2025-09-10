---
layout: default
transition: slide-up
class: text-justify
---

# ORDER BY

<div>
O termo ORDER BY ajuda a organizar os resultados de um query ordenando os resultados em ordem crescente ou decrescente de acordo com uma coluna específica.
<br>
</div>

```sql
SELECT * FROM estudantes ORDER BY curso;

SELECT * FROM notas ORDER BY nota;

SELECT * FROM notas ORDER BY disciplina_id, nota;

SELECT AVG(nota) AS nota_media, data_avaliacao FROM notas GROUP BY data_avaliacao ORDER BY data_avaliacao DESC;
```
