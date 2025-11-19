---
layout: two-cols
transition: slide-up
---

# <a href="https://www.datageeks.com.br/normalizacao-de-dados/" target="_blank">Normalização</a>

<div class="text-justify mr-8">
A normalização nada mais é que criar outras tabelas para separar as informações, evitar redundância e otimizar o armazenamento de dados. Observe que a tabela abaixo indica que duas pessoas podem morar na mesma casa e ter um mesmo endereço, o que implica em replicar a mesma informação para mais de um usuário. 
<br>

```sql
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    logradouro VARCHAR(200),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    numero VARCHAR(100),
    complemento VARCAHR(100),
    cep VARCHAR(7)
);
```
</div>

::right::

<div class="text-justify mt-14">
Uma maneira de resolver é mover as informações de endereços para uma outra tabela e referenciar como uma chave estrangeira.
<br>
```sql
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    endereco INT,
    FOREIGN KEY (endereco) REFERENCES endereco(id)
);

CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    logradouro VARCHAR(200),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    numero VARCHAR(100),
    complemento VARCAHR(100),
    cep VARCHAR(7)
);
```

</div>
