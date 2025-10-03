---
layout: default
transition: slide-up
---

<div>
    Neste último exemplo vamos juntar todas as cláusulas aprendidas nesta aula para obter um resultado mais estruturado e que traga uma informação mais completa.
</div>

```sql
SELECT
    e.nome AS Estudante,
    d.nome AS Disciplina,
    n.nota AS Nota,
    CASE
        WHEN n.nota >= 7.0 THEN 'Aprovado'
        ELSE 'Reprovado'
    END AS Status_Aprovacao
FROM
    estudantes AS e
JOIN
    notas AS n ON e.id = n.estudante_id
JOIN
    disciplinas AS d ON n.disciplina_id = d.id
ORDER BY
    e.nome, d.nome;
```

Aqui usamos o JOIN para buscar informações de 3 tabelas e o CASE para criar uma nova coluna com um resutlado consolidade que ajuda a enteder a situação de cada aluno em cada disciplina.