---
layout: default
transition: slide-up
---

# Nomes de Tabelas

<div>
Nomes de tabelas devem estar no singular, evitar espaço e caracteres especiais (ex.: empregado, pedido, transacao_bancaria, etc). Uma boa prática é adotar o <a href="https://www.alura.com.br/artigos/convencoes-nomenclatura-camel-pascal-kebab-snake-case" target="_blank">snake_case</a> na formatação dos nomes.
</div>

Deve se utilizar singular pelo fato de a tabela nomear o que está representado em cada linha da tabela No exmeplo abaixo cada linha na tabela representa um professor diferente. Essa convenção também está explica devido a existência de relações One-to-One, onde um registro de uma tabela está relacionado com um único registro de outra tabela. 

```sql
-- Exemplo: Tabela de Professores
CREATE TABLE professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10, 2)
);
```

