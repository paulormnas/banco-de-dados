# Apresentação de Banco de Dados - Instruções

## 📋 Objetivo

Desenvolver um projeto completo de banco de dados relacional, incluindo modelagem, implementação e documentação, demonstrando compreensão dos conceitos de bancos de dados relacionais e boas práticas de desenvolvimento.

## 📅 Data de Apresentação

**03 de dezembro de 2025**

## 👥 Formato

- Trabalho em **grupo** (3 alunos no máximo) ou **individual**
- Apresentação oral em sala de aula (10-15 minutos por grupo)
- Entrega via repositório GitHub

## 🎯 Tema do Projeto

Escolha **UMA** das seguintes aplicações para desenvolver:

1. **Sistema de Streaming de Vídeos** (tipo Netflix/YouTube)
2. **Plataforma de Gestão de Clínica Médica**
3. **E-commerce de Produtos**
4. **Sistema de Gerenciamento de Academia/Fitness**
5. **Aplicativo de Delivery de Comida**
6. **Plataforma de Gestão de Eventos e Ingressos**

## 📦 Entregas Obrigatórias

### 1. Repositório GitHub

Crie um repositório público no GitHub contendo:

```
nome-do-projeto/
├── README.md
├── diagrama/
│   └── diagrama-er.png (ou .pdf, .jpg) (imagem do diagrama)
│   └── diagrama-er.mwb (arquivo gerado pelo MySQL Workbench)
└── database/
    └── schema.sql
```

#### Estrutura dos arquivos:

- **README.md**: Documentação do projeto (veja seção abaixo)
- **diagrama-er**: Diagrama Entidade-Relacionamento do banco de dados
- **schema.sql**: Arquivo SQL completo com DDL e DML

### 2. Apresentação em Aula

Prepare uma apresentação que cubra:

- Descrição da aplicação escolhida (2-3 min)
- Explicação do diagrama ER e relacionamentos (5-7 min)
- Demonstração das principais queries (3-5 min)
- Discussão sobre segurança e boas práticas implementadas (2-3 min)

## 📝 Requisitos Técnicos

### Diagrama Entidade-Relacionamento

- Mínimo de **5 tabelas** relacionadas
- Uso correto de chaves primárias (PK) e chaves estrangeiras (FK)
- Incluir cardinalidade nos relacionamentos (1:1, 1:N, N:M) (Gerado automaticamente com o MySQL Workbench)
- Representar atributos de cada entidade
- Identificar relacionamentos muitos-para-muitos com tabelas associativas

**Ferramenta sugerida:** MySQL Workbench

### Arquivo SQL (schema.sql)

O arquivo deve conter, **nesta ordem**:

#### 1. Comentários iniciais
```sql
-- =============================================
-- Projeto: [Nome do Projeto]
-- Descrição: [Breve descrição]
-- Autores: [Nomes dos alunos]
-- Data: [Data]
-- =============================================
```

#### 2. Criação do banco de dados
```sql
CREATE DATABASE IF NOT EXISTS nome_banco;
USE nome_banco;
```

#### 3. Criação das tabelas (DDL)
- Definir tipos de dados apropriados
- Implementar chaves primárias
- Implementar chaves estrangeiras
- Adicionar constraints (UNIQUE, NOT NULL, CHECK, DEFAULT)
- Incluir índices em campos frequentemente consultados

#### 4. Inserção de dados de exemplo (DML)
- Mínimo de **5 registros por tabela**
- Dados realistas e consistentes
- Garantir integridade referencial

#### 5. Queries de consulta (SELECT)
- Mínimo de **5 consultas** demonstrando:
  - JOIN entre tabelas
  - Funções de agregação (COUNT, SUM, AVG, etc.)
  - Cláusulas WHERE, GROUP BY, HAVING
  - Ordenação com ORDER BY

#### 6. Criação de VIEW
- Mínimo de uma VIEW para consulta mais estruturada que utiliza diversas cláusulas SQL
- A query elaborada para a VIEW deve ser diferente das queries elaboradas anteriormente

### Boas Práticas de Segurança

Seu projeto **DEVE** incluir:

1. **Senhas protegidas**: Não armazene senhas em texto puro
   - Comentar no SQL que em produção usaria hashing (bcrypt, SHA-256)
   - Exemplo: `-- Em produção, usar: PASSWORD_HASH = SHA2('senha123', 256)`

2. **Validações**: Usar constraints para validar dados
   - CHECK para validar faixas de valores
   - UNIQUE para campos que não podem repetir
   - NOT NULL para campos obrigatórios

3. **Nomenclatura consistente**:
   - Tabelas em minúsculas e plural (ex: `usuarios`, `produtos`)
   - Campos descritivos (evitar `col1`, `campo_x`)
   - Snake_case ou camelCase (seja consistente)

4. **Comentários**: Documentar decisões importantes no SQL

## 📄 Conteúdo do README.md

Seu README deve conter:

```markdown
# [Nome do Projeto]

## Descrição
[Breve descrição da aplicação e seu propósito]

## Autores
- [Nome do Aluno 1]
- [Nome do Aluno 2]
- ...

## Tecnologias Utilizadas
- MySQL / PostgreSQL / SQLite
- [Ferramenta de diagramação]

## Modelo de Dados

### Entidades Principais
- **[Nome da Entidade]**: [Descrição]
- ...

### Relacionamentos
- [Entidade A] → [Entidade B]: [Tipo de relacionamento e descrição]
- ...

## Instruções de Uso

### Executar o banco de dados
1. Clone este repositório
2. Execute o arquivo `database/schema.sql` em seu SGBD
3. Verifique a criação das tabelas e dados de exemplo

### Queries de exemplo
[Incluir 2-3 exemplos de queries úteis]

## Decisões de Design
[Explicar decisões importantes, como normalização, índices, etc.]

## Melhorias Futuras
[Sugestões de expansão do projeto]
```

## 📊 Critérios de Avaliação

| Critério | Peso |
|----------|------|
| Qualidade do Diagrama ER | 20% |
| Implementação SQL (DDL/DML) | 30% |
| Boas práticas e normalização | 20% |
| Apresentação e clareza | 15% |
| Documentação (README) | 10% |
| Criatividade e complexidade | 5% |

## 🚨 Observações Importantes

1. **Plágio**: Trabalhos copiados receberão nota zero
2. **Atraso**: Não serão aceitas entregas após o dia 03/12
3. **Link do GitHub**: Enviar o link do repositório até **02/12 às 23:59** via [plataforma/email]
4. **Presença**: Todos os membros do grupo devem estar presentes na apresentação

## 💡 Dicas para Sucesso

- Comece pelo diagrama antes de escrever SQL
- Teste todas as queries antes da apresentação
- Use dados realistas nos exemplos
- Pratique a apresentação com o grupo
- Prepare-se para responder perguntas sobre suas escolhas de design

## 📚 Recursos Úteis

- [Documentação MySQL](https://dev.mysql.com/doc/)
- [Tutorial de Normalização](https://www.1keydata.com/database-normalization/)
- [Guia de Markdown](https://www.markdownguide.org/)
- [dbdiagram.io](https://dbdiagram.io/) - Ferramenta online para diagramas ER

---

**Dúvidas?** Entre em contato via Google Classroom, Discord ou email.

Bom trabalho! 🚀