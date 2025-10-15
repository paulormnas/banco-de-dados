# Estudo Dirigido 2 - Docker

## Objetivo

Este estudo dirigido tem como objetivo introduzir os conceitos fundamentais do Docker e containerização através de tarefas práticas. Ao final, você será capaz de criar containers, trabalhar com imagens, configurar bancos de dados usando Docker e gerenciar aplicações containerizadas usando Docker Compose.

## 📋 Entregável do Estudo Dirigido

**O que deve ser entregue:** Um repositório público no GitHub contendo todos os arquivos Docker (Dockerfiles, docker-compose.yml, scripts) e commits realizados durante a execução das tarefas deste estudo dirigido.

**Critérios de avaliação:**

- ✅ Repositório criado com nome correto: `estudo-docker-containers`
- ✅ Histórico de commits bem documentado (mínimo 6 commits ao longo das tarefas)
- ✅ Mensagens de commit claras e descritivas
- ✅ Dockerfile funcional criado
- ✅ Arquivo docker-compose.yml configurado corretamente
- ✅ Scripts de configuração de banco de dados
- ✅ Documentação completa (README.md com instruções de uso)
- ✅ Evidências de containers funcionando (screenshots ou logs nos commits)

**Como entregar:**

1. Ao final de todas as tarefas, copie a URL do seu repositório do GitHub
2. Exemplo: `https://github.com/seu-usuario/estudo-docker-containers`
3. Envie esta URL conforme orientações do professor

**⚠ Importante:**

- Mantenha o repositório público para permitir a avaliação
- Cada tarefa deve resultar em pelo menos um commit
- Documente suas alterações com mensagens de commit descritivas
- Inclua prints ou logs que comprovem o funcionamento dos containers

**💡 Dica de Sucesso:** Este estudo dirigido simula um ambiente real de desenvolvimento. Containers bem configurados e documentados demonstram competência técnica muito valorizada no mercado de trabalho.

## Configuração do Docker por Sistema Operacional

Antes de começar as tarefas práticas, é necessário instalar o Docker em sua máquina. Siga as instruções específicas para seu sistema operacional:

### 🪟 Windows

**Instalação - Opção 1 (Docker Desktop - Recomendado):**

1. **Verifique os requisitos:**
    
    - Windows 10 64-bit: Pro, Enterprise, ou Education (Build 19041 ou superior)
    - OU Windows 11 64-bit
    - Virtualização habilitada no BIOS
    - WSL 2 instalado
2. **Sobre o WSL 2:** O WSL (Windows Subsystem for Linux) é uma tecnologia da Microsoft que permite executar um ambiente Linux dentro do Windows. O Docker Desktop usa o WSL 2 para executar containers de forma mais eficiente no Windows.
    
3. **Habilitando a Virtualização no BIOS:** A virtualização precisa estar habilitada no BIOS/UEFI do seu computador. Como cada modelo de computador tem um BIOS diferente:
    
    - Procure no Google: "como habilitar virtualização [marca e modelo do seu computador]"
    - Exemplo de busca: "como habilitar virtualização Dell Inspiron 15 3000"
    - Geralmente é necessário entrar no BIOS (tecla F2, F12, Delete durante a inicialização) e procurar por opções como "Intel VT-x", "AMD-V", "Virtualization Technology" ou "SVM Mode"
4. **Instale o WSL 2 (se não tiver):**
    
    ```bash
    # Execute no PowerShell como Administrador
    wsl --install
    ```
    
    - Reinicie o computador após a instalação
5. **Baixe e instale o Docker Desktop:**
    
    - Acesse: https://www.docker.com/products/docker-desktop
    - Clique em "Download for Windows"
    - Execute o arquivo baixado (.exe)
    - Durante a instalação, mantenha marcada a opção "Use WSL 2 instead of Hyper-V"
6. **Configuração inicial:**
    
    - Abra o Docker Desktop
    - Complete o tutorial inicial (opcional)
    - Aceite os termos de uso
7. **Verificando a instalação:**
    
    ```bash
    # Execute no PowerShell ou Prompt de Comando
    docker --version
    docker run hello-world
    ```
    

**Instalação - Opção 2 (Apenas para Windows Home):** Se você tem Windows Home e não conseguir instalar o Docker Desktop, use Docker Toolbox (versão legacy):

- Acesse: https://github.com/docker/toolbox/releases
- Baixe a versão mais recente do DockerToolbox

**Abrindo o terminal:**

- Use PowerShell (Recomendado)
- Ou use o Prompt de Comando (cmd)
- Ou use Windows Terminal (se instalado)

### 🐧 Linux (Ubuntu/Debian)

**Instalação:**

1. **Atualize os pacotes:**
    
    ```bash
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    ```
    
2. **Adicione a chave GPG oficial do Docker:**
    
    ```bash
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
    ```
    
3. **Adicione o repositório do Docker:**
    
    ```bash
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
	  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
    ```
    
4. **Instale o Docker:**
    
    ```bash
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    ```
    
5. **Configure permissões (para não usar sudo):**
    
    ```bash
    sudo usermod -aG docker $USER
    ```
    
    - **Importante:** Faça logout e login novamente para aplicar as mudanças
6. **Verificando a instalação:**
    
    ```bash
    docker --version
    docker run hello-world
    ```
    

**Para outras distribuições Linux:**

- **CentOS/RHEL/Fedora:** Use `yum` ou `dnf` seguindo documentação oficial
- **Arch Linux:** `sudo pacman -S docker docker-compose`

**Abrindo o terminal:**

- Use o Terminal do sistema (Ctrl + Alt + T)

### 🍎 macOS

**Opção 1 - Docker Desktop (Recomendado):**

1. **Verifique os requisitos:**
    
    - macOS 10.15 ou superior
    - Hardware: Mac 2010 ou mais recente
2. **Baixe e instale:**
    
    - Acesse: https://www.docker.com/products/docker-desktop
    - Clique em "Download for Mac"
    - Arraste o Docker.app para Applications
    - Abra o Docker Desktop e siga o setup inicial

**Opção 2 - Homebrew:**

1. **Instale o Homebrew (se não tiver):**
    
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
    
2. **Instale o Docker:**
    
    ```bash
    brew install --cask docker
    ```
    

**Verificando a instalação:**

```bash
docker --version
docker run hello-world
```

**Abrindo o terminal:**

- Use o Terminal (Applications > Utilities > Terminal)
- Ou pressione Cmd + Space e digite "Terminal"

### ⚙ Configuração Pós-Instalação (Todos os Sistemas)

**Teste se tudo está funcionando:**

```bash
# Verificar versão
docker --version

# Testar instalação
docker run hello-world

# Verificar se Docker Compose está disponível
docker compose version
```

### 🔧 Solução de Problemas Comuns

**Windows:**

- Se aparecer erro "Docker Desktop requires a newer WSL kernel version", atualize o WSL
- Se o Docker não inicializar, verifique se a virtualização está habilitada no BIOS

**Linux:**

- Se aparecer erro de permissão, certifique-se de ter executado `sudo usermod -aG docker $USER`
- Reinicie o serviço: `sudo systemctl restart docker`

**macOS:**

- Se o Docker não inicializar, verifique se há espaço suficiente no disco
- Algumas vezes é necessário reiniciar o Mac após a primeira instalação

### 💡 Dicas Importantes

- **Recursos do Sistema:** Docker usa recursos significativos (RAM, CPU). Configure limites no Docker Desktop se necessário
- **Atualizações:** Mantenha o Docker sempre atualizado para melhor performance e segurança
- **Documentação:** Sempre consulte a documentação oficial em caso de problemas: https://docs.docker.com/

---

## Tarefa 1 - Configuração Inicial e Primeiro Container

**Objetivo:** Configurar o ambiente de trabalho e executar seu primeiro container Docker.

**Passos:**

1. **Verifique se o Docker está funcionando:**
    
```bash
docker --version
docker run hello-world
```
    
2. **Crie o repositório no GitHub:**
    
    - Acesse https://github.com
    - Clique em "New repository"
    - Nome do repositório: `estudo-docker-containers`
    - Descrição: "Estudo dirigido sobre Docker e containerização"
    - Marque "Public" ⚠ **OBRIGATÓRIO para avaliação**
    - Marque "Add a README file"
    - Clique em "Create repository"
3. **Clone o repositório para sua máquina:**
    
```bash
git clone https://github.com/seu-usuario/estudo-docker-containers.git
cd estudo-docker-containers
```
    
4. **Crie a estrutura inicial do projeto:**
    
```bash
mkdir containers
mkdir compose
mkdir scripts
```
    
5. **Atualize o README.md:** Edite o arquivo README.md e substitua pelo conteúdo:
    
```markdown
# Estudo Docker - Containers

## Sobre
Este repositório documenta meu aprendizado sobre Docker e containerização.

**Autor:** [Seu Nome]
**Curso:** [Nome do seu Curso Técnico]
**Disciplina:** [Nome da Disciplina]
**Data:** [Data Atual]

## O que estou aprendendo
- Conceitos fundamentais do Docker
- Como criar e gerenciar containers
- Trabalhar com imagens Docker
- Configurar bancos de dados em containers
- Usar Docker Compose para aplicações multi-container

## Estrutura do Projeto
- `containers/` - Dockerfiles e configurações de containers
- `compose/` - Arquivos docker-compose.yml
- `scripts/` - Scripts de configuração e inicialização
- `README.md` - Este arquivo de documentação

## Status do Estudo
- [ ] Tarefa 1 - Primeiro container
- [ ] Tarefa 2 - Container personalizado
- [ ] Tarefa 3 - Banco de dados
- [ ] Tarefa 4 - Docker Compose
- [ ] Tarefa 5 - Aplicação completa
```
    
6. **Teste containers básicos e documente:** Crie um arquivo `containers/comandos-docker.txt`:
    
```
# Comandos Docker Aprendidos

## Comandos Básicos
docker --version          # Mostra versão do Docker
docker run hello-world    # Executa container de teste
docker ps                 # Lista containers em execução
docker ps -a              # Lista todos os containers
docker images             # Lista imagens baixadas
docker pull <imagem>      # Baixa uma imagem
docker rmi <imagem>       # Remove uma imagem
docker rm <container>     # Remove um container

## Primeiro Teste Realizado
Data: [Data Atual]
Comando executado: docker run hello-world
Resultado: Container executou com sucesso!
```
    
7. **Teste um container interativo:** Execute e documente:
    
```bash
# Execute este comando para testar um container Ubuntu interativo
docker run -it ubuntu:latest /bin/bash
```
    
    Dentro do container, execute alguns comandos:
    
```bash
ls -la
cat /etc/os-release
exit
```
    
8. **Documente a experiência:** Adicione no arquivo `comandos-docker.txt`:
    
```
## Container Interativo Testado
docker run -it ubuntu:latest /bin/bash  # Executa Ubuntu interativo
- Consegui executar comandos dentro do container
- O container tem seu próprio sistema de arquivos
- Ao sair com 'exit', o container para
```
    
9. **Evidencie seu avanço com um printscreen do container:**
   
   Crie um novo diretório na raiz do seu projeto com o nome `evidencias` e coloque o print do seu container com o nome `tarefa1`.
   
10. **Faça o primeiro commit (COMMIT 1 do entregável):**
    
```bash
git add .
git commit -m "Tarefa 1: Configuração inicial e primeiro teste com Docker"
git push origin main
```
    

---

## Tarefa 2 - Criando um Container Personalizado com Dockerfile

**Objetivo:** Aprender a criar imagens personalizadas usando Dockerfile.

**Passos:**

1. **Crie uma aplicação web simples:** Crie o arquivo `containers/index.html`:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Minha Aplicação Docker</title>
	<style>
		body { 
			font-family: Arial, sans-serif; 
			background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
			margin: 0; 
			padding: 50px;
			color: white;
			text-align: center;
		}
		.container { 
			background: rgba(255,255,255,0.1); 
			padding: 30px; 
			border-radius: 15px;
			backdrop-filter: blur(10px);
		}
		h1 { color: #fff; margin-bottom: 20px; }
		.info { background: rgba(0,0,0,0.2); padding: 15px; border-radius: 8px; margin: 10px 0; }
	</style>
</head>
<body>
	<div class="container">
		<h1>🐳 Minha Aplicação Docker</h1>
		<div class="info">
			<strong>Autor:</strong> [Seu Nome]
		</div>
		<div class="info">
			<strong>Curso:</strong> [Seu Curso]
		</div>
		<div class="info">
			<strong>Status:</strong> Aplicação rodando em container Docker!
		</div>
		<div class="info">
			<strong>Servidor:</strong> Nginx
		</div>
		<div class="info">
			<strong>Data:</strong> <span id="data"></span>
		</div>
	</div>
	
	<script>
		document.getElementById('data').textContent = new Date().toLocaleString('pt-BR');
	</script>
</body>
</html>
```
    
2. **Crie seu primeiro Dockerfile:** Crie o arquivo `containers/Dockerfile`:
    
```dockerfile
# Usando uma imagem base do Nginx
FROM nginx:alpine

# Informações sobre o criador (substitua pelos seus dados)
LABEL maintainer="seu.email@exemplo.com"
LABEL description="Minha primeira aplicação web em Docker"
LABEL version="1.0"

# Copia o arquivo HTML para o diretório padrão do Nginx
COPY index.html /usr/share/nginx/html/

# Informa que o container usará a porta 80
EXPOSE 80

# Comando padrão (já definido na imagem base do Nginx)
CMD ["nginx", "-g", "daemon off;"]
```
    
3. **Construa a imagem personalizada:**
    
```bash
cd containers
docker build -t minha-webapp:1.0 .
```
    
4. **Execute seu container personalizado:**
    
```bash
docker run -d -p 8080:80 --name meu-site minha-webapp:1.0
```
    
5. **Teste a aplicação:**
    
    - Abra o navegador
    - Acesse: http://localhost:8080
    - Tire um screenshot da aplicação funcionando
    - Salve o screenshot como `containers/screenshot-webapp.png`
6. **Verifique containers e imagens:**
    
```bash
docker ps          # Veja seu container rodando
docker images      # Veja sua imagem criada
docker logs meu-site  # Veja os logs do container
```
    
7. **Documente os novos comandos:** Atualize o arquivo `containers/comandos-docker.txt`:
    
```
## Dockerfile e Imagens Personalizadas
docker build -t <nome>:<tag> .    # Constrói imagem a partir do Dockerfile
docker run -d -p <host>:<container> --name <nome> <imagem>  # Executa container em background
docker logs <container>           # Mostra logs do container
docker stop <container>           # Para um container
docker start <container>          # Inicia um container parado
docker exec -it <container> /bin/sh  # Acessa container em execução

## Primeira Aplicação Web
- Criada aplicação HTML simples
- Dockerfile usando Nginx como base
- Container acessível em http://localhost:8080
- Screenshot salvo: screenshot-webapp.png
```
    
8. **Evidencie seu avanço com um printscreen da aplicação:**
   
   Dentro do diretório `evidencias`, adicione seu novo print da aplicação rodando com o nome `tarefa2`.
   
9. **Pare o container e faça commit (COMMIT 2 do entregável):
  
```bash
docker stop meu-site
cd ..
git add .
git commit -m "Tarefa 2: Cria primeira aplicação web com Dockerfile personalizado"
git push origin main
```
    

---

## Tarefa 3 - Configurando Banco de Dados em Container

**Objetivo:** Aprender a trabalhar com bancos de dados em containers Docker.

**Passos:**

1. **Crie um container MySQL:**
    
```bash
docker run -d \
  --name mysql-estudos \
  -e MYSQL_ROOT_PASSWORD=senha123 \
  -e MYSQL_DATABASE=escola \
  -e MYSQL_USER=aluno \
  -e MYSQL_PASSWORD=aluno123 \
  -p 3306:3306 \
  mysql:8.0
```
    
2. **Crie scripts de inicialização do banco:** Crie o arquivo `scripts/criar-tabelas.sql`:
    
```sql
-- Script de criação de tabelas para o banco escola
USE escola;

-- Tabela de estudantes
CREATE TABLE IF NOT EXISTS estudantes (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	curso VARCHAR(50) NOT NULL,
	data_matricula DATE NOT NULL,
	ativo BOOLEAN DEFAULT TRUE
);

-- Tabela de disciplinas
CREATE TABLE IF NOT EXISTS disciplinas (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	codigo VARCHAR(20) UNIQUE NOT NULL,
	carga_horaria INT NOT NULL,
	professor VARCHAR(100)
);

-- Tabela de notas
CREATE TABLE IF NOT EXISTS notas (
	id INT AUTO_INCREMENT PRIMARY KEY,
	estudante_id INT,
	disciplina_id INT,
	nota DECIMAL(5,2),
	data_avaliacao DATE,
	FOREIGN KEY (estudante_id) REFERENCES estudantes(id),
	FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);

-- Inserindo dados de exemplo
INSERT INTO estudantes (nome, email, curso, data_matricula) VALUES
('Ana Silva', 'ana@exemplo.com', 'Informática', '2024-02-01'),
('João Santos', 'joao@exemplo.com', 'Informática', '2024-02-01'),
('Maria Oliveira', 'maria@exemplo.com', 'Administração', '2024-02-15');

INSERT INTO disciplinas (nome, codigo, carga_horaria, professor) VALUES
('Programação Web', 'PROG001', 80, 'Prof. Carlos'),
('Banco de Dados', 'BD001', 60, 'Prof. Ana'),
('Sistemas Operacionais', 'SO001', 70, 'Prof. Roberto');

INSERT INTO notas (estudante_id, disciplina_id, nota, data_avaliacao) VALUES
(1, 1, 8.5, '2024-03-15'),
(1, 2, 9.0, '2024-03-20'),
(2, 1, 7.5, '2024-03-15'),
(3, 3, 8.0, '2024-03-25');

-- Verificar dados inseridos
SELECT 'Dados inseridos com sucesso!' as status;
```
    
3. **Aguarde o MySQL inicializar e execute o script:**
    
```bash
# Aguarde alguns segundos para o MySQL estar pronto
docker logs mysql-estudos

# Execute o script dentro do container
docker exec -i mysql-estudos mysql -u aluno -paluno123 escola < scripts/criar-tabelas.sql
```
    
4. **Teste conexões com o banco:**
    
```bash
# Conectar ao MySQL dentro do container
docker exec -it mysql-estudos mysql -u aluno -paluno123 escola
```
    
    Dentro do MySQL, execute algumas consultas uma por uma. NÃO copie e cole todas as linhas de uma vez:
    
```sql
SHOW TABLES;
SELECT * FROM estudantes;
SELECT e.nome, d.nome as disciplina, n.nota 
FROM estudantes e 
JOIN notas n ON e.id = n.estudante_id 
JOIN disciplinas d ON n.disciplina_id = d.id;
exit
```
    
5. **Crie script de backup:** Crie o arquivo `scripts/backup-banco.sh`:
    
```bash
#!/bin/bash
# Script para fazer backup do banco de dados MySQL

echo "Iniciando backup do banco de dados..."

# Criar diretório de backup se não existir
mkdir -p backups

# Nome do arquivo de backup com timestamp
BACKUP_FILE="backups/backup-escola-$(date +%Y%m%d-%H%M%S).sql"

# Executar backup
docker exec mysql-estudos mysqldump -u aluno -p aluno123 escola > $BACKUP_FILE

echo "Backup concluído: $BACKUP_FILE"

# Listar backups existentes
echo "Backups disponíveis:"
ls -la backups/
```
    
6. **Crie script para monitoramento do MySQL:** Crie o arquivo `scripts/monitorar-mysql.sh`:
    
```bash
#!/bin/bash
# Script para monitorar o container MySQL

echo "=== Status do Container MySQL ==="
docker ps -f name=mysql-estudos

echo ""
echo "=== Uso de Recursos ==="
docker stats mysql-estudos --no-stream

echo ""
echo "=== Últimas 10 linhas do log ==="
docker logs mysql-estudos --tail 10

echo ""
echo "=== Testando Conexão ==="
docker exec mysql-estudos mysql -u aluno -paluno123 -e "SELECT 'Conexão OK!' as status;"

echo ""
echo "=== Espaço em Disco do Container ==="
docker exec mysql-estudos df -h
```
    
7. **Torne os scripts executáveis e teste:**
    
```bash
chmod +x scripts/backup-banco.sh
chmod +x scripts/monitorar-mysql.sh
./scripts/backup-banco.sh
./scripts/monitorar-mysql.sh
```
    
8. **Evidencie seu avanço com um printscreen do log gerado no terminal:**
   
   Dentro do diretório `evidencias`, adicione um novo print do log gerado pelos scripts com o nome `tarefa3`.
   
9. **Documente o trabalho com bancos:** Crie o arquivo `containers/bancos-de-dados.md`:
    
````markdown
# Bancos de Dados em Docker

## MySQL Container
- **Imagem:** mysql:8.0
- **Porta:** 3306
- **Banco:** escola
- **Usuário:** aluno / senha: aluno123

## Scripts Criados
- `scripts/criar-tabelas.sql` - Estrutura do banco
- `scripts/backup-banco.sh` - Script de backup

## Comandos Úteis MySQL

# Conectar ao MySQL
`docker exec -it mysql-estudos mysql -u aluno -paluno123 escola`

# Ver logs do container
`docker logs mysql-estudos`

# Fazer backup
`./scripts/backup-banco.sh`

# Parar o container MySQL
`docker stop mysql-estudos`

# Iniciar o container MySQL novamente
`docker start mysql-estudos`

# Remover o container (CUIDADO: apaga dados!)
`docker rm mysql-estudos`
````
    
10. **Faça commit (COMMIT 3 do entregável):**
    
```bash
git add .
git commit -m "Tarefa 3: Configura banco MySQL em container com scripts e backup"
git push origin main
```
    

---

## Tarefa 4 - Docker Compose para Aplicações Multi-Container

**Objetivo:** Aprender a usar o Docker Compose para definir e gerenciar aplicações compostas por múltiplos containers, como uma aplicação web e um banco de dados, de forma declarativa e simplificada.

**Introdução ao Docker Compose:**

Até agora, usamos o comando `docker run` para iniciar cada container individualmente. Isso funciona bem para um ou dois containers, mas se torna complexo quando uma aplicação depende de vários serviços (web, banco de dados, cache, etc.). O **Docker Compose** é uma ferramenta que resolve esse problema, permitindo que você configure todos os serviços da sua aplicação em um único arquivo chamado `docker-compose.yml`. Com um único comando, você pode iniciar, parar e gerenciar todo o ambiente.

**Passos:**

1.  **Pare e remova os containers das tarefas anteriores:** Para evitar conflitos de portas e nomes, vamos começar com um ambiente limpo.

```bash
# Pare e remova os containers que criamos anteriormente (se ainda existirem)
docker stop meu-site mysql-estudos
docker rm meu-site mysql-estudos
```

2.  **Crie a aplicação web que conecta ao banco:** A aplicação será um sistema simples em Python com Flask para listar e adicionar estudantes. Crie o arquivo `compose/app.py`:

```python
from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import os
import time

app = Flask(__name__)

# Função para aguardar o banco de dados estar pronto
def get_db_connection():
	retries = 10
	while retries > 0:
		try:
			conn = mysql.connector.connect(
				host=os.getenv('DB_HOST', 'db'), # O nome do serviço no docker-compose
				user=os.getenv('DB_USER', 'aluno'),
				password=os.getenv('DB_PASSWORD', 'aluno123'),
				database=os.getenv('DB_NAME', 'escola')
			)
			return conn
		except mysql.connector.Error as err:
			print(f"Erro ao conectar ao banco de dados: {err}")
			retries -= 1
			time.sleep(3) # Espera 3 segundos antes de tentar novamente
	return None

@app.route('/')
def index():
	conn = get_db_connection()
	if conn is None:
		return "<h1>Erro: Não foi possível conectar ao banco de dados.</h1><p>Verifique os logs do container da aplicação.</p>", 500

	try:
		cursor = conn.cursor(dictionary=True)
		
		# Buscar estudantes
		cursor.execute("SELECT * FROM estudantes ORDER BY id DESC")
		estudantes = cursor.fetchall()
		
		return render_template('index.html', estudantes=estudantes)
	except Exception as e:
		return f"<h1>Erro ao consultar o banco de dados:</h1><p>{str(e)}</p>"
	finally:
		if conn.is_connected():
			cursor.close()
			conn.close()

@app.route('/adicionar', methods=['POST'])
def adicionar_estudante():
	nome = request.form['nome']
	email = request.form['email']
	curso = request.form['curso']
	
	conn = get_db_connection()
	if conn is None:
		return "<h1>Erro: Não foi possível conectar ao banco de dados para inserção.</h1>", 500

	try:
		cursor = conn.cursor()
		
		cursor.execute(
			"INSERT INTO estudantes (nome, email, curso, data_matricula) VALUES (%s, %s, %s, CURDATE())",
			(nome, email, curso)
		)
		
		conn.commit()
		return redirect(url_for('index'))
	except Exception as e:
		return f"<h1>Erro ao adicionar estudante:</h1><p>{str(e)}</p>"
	finally:
		if conn.is_connected():
			cursor.close()
			conn.close()

if __name__ == '__main__':
	app.run(host='0.0.0.0', port=8000, debug=True)
```

3.  **Crie o template HTML:** A interface da aplicação. Crie o diretório `compose/templates` e, dentro dele, o arquivo `index.html`:

```html
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sistema Escolar - Docker</title>
	<style>
		body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; margin: 0; padding: 20px; background-color: #f8f9fa; color: #343a40; }
		.container { max-width: 900px; margin: 20px auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
		h1, h2 { color: #0056b3; text-align: center; }
		.form-group { margin-bottom: 15px; }
		.form-group label { display: block; margin-bottom: 5px; font-weight: 600; }
		.form-group input, select { width: 100%; padding: 10px; border: 1px solid #ced4da; border-radius: 5px; box-sizing: border-box; }
		.btn { background: #007bff; color: white; padding: 12px 20px; border: none; border-radius: 5px; cursor: pointer; display: block; width: 100%; font-size: 16px; }
		.btn:hover { background: #0056b3; }
		table { width: 100%; border-collapse: collapse; margin-top: 30px; }
		th, td { border: 1px solid #dee2e6; padding: 12px; text-align: left; }
		th { background-color: #e9ecef; }
		.docker-info { background: #e7f3ff; border-left: 5px solid #007bff; border-radius: 5px; padding: 15px; margin: 25px 0; text-align: center; font-size: 1.1em; }
		.no-data { text-align: center; color: #6c757d; padding: 20px; }
	</style>
</head>
<body>
	<div class="container">
		<h1>🐳 Sistema Escolar com Docker Compose</h1>
		
		<div class="docker-info">
			<strong>Aplicação Python (Flask) + MySQL</strong><br>
			Orquestrada com Docker Compose!
		</div>

		<h2>Adicionar Novo Estudante</h2>
		<form method="POST" action="/adicionar">
			<div class="form-group">
				<label for="nome">Nome:</label>
				<input type="text" id="nome" name="nome" required>
			</div>
			<div class="form-group">
				<label for="email">E-mail:</label>
				<input type="email" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="curso">Curso:</label>
				<select id="curso" name="curso" required>
					<option value="">Selecione um curso</option>
					<option value="Informática">Informática</option>
					<option value="Administração">Administração</option>
					<option value="Eletrônica">Eletrônica</option>
					<option value="Mecânica">Mecânica</option>
				</select>
			</div>
			<button type="submit" class="btn">Adicionar Estudante</button>
		</form>

		<h2>Lista de Estudantes Matriculados</h2>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Nome</th>
					<th>E-mail</th>
					<th>Curso</th>
					<th>Data Matrícula</th>
				</tr>
			</thead>
			<tbody>
				{% for estudante in estudantes %}
				<tr>
					<td>{{ estudante.id }}</td>
					<td>{{ estudante.nome }}</td>
					<td>{{ estudante.email }}</td>
					<td>{{ estudante.curso }}</td>
					<td>{{ estudante.data_matricula }}</td>
				</tr>
				{% else %}
				<tr>
					<td colspan="5" class="no-data">Nenhum estudante cadastrado ainda.</td>
				</tr>
				{% endfor %}
			</tbody>
		</table>
	</div>
</body>
</html>
```

4.  **Crie o Dockerfile para a aplicação web:** Este arquivo define como a imagem da nossa aplicação Python será construída. Crie o arquivo `compose/Dockerfile`:

```dockerfile
# Usar uma imagem base oficial do Python
FROM python:3.9-slim

# Definir o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo de dependências e instalar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o restante dos arquivos da aplicação
COPY . .

# Expor a porta que a aplicação Flask usa
EXPOSE 5000

# Comando para iniciar a aplicação
CMD ["python", "app.py"]
```

5.  **Crie o arquivo de dependências:** Liste as bibliotecas Python que a aplicação precisa. Crie o arquivo `compose/requirements.txt`:

```
Flask
mysql-connector-python
```

6.  **Crie o arquivo Docker Compose:** Esta é a parte principal. O `docker-compose.yml` vai definir os dois serviços (`app` e `db`), como eles se conectam e quais volumes usar. Crie o arquivo `compose/docker-compose.yml`:

```yaml
# Versão da especificação do Docker Compose
version: '3.8'

# Definição dos serviços (containers)
services:
  # Serviço da aplicação web (Python/Flask)
  app:
    # Constrói a imagem a partir do Dockerfile no diretório atual (.)
    build: .
    container_name: app-escola
    # Mapeia a porta 5000 do host para a porta 5000 do container
    ports:
      - "8000:8000"
    # Define as variáveis de ambiente que a aplicação usará para conectar ao banco
    environment:
      DB_HOST: db # Usa o nome do serviço 'db' para se conectar
      DB_USER: aluno
      DB_PASSWORD: aluno123
      DB_NAME: escola
    # Garante que o serviço 'db' será iniciado antes do serviço 'app'
    depends_on:
      - db
    restart: on-failure

  # Serviço do banco de dados (MySQL)
  db:
    image: mysql:8.0
    container_name: db-escola
    # Variáveis de ambiente para configurar o MySQL
    environment:
      MYSQL_ROOT_PASSWORD: senha123
      MYSQL_DATABASE: escola
      MYSQL_USER: aluno
      MYSQL_PASSWORD: aluno123
    # Monta um volume nomeado para persistir os dados do banco
    volumes:
      - db_data:/var/lib/mysql
      # Monta o script SQL para inicializar o banco na primeira vez
      - ../scripts/criar-tabelas.sql:/docker-entrypoint-initdb.d/init.sql
    restart: always

# Definição dos volumes nomeados
volumes:
  db_data:
```

7.  **Suba a aplicação com Docker Compose:** Navegue até o diretório `compose` e use um único comando para construir as imagens e iniciar os containers.

```bash
cd compose
docker compose up --build -d
```
    *   `up`: Cria e inicia os containers.
    *   `--build`: Força a reconstrução da imagem da aplicação (`app`).
    *   `-d`: Executa em modo "detached" (em segundo plano).

8.  **Verifique o status e teste:**

    *   **Verifique os containers:**
        ```bash
        docker compose ps
        ```
        Você deve ver os dois containers (`app-escola` e `db-escola`) em execução.
    *   **Teste no navegador:**
        - Abra seu navegador e acesse: `http://localhost:8000`
        - Você verá a aplicação rodando, já com os dados iniciais que o script `criar-tabelas.sql` inseriu.
        - Adicione um novo estudante pelo formulário para testar a funcionalidade de escrita no banco.
        - **Tire um screenshot** da aplicação funcionando com os dados listados e salve como `compose/screenshot-compose-app.png`.

9.  **Explore os comandos do Docker Compose:**

    ```bash
    # Ver os logs da aplicação
    docker compose logs app

    # Ver os logs do banco de dados (útil para depuração)
    docker compose logs db

    # Para parar todos os serviços
    docker compose stop

    # Para iniciar novamente
    docker compose start

    # Para parar e remover os containers, redes e volumes
    docker compose down
    ```

10. **Evidencie seu progresso com um printscreen da aplicação** :
	    
	Neste passo o printscreen deverá ficar dentro do diretório `compose` e com nome `screeshot-compose-app`
	
11. **Documente seu progresso:** Crie um arquivo `compose/documentacao-compose.md` para explicar o que foi feito.

```markdown
# Tarefa 4 - Docker Compose

## O que é Docker Compose?
Docker Compose é uma ferramenta para definir e executar aplicações Docker multi-container. Com um arquivo YAML, configuramos todos os serviços, redes e volumes da aplicação.

## Serviços Criados

1.  **`app` (Aplicação Web):**
	- Construída a partir de um `Dockerfile`.
	- Roda uma aplicação Python/Flask na porta 5000.
	- Conecta-se ao serviço `db` usando o hostname `db`.

2.  **`db` (Banco de Dados):**
	- Usa a imagem `mysql:8.0`.
	- Persiste os dados usando um volume nomeado `db_data`.
	- Executa o script `criar-tabelas.sql` na primeira inicialização para criar a estrutura do banco e inserir dados de exemplo.

## Vantagens observadas
- **Simplicidade:** Um único comando (`docker compose up`) para subir todo o ambiente.
- **Configuração centralizada:** Tudo está definido no arquivo `docker-compose.yml`.
- **Rede interna:** Os containers se comunicam facilmente usando os nomes dos serviços como hostnames (ex: `app` conecta a `db`).
- **Reprodutibilidade:** Qualquer pessoa com Docker pode clonar o repositório e recriar o mesmo ambiente de desenvolvimento.

## Screenshot
![Aplicação rodando com Docker Compose](screenshot-compose-app.png)
```

	🚨🚨 Verifique se a extensão do seu print (jpg, png, gif, etc) corresponde a que está na última linha do arquivo README.md. Caso a extensão seja diferente, a imagem não será renderizada no Github.
	
11. **Faça o commit (COMMIT 4 do entregável):**

```bash
# Volte para a raiz do projeto
cd ..

# Adicione todos os novos arquivos
git add .

# Faça o commit
git commit -m "Tarefa 4: Orquestra aplicação Flask e MySQL com Docker Compose"

# Envie para o GitHub
git push origin main
```

----------------------------

## Conclusão

Você chegou ao final das tarefas práticas deste estudo dirigido! Agora você tem uma base sólida sobre como utilizar Docker para criar, gerenciar e orquestrar ambientes de desenvolvimento containerizados, uma habilidade essencial no mercado de tecnologia atual.

### 🚀 Comandos Importantes para Lembrar

Esta é uma lista rápida dos comandos mais importantes que você utilizou. Mantenha-a como referência:

| Comando                               | Descrição                                                                 |
| ------------------------------------- | ------------------------------------------------------------------------- |
| `docker ps` / `docker ps -a`          | Lista containers em execução / todos os containers.                       |
| `docker images`                       | Lista todas as imagens Docker baixadas localmente.                        |
| `docker build -t nome:tag .`          | Constrói uma imagem a partir de um `Dockerfile`.                          |
| `docker run [opções] <imagem>`        | Executa um comando em um novo container.                                  |
| `docker stop <container>`             | Para um container em execução.                                            |
| `docker rm <container>`               | Remove um container parado.                                               |
| `docker rmi <imagem>`                 | Remove uma imagem.                                                        |
| `docker logs <container>`             | Exibe os logs (saídas) de um container.                                   |
| `docker exec -it <container> <cmd>`   | Executa um comando dentro de um container em execução (ex: `/bin/bash`). |
| `docker compose up --build -d`        | Constrói, (re)cria e inicia os serviços definidos no `docker-compose.yml`. |
| `docker compose down`                 | Para e remove os containers, redes e volumes da aplicação.                |
| `docker compose ps`                   | Lista os containers da aplicação gerenciada pelo Compose.                 |
| `docker compose logs <serviço>`       | Exibe os logs de um serviço específico (ex: `app` ou `db`).               |

### 🤔 Reflexão Final

Após completar todas as tarefas, reserve um momento para refletir sobre o que você aprendeu. Responda (para si mesmo ou em uma seção no seu `README.md`) às seguintes perguntas:

1.  **Qual a principal vantagem de usar containers com Docker em vez de instalar um banco de dados e um servidor web diretamente na sua máquina?**
2.  **Explique com suas palavras o propósito de um `Dockerfile`. Por que ele é tão importante para a reprodutibilidade de ambientes?**
3.  **Em que cenário o Docker Compose se torna essencial? Por que não usar apenas múltiplos comandos `docker run`?**
4.  **Qual a importância dos volumes do Docker (como o que usamos para o banco de dados MySQL)? O que aconteceria com os dados se não usássemos um volume?**
5.  **Como o uso de containers pode facilitar o trabalho em equipe em um projeto de desenvolvimento de software?**

### ✅ Checklist Final do Entregável

Antes de finalizar e enviar o link do seu repositório, faça uma última verificação para garantir que todos os critérios foram atendidos:

-   [ ] O repositório no GitHub tem o nome exato: `estudo-docker-containers`.
-   [ ] O repositório está **público**.
-   [ ] O histórico de commits possui **pelo menos 6 commits** com mensagens claras e descritivas, documentando o progresso ao longo das tarefas.
-   [ ] O arquivo `README.md` na raiz do projeto está preenchido com suas informações.
-   [ ] O `containers/Dockerfile` para a aplicação Nginx foi criado e funciona.
-   [ ] O `compose/docker-compose.yml` está configurado corretamente e orquestra os serviços `app` e `db`.
-   [ ] Os scripts (`criar-tabelas.sql`, `backup-banco.sh`, etc.) estão na pasta `scripts/`.
-   [ ] As evidências (screenshots da aplicação web e da aplicação com Compose) foram adicionadas ao repositório.
-   [ ] Todos os arquivos de documentação (`comandos-docker.txt`, `bancos-de-dados.md`, `documentacao-compose.md`) foram criados e preenchidos.

### 🎉 Parabéns!

Você concluiu o estudo dirigido sobre Docker! Agora você possui um portfólio prático que demonstra sua capacidade de trabalhar com uma das ferramentas mais importantes do ecossistema de desenvolvimento e DevOps. Continue explorando e utilizando containers em seus projetos futuros para fortalecer ainda mais seu conhecimento.

### 📤 Para entregar:

Copie a URL completa do seu repositório do GitHub (ex: `https://github.com/seu-usuario/estudo-docker-containers`) e envie conforme as orientações do professor.