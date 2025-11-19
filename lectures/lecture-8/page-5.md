---
layout: default
transition: slide-up
---

# Indexação

<div class="text-justify">
 A indexação é uma maneira de agilizar consultas em tabelas onde se executa SELECT com muita frequência. A indexação funciona como o índice remessivo de um livro onde se indica em qual página se encontra a definição de determinada palavra ou expressão. 
</div>

Para criar uma indexiação basta indicar o nome da tabela e a coluna frequentemente utilizada nos filtros com WHERE.

```sql
-- Cria índice para a coluna preco na tabela produto
CREATE INDEX preco_index ON produto(preco); 

-- Remove índice do banco de dados
DROP INDEX preco_index;
```

É importante ressaltar que a indexação penaliza operações de INSERT, UPDATE e DELETE, pois é necessário atualizar o índice cada vez que uma dessas operações são executadas. Por isso é importante balancear o uso de índices e priorizar tabelas com grandes quantidades de dados. Tabelas com poucas informações não precisam de indexação.
