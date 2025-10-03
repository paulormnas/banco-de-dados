---
layout: iframe-right
url: ./html-pages/inner-join.htm
transition: slide-up
---

<div>
    <p>O <span class="highlight">INNER JOIN</span>, ou apenas JOIN, retorna somente os registros que possuem <strong>correspondência em AMBAS as tabelas</strong>.</p>
    <p>Se um registro existe apenas na Tabela A ou apenas na Tabela B, ele <strong>não será incluído</strong> no resultado.</p>
</div>

```sql
SELECT * 
FROM 
    estudantes AS A
JOIN 
    notas AS B ON A.id = B.estudante_id;
```