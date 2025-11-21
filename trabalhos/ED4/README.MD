# Tutorial Passo a Passo: Sistema Escolar 🎓

## Introdução

Vamos criar um banco de dados para gerenciar uma escola. Siga cada passo com atenção!

---

## PASSO 1: Criar o Diagrama no MySQL Workbench

### 1.1 Abrir o Workbench e Criar Novo Modelo

- Abra o MySQL Workbench
- Clique em **File → New Model**
- Na aba **Model**, dê duplo clique em **"Add Diagram"**
- Você verá uma área em branco para desenhar

### 2.2 Criar a Tabela PROFESSORES no Diagrama

- Clique no ícone de tabela (quadradinho com linhas) na barra lateral
- Clique na área do diagrama para adicionar a tabela
- Dê duplo clique na tabela para editar
- Nomeie a tabela: `professores`
- Adicione as colunas com as seguintes configurações:

| Coluna       | Datatype     | PK  | NN  | UQ  | AI  |
| ------------ | ------------ | --- | --- | --- | --- |
| id_professor | INT          | ✓   | ✓   |     | ✓   |
| nome         | VARCHAR(100) |     | ✓   |     |     |
| email        | VARCHAR(100) |     | ✓   | ✓   |     |
| disciplina   | VARCHAR(50)  |     | ✓   |     |     |
| telefone     | VARCHAR(15)  |     |     |     |     |

**Legendas:** PK = Primary Key, NN = Not Null, UQ = Unique, AI = Auto Increment

### 2.3 Criar a Tabela TURMAS no Diagrama

- Adicione outra tabela
- Nomeie: `turmas`
- Adicione as colunas:

| Coluna   | Datatype    | PK  | NN  | AI  |
| -------- | ----------- | --- | --- | --- |
| id_turma | INT         | ✓   | ✓   | ✓   |
| nome     | VARCHAR(50) |     | ✓   |     |
| serie    | VARCHAR(20) |     | ✓   |     |
| turno    | VARCHAR(20) |     | ✓   |     |

**Observação:** Use VARCHAR(20) para o campo `turno`

### 2.4 Criar a Tabela ALUNOS no Diagrama

- Adicione outra tabela
- Nomeie: `alunos`
- Adicione as colunas:

| Coluna               | Datatype     | PK  | NN  | AI  |
| -------------------- | ------------ | --- | --- | --- |
| id_aluno             | INT          | ✓   | ✓   | ✓   |
| nome                 | VARCHAR(100) |     | ✓   |     |
| data_nascimento      | DATE         |     | ✓   |     |
| responsavel          | VARCHAR(100) |     | ✓   |     |
| telefone_responsavel | VARCHAR(15)  |     |     |     |
| id_turma             | INT          |     | ✓   |     |

### 2.5 Criar a Tabela PROFESSORES_TURMAS no Diagrama

- Adicione outra tabela
- Nomeie: `professores_turmas`
- Adicione as colunas:

| Coluna       | Datatype | PK  | NN  |
| ------------ | -------- | --- | --- |
| id_professor | INT      | ✓   | ✓   |
| id_turma     | INT      | ✓   | ✓   |

**Atenção:** Esta tabela tem chave primária composta (as duas colunas juntas formam a PK)

### 1.6 Criar os Relacionamentos

Agora vamos conectar as tabelas manualmente através das Foreign Keys:

**Relacionamento 1: TURMAS → ALUNOS (1:N)**

- Dê duplo clique na tabela `alunos` para abrir as propriedades
- Vá na aba **"Foreign Keys"**
- Clique no espaço em branco embaixo para adicionar uma nova FK
- Configure:
  - **Foreign Key Name:** `fk_alunos_turmas`
  - **Referenced Table:** `turmas`
  - Na seção de baixo, mapeie as colunas:
    - **Column:** `id_turma` (da tabela alunos)
    - **Referenced Column:** `id_turma` (da tabela turmas)

**Relacionamento 2: PROFESSORES → PROFESSORES_TURMAS (1:N)**

- Dê duplo clique na tabela `professores_turmas`
- Vá na aba **"Foreign Keys"**
- Adicione uma nova FK:
  - **Foreign Key Name:** `fk_prof_turmas_professores`
  - **Referenced Table:** `professores`
  - Mapeie:
    - **Column:** `id_professor`
    - **Referenced Column:** `id_professor`

**Relacionamento 3: TURMAS → PROFESSORES_TURMAS (1:N)**

- Ainda na tabela `professores_turmas`, adicione outra FK:
  - **Foreign Key Name:** `fk_prof_turmas_turmas`
  - **Referenced Table:** `turmas`
  - Mapeie:
    - **Column:** `id_turma`
    - **Referenced Column:** `id_turma`

**Resultado:** Você criou um relacionamento N:N entre professores e turmas, usando `professores_turmas` como tabela intermediária! As linhas de relacionamento aparecerão automaticamente no diagrama.

### 1.7 Revisar o Diagrama

Verifique se:

- [ ] Todas as 4 tabelas estão criadas
- [ ] Todas as chaves primárias (PK) estão marcadas
- [ ] As 3 linhas de relacionamento estão visíveis
- [ ] Os relacionamentos apontam na direção correta

### 1.8 Exportar o Diagrama

- Vá em **File → Export → Export as PNG**
- Salve como `diagrama_escola.png`
- Guarde este arquivo para entregar junto com o SQL

---

## PASSO 2: Criar o Banco de Dados no MySQL

### 2.1 Abrir o MySQL e Criar o Schema

Crie o banco de dados chamado `escola` e selecione-o para uso.

**Dica:** Use os comandos `CREATE DATABASE` e `USE`

### 1.2 Criar a Tabela PROFESSORES

Crie a tabela `professores` com os seguintes atributos:

| Coluna       | Tipo         | Restrições                  |
| ------------ | ------------ | --------------------------- |
| id_professor | INT          | PRIMARY KEY, AUTO_INCREMENT |
| nome         | VARCHAR(100) | NOT NULL                    |
| email        | VARCHAR(100) | UNIQUE, NOT NULL            |
| disciplina   | VARCHAR(50)  | NOT NULL                    |
| telefone     | VARCHAR(15)  | -                           |

**Verifique:** Execute `DESCRIBE professores;` para ver se criou corretamente.

### 1.3 Criar a Tabela TURMAS

Crie a tabela `turmas` com os seguintes atributos:

| Coluna   | Tipo        | Restrições                  |
| -------- | ----------- | --------------------------- |
| id_turma | INT         | PRIMARY KEY, AUTO_INCREMENT |
| nome     | VARCHAR(50) | NOT NULL                    |
| serie    | VARCHAR(20) | NOT NULL                    |
| turno    | VARCHAR(10) | NOT NULL                    |

**Verifique:** Execute `DESCRIBE turmas;`

### 1.4 Criar a Tabela ALUNOS

Crie a tabela `alunos` com os seguintes atributos:

| Coluna               | Tipo         | Restrições                                           |
| -------------------- | ------------ | ---------------------------------------------------- |
| id_aluno             | INT          | PRIMARY KEY, AUTO_INCREMENT                          |
| nome                 | VARCHAR(100) | NOT NULL                                             |
| data_nascimento      | DATE         | NOT NULL                                             |
| responsavel          | VARCHAR(100) | NOT NULL                                             |
| telefone_responsavel | VARCHAR(15)  | -                                                    |
| id_turma             | INT          | NOT NULL, FOREIGN KEY referenciando turmas(id_turma) |

**Atenção:** Esta tabela depende de `turmas`, por isso foi criada depois!

**Verifique:** Execute `DESCRIBE alunos;`

### 1.5 Criar a Tabela PROFESSORES_TURMAS

Crie a tabela `professores_turmas` com os seguintes atributos:

| Coluna       | Tipo | Restrições                                                    |
| ------------ | ---- | ------------------------------------------------------------- |
| id_professor | INT  | NOT NULL, FOREIGN KEY referenciando professores(id_professor) |
| id_turma     | INT  | NOT NULL, FOREIGN KEY referenciando turmas(id_turma)          |
| -            | -    | PRIMARY KEY composta (id_professor, id_turma)                 |

**Dica:** A chave primária é formada pelas duas colunas juntas: `PRIMARY KEY (id_professor, id_turma)`

**Verifique:** Execute `SHOW TABLES;` para ver todas as 4 tabelas criadas.

---

## PASSO 3: Inserir Dados (INSERT)

### 3.1 Inserir Professores

Insira os seguintes professores na tabela `professores`:

| Nome          | Email                    | Disciplina      | Telefone    |
| ------------- | ------------------------ | --------------- | ----------- |
| Carlos Silva  | carlos.silva@escola.com  | Matemática      | 11987654321 |
| Maria Santos  | maria.santos@escola.com  | Português       | 11976543210 |
| João Oliveira | joao.oliveira@escola.com | História        | 11965432109 |
| Ana Costa     | ana.costa@escola.com     | Ciências        | 11954321098 |
| Paulo Lima    | paulo.lima@escola.com    | Educação Física | 11943210987 |

**Verifique:** Execute `SELECT * FROM professores;` para ver os dados inseridos.

### 3.2 Inserir Turmas

Insira as seguintes turmas na tabela `turmas`:

| Nome | Série  | Turno |
| ---- | ------ | ----- |
| 6A   | 6º ano | manhã |
| 7B   | 7º ano | tarde |
| 8A   | 8º ano | manhã |
| 9C   | 9º ano | tarde |

**Verifique:** Execute `SELECT * FROM turmas;`

### 3.3 Inserir Alunos

Insira os seguintes alunos na tabela `alunos`:

| Nome             | Data Nascimento | Responsável      | Telefone Responsável | ID Turma |
| ---------------- | --------------- | ---------------- | -------------------- | -------- |
| Pedro Alves      | 2010-03-15      | Roberto Alves    | 11999887766          | 1        |
| Julia Mendes     | 2010-05-20      | Carla Mendes     | 11988776655          | 1        |
| Lucas Rocha      | 2010-08-10      | Fernanda Rocha   | 11977665544          | 1        |
| Beatriz Souza    | 2009-02-28      | Marcos Souza     | 11966554433          | 2        |
| Gabriel Lima     | 2009-07-12      | Patricia Lima    | 11955443322          | 2        |
| Mariana Costa    | 2009-11-05      | José Costa       | 11944332211          | 2        |
| Rafael Santos    | 2008-01-18      | Ana Santos       | 11933221100          | 3        |
| Larissa Oliveira | 2008-04-22      | Paulo Oliveira   | 11922110099          | 3        |
| Felipe Martins   | 2008-09-30      | Sandra Martins   | 11911009988          | 3        |
| Camila Ferreira  | 2008-12-15      | Ricardo Ferreira | 11900998877          | 3        |
| Thiago Ribeiro   | 2007-03-08      | Juliana Ribeiro  | 11899887766          | 4        |
| Amanda Silva     | 2007-06-25      | Carlos Silva     | 11888776655          | 4        |
| Bruno Carvalho   | 2007-10-14      | Marcia Carvalho  | 11877665544          | 4        |
| Isabela Gomes    | 2007-12-20      | Fernando Gomes   | 11866554433          | 4        |
| Vitor Pereira    | 2008-02-11      | Lucia Pereira    | 11855443322          | 4        |

**Atenção:** O ID da turma deve corresponder às turmas já criadas (1=6A, 2=7B, 3=8A, 4=9C)

**Verifique:** Execute `SELECT COUNT(*) FROM alunos;` para confirmar que tem 15 alunos.

### 3.4 Associar Professores às Turmas

Insira as seguintes associações na tabela `professores_turmas`:

| ID Professor | ID Turma | Observação                      |
| ------------ | -------- | ------------------------------- |
| 1            | 1        | Carlos (Matemática) na turma 6A |
| 2            | 1        | Maria (Português) na turma 6A   |
| 4            | 1        | Ana (Ciências) na turma 6A      |
| 1            | 2        | Carlos (Matemática) na turma 7B |
| 2            | 2        | Maria (Português) na turma 7B   |
| 3            | 2        | João (História) na turma 7B     |
| 1            | 3        | Carlos (Matemática) na turma 8A |
| 3            | 3        | João (História) na turma 8A     |
| 5            | 3        | Paulo (Ed. Física) na turma 8A  |
| 2            | 4        | Maria (Português) na turma 9C   |
| 3            | 4        | João (História) na turma 9C     |
| 4            | 4        | Ana (Ciências) na turma 9C      |

**Atenção:** Note que o professor Carlos (id=1) dá aula em 3 turmas diferentes!

**Verifique:** Execute `SELECT * FROM professores_turmas;`

---

## PASSO 4: Atualizar Dados (UPDATE)

### 4.1 Aluno Mudou de Turma

Atualize o aluno Pedro (id=1) para a turma 7B (id=2).

**O que atualizar:**

- Coluna: `id_turma`
- Novo valor: `2`
- Condição: `id_aluno = 1`

**Dica:** Use `UPDATE tabela SET coluna = valor WHERE condição;`

**Verifique:** Execute `SELECT nome, id_turma FROM alunos WHERE id_aluno = 1;`

### 4.2 Professor Atualizou o Telefone

Atualize o telefone do professor Carlos (id=1) para '11999999999'.

**O que atualizar:**

- Coluna: `telefone`
- Novo valor: `'11999999999'`
- Condição: `id_professor = 1`

**Dica:** Não esqueça de usar aspas simples para valores de texto!

**Verifique:** Execute `SELECT nome, telefone FROM professores WHERE id_professor = 1;`

### 4.3 Turma Mudou de Turno

Atualize a turma 8A (id=3) de 'manhã' para 'tarde'.

**O que atualizar:**

- Coluna: `turno`
- Novo valor: `'tarde'`
- Condição: `id_turma = 3`

**Verifique:** Execute `SELECT * FROM turmas WHERE id_turma = 3;`

---

## PASSO 5: Deletar Dados (DELETE)

### 5.1 Remover um Aluno

Delete o aluno Vitor (id=15) que se desmatriculou.

**O que deletar:**

- Tabela: `alunos`
- Condição: `id_aluno = 15`

**Dica:** Use `DELETE FROM tabela WHERE condição;`

**⚠️ ATENÇÃO:** Sempre use WHERE, senão todos os registros serão deletados!

**Verifique:** Execute `SELECT COUNT(*) FROM alunos;` (deve ter 14 agora)

### 5.2 Remover Associação Professor-Turma

Delete a associação do professor Paulo (id=5) com a turma 8A (id=3). Ele não vai mais dar aula lá.

**O que deletar:**

- Tabela: `professores_turmas`
- Condição: `id_professor = 5` E `id_turma = 3`

**Dica:** Use o operador `AND` para combinar duas condições no WHERE

**Verifique:** Execute `SELECT * FROM professores_turmas WHERE id_professor = 5;`

### 5.3 Tentar Deletar uma Turma (DESAFIO)

Tente deletar a turma 6A (id=1).

**O que tentar deletar:**

- Tabela: `turmas`
- Condição: `id_turma = 1`

**Dica:** Execute o comando DELETE normalmente

**O que aconteceu?** Você recebeu um erro! Por quê?

- A turma tem alunos vinculados a ela (chave estrangeira)
- O MySQL não permite deletar a turma para manter a integridade dos dados

**Resposta para entregar:** "Não foi possível deletar a turma porque existem alunos vinculados a ela através da chave estrangeira. Para deletar a turma, seria necessário primeiro remover ou realocar todos os alunos."

---

## PASSO 6: Criar Views

### 6.1 View: Lista de Alunos

Crie uma VIEW chamada `vw_lista_alunos` que mostre:

- Nome da turma (renomeie para 'turma')
- Série da turma
- Nome do aluno (renomeie para 'aluno')

**Requisitos:**

- Faça JOIN entre `alunos` e `turmas`
- Ordene por nome da turma e depois por nome do aluno

**Dica:** Use `CREATE VIEW nome AS SELECT ... FROM ... INNER JOIN ... ORDER BY ...`

**Testar:** Execute `SELECT * FROM vw_lista_alunos;`

### 6.2 View: Professores por Turma

Crie uma VIEW chamada `vw_professores_turmas` que mostre:

- Nome da turma (renomeie para 'turma')
- Nome do professor (renomeie para 'professor')
- Disciplina do professor

**Requisitos:**

- Faça JOIN entre `professores_turmas`, `professores` e `turmas`
- Ordene por nome da turma e depois por nome do professor

**Dica:** Você vai precisar de 2 INNER JOINs. A tabela `professores_turmas` conecta as outras duas.

**Testar:** Execute `SELECT * FROM vw_professores_turmas;`

### 6.3 View: Total de Alunos por Turma

Crie uma VIEW chamada `vw_total_alunos_turma` que mostre:

- Nome da turma (renomeie para 'turma')
- Série da turma
- Turno da turma
- Quantidade de alunos (renomeie para 'total_alunos')

**Requisitos:**

- Use LEFT JOIN entre `turmas` e `alunos`
- Use COUNT para contar os alunos
- Use GROUP BY para agrupar por turma
- Ordene por nome da turma

**Dica:** Use `COUNT(a.id_aluno)` e agrupe por `t.id_turma, t.nome, t.serie, t.turno`

**Testar:** Execute `SELECT * FROM vw_total_alunos_turma;`

### 6.4 View: Alunos Menores de Idade

Crie uma VIEW chamada `vw_alunos_menores` que mostre:

- Nome do aluno (renomeie para 'aluno')
- Data de nascimento
- Idade calculada (renomeie para 'idade')
- Nome do responsável
- Telefone do responsável

**Requisitos:**

- Use a função `TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE())` para calcular a idade
- Use WHERE para filtrar apenas alunos com idade < 18
- Ordene por nome do aluno

**Dica:** TIMESTAMPDIFF calcula a diferença em anos entre a data de nascimento e a data atual

**Testar:** Execute `SELECT * FROM vw_alunos_menores;`

---

## Passo 7: Entrega

### 7.3 Preparar Arquivos para Entrega

Você deve ter os seguintes arquivos:

- `escola.mwb` (modelo do Workbench, obtido em File -> Save Model As)
- `diagrama_escola.png` (imagem do diagrama, obtido em File -> Export -> PNG (com a tela do diagrama aberta))
- `escola.sql` (script com todas as queries, obtido em File -> Save Script As)

---

## PASSO 8: Criar Repositório no GitHub

### 8.1 Login na Conta no GitHub

- Acesse https://github.com

### 8.2 Criar Novo Repositório

- Na página inicial do GitHub, clique no botão **"+"** no canto superior direito
- Selecione **"New repository"**
- Configure o repositório:
  - **Repository name:** `sistema-escolar-sql`
  - **Description:** "Projeto de banco de dados para gerenciamento escolar - MySQL"
  - **Public** ✓ (deixe marcado como público)
  - Clique em **"Create repository"**

### 8.3 Adicionar Arquivos ao Repositório

```bash
# Abra o terminal na pasta onde estão seus arquivos
git clone https://github.com/SEU_USUARIO/sistema-escolar-sql.git
cd sistema-escolar-sql
# Copie seus 3 arquivos para esta pasta
git add .
git commit -m "Adicionar projeto sistema escolar"
git push origin main
```

### 8.4 Copiar o Link do Repositório

- Na página principal do seu repositório, clique no botão verde **"Code"**
- Copie a URL (será algo como: `https://github.com/seu-usuario/sistema-escolar-sql`)
- **Envie este link para o professor**

---

## 📦 Entrega Final

### O que entregar:

**Link do repositório público no GitHub contendo:**

1. `escola.mwb` - Modelo exportado do MySQL Workbench
2. `diagrama_escola.png` - Diagrama visual do banco de dados
3. `escola.sql` - Script completo com todas as queries

### Como entregar:

Envie o link do seu repositório GitHub (formato: `https://github.com/seu-usuario/sistema-escolar-sql`) para o professor através do meio de comunicação indicado (email, plataforma EAD, etc).

---