---
layout: default
transition: slide-up
---

# JOIN

<div>
Em alguns casos precisamos unir os dados de uma ou mais tabelas para facilitar buscar e relacionar as informações. Para que possamos relacionar os dados de ambas as tabelas é necessário que exista uma coluna com dados comuns entre ambas as tabelas. <br><br>
</div>

Aqui vamos considerar a tabelas `estudantes` dos nossos exemplos como sendo a tabela `A`. A tabela `notas` será a tabela `B`. 

```sql
SELECT * FROM estudantes AS A;
SELECT * FROM notas AS B;
```

Este exemplo apenas retorna todas as colunas de cada tabela, como já vimos em outros exemplos. Mas o importante aqui é como estamos criando um alias ou "apelindo" para cada tabela utilizando o `AS`. Esse alias é importante para facilitar a escrever queries mais curtas, além de ser uma prática comum na construção de queries SQL.




