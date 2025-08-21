---
layout: default
transition: slide-up
class: text-justify
---

# Tornando o SELECT mais interessante

<div>
Vamos olhar agora para a tabela notas e tentar arredondar os valores das notas de cada estudante. 
<br>
</div>

```sql
SELECT * FROM notas;
SELECT id, estudante_id, disciplina_id, nota as "nota inicial", round(nota) as "nota arredondada" FROM notas;
```

Ainda podemos executar operações matemáticas com os dados númericos. Imagina que precisamos multiplicar por um valor como 1,52.

```sql
SELECT id, estudante_id, disciplina_id, nota as "nota inicial", nota * 1.52 as "nota arredondada" FROM notas;
```