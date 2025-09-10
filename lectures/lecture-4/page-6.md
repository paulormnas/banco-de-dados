---
layout: default
transition: slide-up
class: text-justify
---

# DISTINCT

<div>
DISTINCT é usado para pegar apenas valores diferentes para uma mesma coluna. 
<br><br>
</div>

```sql
SELECT AVG(nota) AS nota_media, data_avaliacao FROM notas GROUP BY data_avaliacao HAVING nota_media >= 7;
```