---
layout: default
transition: slide-up
class: text-justify
---

# CASE

<div>

Em alguns casos precisamos substituir o resultado de uma query por palavras específicas e baseadas em condições. Por exemplo, considere um banco de dados de condições ambientais onde queremos apenas apresentar a palavra CALOR como um título para temperaturas acima de 30ºC. Para estes casos usamos o CASE, de uma maneira semelhante a que utilizamos em outras linguagens de programação. Dentro do CASE declaramos as condições em que os resultados devem ser alterados. Vejamos um exemplo em nosso banco de escola.

</div>

```sql
SELECT
    nome AS Nome_Professor,
    salario AS Salario,
    -- A Cláusula CASE avalia o valor do salário para definir uma Categoria Salarial
    CASE
        WHEN salario >= 9000.00 THEN 'Sênior (Salário Alto)'
        WHEN salario >= 7000.00 THEN 'Pleno (Salário Médio)'
        ELSE 'Júnior (Salário Inicial)'
    END AS Categoria_Salarial
FROM
    professores
ORDER BY
    salario DESC;
```
