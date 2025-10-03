---
layout: default
transition: slide-up
---

# JOIN

<div>
Vamos agora organizar um pouco melhor as colunas para ter um resultado mais interessante associando as informações das duas tabelas.
</div>

```sql
SELECT 
	A.nome AS Nome,
    B.nota AS Nota
FROM 
    estudantes AS A
JOIN 
    notas AS B ON A.id = B.estudante_id;
```

Agora temos apenas duas colunas, uma com o nome do(a) aluno(a) e sua respectiva nota. Porém, agora parece que temos informação de menos pois não conseguimos identificar a qual discipliona pertence aquela nota. Para resolver este problema podemos fazer mais um JOIN com outra tabela e assim associar as informações das tabelas `estudantes`, `notas` e `disciplinas`.

A seguir vamos ver os tipos de JOIN mais utilizados.




