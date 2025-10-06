# Estudo Dirigido 3 - Queries SQL com MySQL

  

**Objetivo:** Este estudo dirigido tem como objetivo capacitar o aluno a criar e executar queries SQL para manipular e extrair informações de um banco de dados MySQL, utilizando o MySQL Workbench.

---

### Etapa 1: Configuração do Ambiente

Nesta etapa, você irá configurar o ambiente de desenvolvimento, inicializando um servidor MySQL com Docker e criando um repositório Git para versionar suas soluções.
#### 1.1. Inicializando o MySQL com Docker

Abra o seu terminal e execute o seguinte comando para iniciar um contêiner MySQL. Este comando irá baixar a imagem do MySQL (se ainda não tiver), criar um contêiner chamado `mysql-biblioteca`, definir a senha do usuário `root` como `senha123` e mapear a porta 3306 do contêiner para a porta 3306 da sua máquina local.

```bash
docker run --name mysql-biblioteca -e MYSQL_ROOT_PASSWORD=senha123 -p 3306:3306 -d mysql:latest
```

Após a execução, verifique se o contêiner está em execução:

```bash
docker ps
```

Você deverá ver uma saída similar a esta, indicando que o contêiner `mysql-biblioteca` está ativo:

```
CONTAINER ID IMAGE COMMAND CREATED STATUS PORTS NAMES
<id_do_container> mysql:latest "docker-entrypoint.s…" X minutes ago Up X minutes 0.0.0.0:3306->3306/tcp, 33060/tcp mysql-biblioteca
```
#### 1.2. Configurando o Git

Crie um novo diretório para este estudo dirigido e inicialize um repositório Git dentro dele.

```bash
mkdir estudo-sql
cd estudo-sql
git init
```

Agora, configure seu nome de usuário e e-mail no Git (se ainda não o fez):

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

Crie um arquivo `README.md` e adicione-o ao controle de versão.

```bash
echo "# Estudo Dirigido SQL" > README.md
git add README.md
git commit -m "Initial commit - Setup do ambiente"
```

**Ponto de Verificação:** Você deve ter um contêiner MySQL rodando e um repositório Git inicializado com o `README.md`.

---
### Etapa 2: Conexão com o Banco de Dados e Criação do Esquema

Nesta etapa, você irá se conectar ao banco de dados MySQL utilizando o MySQL Workbench e criar o esquema do banco de dados da biblioteca.
#### 2.1. Conexão com o MySQL Workbench

Abra o MySQL Workbench. Clique no ícone "+" para criar uma nova conexão.
Preencha os seguintes dados:

* **Connection Name:** Estudo SQL Biblioteca
* **Hostname:** 127.0.0.1
* **Port:** 3306
* **Username:** root
* **Password:** (Clique em "Store in Vault..." e digite `senha123`)

Clique em "Test Connection" para verificar se a conexão está funcionando. Se tudo estiver correto, clique em "OK" para salvar a conexão.

Para detalhes sobre como configurar a conexão, consulte a **Aula 3** do seu material de apoio.
#### 2.2. Criação do Banco de Dados e Tabelas

Abra a conexão "Estudo SQL Biblioteca" no MySQL Workbench. No editor de queries, execute o seguinte código SQL para criar o banco de dados `biblioteca` e suas tabelas.

```sql
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca; 

-- Tabela de Autores
CREATE TABLE IF NOT EXISTS autores (
	autor_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	nacionalidade VARCHAR(50)
);

  
-- Tabela de Editoras
CREATE TABLE IF NOT EXISTS editoras (
	editora_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	cidade VARCHAR(50)
);
  

-- Tabela de Livros
CREATE TABLE IF NOT EXISTS livros (
	livro_id INT AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
	ano_publicacao INT,
	isbn VARCHAR(20) UNIQUE,
	autor_id INT,
	editora_id INT,
	FOREIGN KEY (autor_id) REFERENCES autores(autor_id),
	FOREIGN KEY (editora_id) REFERENCES editoras(editora_id)
);
  

-- Tabela de Membros (leitores)
CREATE TABLE IF NOT EXISTS membros (
	membro_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	endereco VARCHAR(200),
	telefone VARCHAR(20),
	email VARCHAR(100) UNIQUE
);
  

-- Tabela de Empréstimos
CREATE TABLE IF NOT EXISTS emprestimos (
	emprestimo_id INT AUTO_INCREMENT PRIMARY KEY,
	livro_id INT,
	membro_id INT,
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,
	FOREIGN KEY (livro_id) REFERENCES livros(livro_id),
	FOREIGN KEY (membro_id) REFERENCES membros(membro_id)
);


-- Inserção de dados de exemplo

-- Autores
INSERT INTO autores (nome, nacionalidade) VALUES
('Machado de Assis', 'Brasileira'),
('Clarice Lispector', 'Brasileira'),
('George Orwell', 'Britânica'),
('Jane Austen', 'Britânica'),
('Gabriel García Márquez', 'Colombiana');
  
-- Editoras
INSERT INTO editoras (nome, cidade) VALUES
('Companhia das Letras', 'São Paulo'),
('Editora Rocco', 'Rio de Janeiro'),
('Penguin Books', 'Londres'),
('HarperCollins', 'Nova Iorque');
  
-- Livros
INSERT INTO livros (titulo, ano_publicacao, isbn, autor_id, editora_id) VALUES
('Dom Casmurro', 1899, '978-8535902778', 1, 1),
('Memórias Póstumas de Brás Cubas', 1881, '978-8535905205', 1, 1),
('A Hora da Estrela', 1977, '978-8535908022', 2, 2),
('1984', 1949, '978-8535902778', 3, 3),
('Orgulho e Preconceito', 1813, '978-8535902778', 4, 3),
('Cem Anos de Solidão', 1967, '978-8535902778', 5, 2),
('Ensaio sobre a Cegueira', 1995, '978-8535902778', NULL, 1); -- Livro sem autor cadastrado

INSERT INTO livros (titulo, ano_publicacao, isbn, autor_id, editora_id) VALUES
('O Alienista', 1882, '978-8535902778', 1, 1);
  
-- Membros
INSERT INTO membros (nome, endereco, telefone, email) VALUES
('Maria Silva', 'Rua das Flores, 123', '11987654321', 'maria.silva@email.com'),
('João Souza', 'Avenida Principal, 456', '21998765432', 'joao.souza@email.com'),
('Ana Paula', 'Rua Secundária, 789', '31987654321', 'ana.paula@email.com');
  

-- Empréstimos
INSERT INTO emprestimos (livro_id, membro_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2023-01-10', '2023-01-20'),
(3, 2, '2023-01-15', '2023-01-25'),
(2, 1, '2023-02-01', NULL), -- Livro ainda não devolvido
(4, 3, '2023-02-05', '2023-02-15');
```
  
Após executar o script, você pode verificar se as tabelas e os dados foram inseridos corretamente navegando no painel "SCHEMAS" do MySQL Workbench.

#### 2.3. Registrando a Etapa no Git:

Salve o código SQL acima em um arquivo chamado `schema.sql` dentro do seu diretório `estudo-sql`.

```bash
git add schema.sql
git commit -m "Criado esquema e populado o banco de dados biblioteca"
```

**Ponto de Verificação:** Você deve estar conectado ao banco de dados `biblioteca` no MySQL Workbench, e as tabelas devem estar populadas com os dados de exemplo. Seu repositório Git deve ter um novo commit.

---
### Etapa 3: Explorando Queries SQL

Nesta etapa, você irá praticar a criação de queries SQL utilizando diversas cláusulas para extrair informações do banco de dados da biblioteca.

**Sempre que completar uma questão, salve a query em um arquivo `.sql` e registre a alteração no Git.**

**Exemplo:**

Para a Questão 1, você pode criar um arquivo `q1.sql` com a solução e então:

```bash
git add q1.sql
git commit -m "Questão 1: Selecionar todos os livros"
```
#### Questões:

**1. SELECT Simples:**
Selecione todos os títulos dos livros e seus respectivos anos de publicação.

**2. COUNT:**
Quantos livros foram publicados?

**3. AVERAGE e GROUP BY:**
Calcule a média do ano de publicação dos livros para cada editora. Exiba o nome da editora e a média do ano de publicação.

**4. MAX e MIN:**
Qual é o livro mais antigo e o mais recente no acervo? Exiba o título e o ano de publicação para ambos.

**5. WHERE:**
Liste todos os livros publicados após o ano 2000.

**6. ORDER BY:**
Selecione todos os autores e ordene-os em ordem alfabética crescente pelo nome.

**7. HAVING:**
Liste as editoras que publicaram mais de 2 livros.

**8. CASE:**
Crie uma query que liste o título do livro e uma coluna `Status` que indique 'Disponível' se o livro não tiver `data_devolucao` preenchida nos empréstimos, ou 'Emprestado' caso contrário.

*Dica: Você precisará usar um `LEFT JOIN` com a tabela `emprestimos` para verificar os livros que estão atualmente emprestados.*

**9. JOIN (INNER JOIN):**
Liste o título de todos os livros juntamente com o nome do autor e o nome da editora.

**10. JOIN (LEFT JOIN) e WHERE:**
Encontre todos os livros que não possuem um autor cadastrado. Exiba o título do livro.

---
### Etapa 4: Limpeza do Ambiente (Opcional)

Após concluir o estudo, você pode remover o contêiner Docker para liberar recursos.

1. **Parar o contêiner:**

```bash
docker stop mysql-biblioteca
```

2. **Remover o contêiner:**

```bash
docker rm mysql-biblioteca
```

3. **Remover a imagem Docker (opcional):**
Se você não pretende usar a imagem do MySQL novamente, pode removê-la para liberar espaço em disco.

```bash
docker rmi mysql:latest
```

---
### Etapa 5: Instruções de Entrega

Para entregar este estudo dirigido, siga os passos abaixo:

1. **Crie um novo repositório no GitHub:**

	Acesse o GitHub e crie um novo repositório público. Sugestão de nome: `estudo-dirigido-sql-biblioteca`.

2. **Conecte seu repositório local ao GitHub:**

- No terminal, dentro do diretório `estudo-sql`, adicione o repositório remoto:

```bash
git remote add origin <URL_DO_SEU_REPOSITORIO_GITHUB>
```

(Substitua `<URL_DO_SEU_REPOSITORIO_GITHUB>` pela URL do seu novo repositório no GitHub, ex: `https://github.com/seu-usuario/estudo-dirigido-sql-biblioteca.git`)

* Envie seus commits para o GitHub:

```bash
git branch -M main
git push -u origin main
```

3. **Crie o arquivo `solucoes.sql`:**

* No seu diretório `estudo-sql`, crie um arquivo chamado `solucoes.sql`.

* Neste arquivo, adicione todas as queries que você desenvolveu para resolver as 10 questões, uma após a outra, com comentários indicando a qual questão cada query pertence.

**Exemplo do `solucoes.sql`:**

```sql
-- Questão 1: Selecionar todos os títulos dos livros e seus respectivos anos de publicação.
SELECT * FROM livros;

-- Questão 2: Quantos livros foram publicados?
SELECT COUNT(*) AS total_autores FROM autores;

-- Questão 3: Calcule a média do ano de publicação dos livros para cada editora. Exiba o nome da editora e a média do ano de publicação.

-- Sua query aqui...

-- ... e assim por diante para todas as questões.

```

4. **Adicione e envie o arquivo `solucoes.sql` para o GitHub:**

```bash
git add solucoes.sql
git commit -m "Entrega: Adicionado arquivo com todas as soluções das queries"
git push origin main
```

5. **Envie o link do seu repositório GitHub para o professor utilizando o Classroom.**

---

**Parabéns!** Você concluiu o Estudo Dirigido 3 sobre queries SQL. Continue praticando para aprimorar suas habilidades.