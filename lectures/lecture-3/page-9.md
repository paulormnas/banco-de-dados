---
layout: default
transition: slide-up
class: text-justify
---

# WHERE

<div>
Em bancos de dados com muitas informações, buscar todos os dados da tabela pode não ser muito útil. Nestes casos é importante saber criar filtros para que o banco de dados retorne informações selecionadas dentro das tabelas.
<br>
</div>

Imagina que no nosso banco de dados queremos selecionar apenas estudantes inscritos no curso de Informática. Então podemos executar a seguinte query:

```sql
SELECT * FROM estudantes WHERE curso = "informática";
```

Agora, se queremos buscar apenas as notas maiores que 8, podemos usar a seguinte query:

```sql
SELECT * FROM notas WHERE nota > 8;
```

Ainda podemos fazer combinações de filtros utilizando operadores `AND` e `OR`. Por exemplo, considere a query a seguir, onde filtramos por diciplinas com carga horária maior ou igual a 70 horas e com professor diferente do Professor Carlos

```sql
SELECT * FROM disciplinas WHERE carga_horaria >= 70 AND professor <> "Prof. Carlos";
```