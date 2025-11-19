---
layout: default
transition: slide-up
---
# <a href="https://www.ohub.com.br/ideias/tipos-de-backup/" target="_blank">Backup</a>

<div>
  Um ponto crítico de toda aplicação em produção é ter o backup dos registros e da estrutura do banco de dados. O backup é a forma que temos de recuperar informações em casos críticos de falha, ataques ou mesmo por um erro de um desenvolvedor iniciante.
</div>

Boas práticas de backup incluem armazenar o backup em um local separado do banco original, pelos mesmo motivos que um banco de dados não deve ficar na mesma máquina que a aplicação que o utiliza. Além disso é importante determinar a periodicidade para realizar novos backups, quando apagar os backups antigos e o método a ser utilizado. Dentre os métodos temos:

- Completo
- Incremental
- Diferencial