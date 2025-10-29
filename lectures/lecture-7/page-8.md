---
layout: default
transition: slide-up
---
# VIEW

<div>
  VIEW é uma "tabela virtual" baseada em uma consulta SQL. Facilita consultas complexas e melhora segurança.
</div>

```sql
-- Sintaxe básica
CREATE VIEW nome_view AS
SELECT ... FROM ... WHERE ...;

-- View: Estudantes com suas médias
CREATE VIEW vw_medias_estudantes AS
SELECT 
    e.nome AS estudante,
    e.curso,
    COUNT(n.id) AS total_avaliacoes,
    ROUND(AVG(n.nota), 2) AS media_geral,
    CASE 
        WHEN AVG(n.nota) >= 7.0 THEN 'Aprovado'
        ELSE 'Reprovado'
    END AS status
FROM estudantes e
LEFT JOIN notas n ON e.id = n.estudante_id
GROUP BY e.id;
```
