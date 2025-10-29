---
layout: default
transition: slide-up
class: text-justify
---

# CREATE TABLE

<div>

Na aula anterior vimos como modelar um schema de banco de dados, porém ainda não aprendemos como criar um novo schema e inserir novas tabelas. Além disso, vamos ver outras cláusulas de Data Manipulation Language (DML) e Data Definition Languagem (DFL) para construir as tabelas, estabelecer relações e alterar dados inseridos no banco a começar pela cláusula CREATE TABLE. 

</div>

Para criar uma tabela no banco de dados e definir sua estrutura usamos a cláusula CREATE TABLE com a seguinte estrutura:

```sql
-- Sintaxe básica
CREATE TABLE nome_tabela (
    coluna1 TIPO_DE_DADO CONSTRAINTS,
    coluna2 TIPO_DE_DADO CONSTRAINTS,
    ...
);
```


