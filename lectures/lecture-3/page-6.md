---
layout: default
transition: slide-up
class: text-justify
---

# Executando o primeiro SELECT

<div>
Agora já podmeos iniciar as primeiras ações de busca de informações no banco. O primeiro comando importante é o SELECT, o qual indica ao banco de dados em quais tabelas buscar informações e quais critérios a busca deve atender. Vejamos um primeiro exmeplo:
<br>
</div>

```sql
SELECT * FROM estudantes;
```

Neste exemplo estamos pedindo ao banco que "selecione todas as colunas da tabela estudantes". O asterísco indica que é pra buscar todas as colunas disponíveis. Se quisermos ver apenas os nomes dos estudantes podemos fazer o seguinte:

```sql
SELECT nome FROM estudantes;
```

Assim, o banco de dados entende que deve retornar apenas a coluna com os nomes dos estudantes.