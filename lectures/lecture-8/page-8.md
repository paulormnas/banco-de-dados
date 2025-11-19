---
layout: default
transition: slide-up
---
# <a href="https://www.datacamp.com/pt/tutorial/sql-injection" target="_blank">Prevenção de SQL Injection (SQLi)</a>

<div>
  A injeção de SQL é uma das táticas mais antigas, porém ainda muito utilizada para acesso a diversos tipos de sistemas. A SQLi é uma maneira de adicionar queries que revelam informações do banco, remove dados ou mesmo altera as permissões de acesso fazendo que a aplicação pare de funcionar e a qeuipe de TI perca o controle do banco de dados.
</div>

Um dos ataques mais comuns em formulários de login é utilizar a expressão `' OR 1=1 --`  no campo de usuário. Assim forçamos a query completa a ficar no seguinte formato:

```sql
SELECT * FROM users WHERE username = '' OR 1=1 --' AND password = '';
```

Desta forma, todos os usuários são retornados garantindo acesso ao sistema. Ou, no mínimo, revela dados dos usuários e informações de senha para o atacante.