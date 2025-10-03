---
layout: default
transition: slide-up
---

# JOIN

<div>
Agora devemos indicar ao banco quais colunas queremos comparar para associar informações nas duas tabelas.
</div>

Lembre que cada estudante possuem um identificador único na nossa tabela de `estudantes` localizado na coluna `id`. Esse mesmo valor está presente na tabela `notas`, identificado pela coluna `estudante_id`. Desta forma, podemos utilizar essa informação para localizar as notas pertecentes a cada estudante na tabela de notas utilizando o JOIN.

```sql
SELECT * 
FROM 
    estudantes AS A
JOIN 
    notas AS B ON A.id = B.estudante_id;
```

Tendo em vista que estamos fazendo um JOIN, ou seja, juntando as informações das duas tabelas, o resultado dessa querie são todas as colunas de ambas as tabelas (pois estamos utilizando o `*`), mas associando cada aluno com suas respectivas notas.

Este exemplo fica um tanto poluído porque apresenta muitas colunas, porém ajuda a identificar que os campos `id` e `estudante_id` são igauis.

A seguir vamos ver os tipos de JOIN mais utilizados.




