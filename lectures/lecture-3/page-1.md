---
layout: default
transition: slide-up
---

# Conexão com o Banco de Dados

<div>
Antes de qualquer coisa precisamos iniciar uma conexão com o banco de dados. No repositório da disciplina no Github encontramos um arquivo docker-compose.yml configurado para rodar o MySQL 8. Então, após clonar o repositório na nossa máquina, acesse o diretório do projeto e inicie o banco de dados utilizando o Docker.
</div>

```bash
docker compose up -d
```

Em seguida inicie a conexão do Workbench com o banco acessando o menu `Database > Connect to Database`. Preencha o campo "Password" com o valor configurado na arquivo `docker-compose.yml` na variávei de ambiente `MYSQL_ROOT_PASSWORD`. No campo "Port" devemos manter 3306 (padrão pro banco MySQL). Os campos o User e Host deve ser `root` e 127.0.0.1, respectivamente, pois estamos conectando com um banco local. 

É importante lembrar que esses valores foram configurados desta maneira por questão de aprendizado, mas informações como senhas não devem ser compartilhadas e nem configuradas no docker-compose.yml da maneira como foi apresentado. Pois dessa maneira os dados ficam expostos no Github, e quem tiver acesso ao seu repositório terá acesso de administrador ao seu banco de dados.
