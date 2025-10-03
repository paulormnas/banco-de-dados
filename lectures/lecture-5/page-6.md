---
layout: iframe-right
url: ./html-pages/right-join.htm
transition: slide-up
---

<div>
    <p>O <span class="highlight">RIGHT JOIN</span> retorna <strong>TODOS os registros da Tabela B (direita)</strong>, independentemente de haver correspondência na Tabela A.</p>
    <p>Quando há correspondência na Tabela A, os dados são incluídos. Quando não há, os campos da Tabela A aparecem como <strong>NULL</strong>.</p>
</div>

```sql
SELECT * 
FROM 
    estudantes AS A
RIGHT JOIN 
    notas AS B ON A.id = B.estudante_id;
```