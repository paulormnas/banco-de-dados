---
layout: default
transition: slide-up
---

# CREATE TABLE

<div>
Observe como as constraints de PRIMARY KEY e FOREIGN KEY são utilizadas para relacionar a tabela professores com a tabela disciplinas. 
</div>

Além disso temos as contraints `NOT NULL`, `UNIQUE` e `AUTO_INCREMENT`. 

```sql
-- Exemplo: Tabela de Professores
CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_contratacao DATE NOT NULL,
    salario DECIMAL(10, 2)
);

-- Com Foreign Key
CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    carga_horaria INT NOT NULL,
    professor_id INT,
    FOREIGN KEY (professor_id) REFERENCES professores(id)
);
```