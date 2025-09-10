---
layout: default
transition: slide-up
class: text-justify
---

# Funções de Agregação

<div>

As funções de agregação servem para executar operações com os registros retornados em uma query e apresentar um resultado mais consolidado que facilita a análise dos dados contidos na tabela ou no banco de dados como um todo. As principais funções de agregação são:

</div>

```sql
SELECT COUNT(*) AS alunos_inscritos FROM estudantes;
```

| alunos_inscritos   |
| -------- |
| 7    | 

<br>

```sql
SELECT AVG(nota) AS media_notas, MAX(nota) AS nota_máxima, MIN(nota) AS nota_mínima FROM notas;
```

| media_notas   |  nota_máxima  | nota_mínima |
| --------  | -------- | -------- |
| 77.831250 | 9.50  | 6.00 |



