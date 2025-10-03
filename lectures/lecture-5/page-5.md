---
layout: iframe-right
url: ./html-pages/left-join.htm
transition: slide-up
---

<div>
    <p>O <span class="highlight">LEFT JOIN</span> retorna <strong>TODOS os registros da Tabela A (esquerda)</strong>, independentemente de haver correspondência na Tabela B.</p>
    <p>Quando há correspondência na Tabela B, os dados são incluídos. Quando não há, os campos da Tabela B aparecem como <strong>NULL</strong>.</p>
</div>

```sql
SELECT * 
FROM 
    estudantes AS A
LEFT JOIN 
    notas AS B ON A.id = B.estudante_id;
```