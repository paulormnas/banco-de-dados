---
layout: default
transition: slide-up
---

# Tipos de dados para os valores armazenados

<div>
Durante a fase de design do banco de dados é importante escolher adequadamente o tipo de dado que vai representar a informação que se deseja armazenar. Vejamos o exemplo de Número vs Varchar. 
</div>

Devemos utilizar tipos de dados numéricos (INT e FLOAT) apenas em campos onde serão feitos cálculos ou utilizadas funções de agregação. Informações como matrículas, CPF e números de cartão de crédito, devem ser armazenados como tipo VARCHAR para evitar perda de dados e facilitar a busca. 

Por exemplo, se o CPF `012.567.610-79` for armazenado como número, o primeiro zero seria suprimido, armazenando o dado de forma incorreta. Abaixo está um exemplo mais adequado para armazenar esse tipo de informação.

```sql
-- Exemplo: Tabela de Professores
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(16) NOT NULL,
    cpf VARCHAR(11)
);
```