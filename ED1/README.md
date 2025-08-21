# Estudo Dirigido 1 - Git

## Objetivo

Este estudo dirigido tem como objetivo introduzir os conceitos fundamentais do Git e GitHub através de tarefas práticas. Ao final, você será capaz de criar repositórios, fazer commits, trabalhar com branches e colaborar em projetos usando versionamento de código.

---

## 📋 Entregável do Estudo Dirigido

**O que deve ser entregue:** Um repositório público no GitHub contendo todos os arquivos e commits realizados durante a execução das tarefas deste estudo dirigido.

**Critérios de avaliação:**

- ✅ Repositório criado com nome correto: `meu-primeiro-projeto-git`
- ✅ Histórico de commits bem documentado (mínimo 8 commits ao longo das tarefas)
- ✅ Mensagens de commit claras e descritivas
- ✅ Todos os arquivos solicitados nas tarefas presentes no repositório
- ✅ Uso correto de branches (criação, merge e exclusão)
- ✅ Arquivo `.gitignore` configurado adequadamente
- ✅ Documentação completa (README.md atualizado)

**Como entregar:**

1. Ao final de todas as tarefas, copie a URL do seu repositório do GitHub
2. Exemplo: `https://github.com/seu-usuario/meu-primeiro-projeto-git`
3. Envie esta URL conforme orientações do professor

**⚠️ Importante:**

- Mantenha o repositório **público** para permitir a avaliação
- Cada tarefa deve resultar em pelo menos um commit
- Não delete o histórico de commits - ele faz parte da avaliação
- Documente suas alterações com mensagens de commit descritivas

**💡 Dica de Sucesso:** Este não é apenas um exercício técnico, mas também uma demonstração das suas habilidades com Git. Um histórico bem organizado e documentado mostra profissionalismo e boa prática de desenvolvimento.

---

## Configuração do Git por Sistema Operacional

Antes de começar as tarefas práticas, é necessário instalar e configurar o Git em sua máquina. Siga as instruções específicas para seu sistema operacional:

### 🪟 Windows

**Instalação:**

1. **Baixe o Git para Windows**:
    
    - Acesse: https://git-scm.com/download/win
    - Clique em "Download for Windows"
    - Execute o arquivo baixado (.exe)

Durante a instalação, também será automaticamente instalado o Git Bash. Essa é uma ferramenta de terminal que facilita a execução de comandos do git com uma interface similar ao terminal do Linux. O uso Git Bash é recomendado mas não é obrigatório para desenvolver as tarefas, podendo ser substituído pelo Prompt de Comando (cmd) ou Power Shell.

2. **Durante a instalação**:
    
    - Aceite as configurações padrão na maioria das telas
    - **IMPORTANTE:** Na tela "Adjusting your PATH environment", selecione "Git from the command line and also from 3rd-party software"
    - Na tela "Choosing the default editor", você pode manter o Vim ou escolher outro editor se preferir (como Notepad++)
    - Continue clicando "Next" até finalizar
3. **Verificando a instalação**:
    
    - Abra o **Prompt de Comando** (cmd) ou **PowerShell**
    - Digite: `git --version`
    - Deve aparecer algo como: `git version 2.x.x.windows.x`

**Abrindo o terminal:**

- Use o **Git Bash** (instalado junto com o Git) - RECOMENDADO
- Ou use o **Prompt de Comando** (cmd)
- Ou use o **PowerShell**

### 🐧 Linux (Ubuntu/Debian)

**Instalação:**

1. **Atualize os pacotes**:
    
    ```bash
    sudo apt update
    ```
    
2. **Instale o Git**:
    
    ```bash
    sudo apt install git
    ```
    
3. **Verificando a instalação**:
    
    ```bash
    git --version
    ```
    

**Para outras distribuições Linux:**

- **CentOS/RHEL/Fedora**: `sudo yum install git` ou `sudo dnf install git`
- **Arch Linux**: `sudo pacman -S git`

**Abrindo o terminal:**

- Use o **Terminal** do sistema (Ctrl + Alt + T)

### 🍎 macOS

**Opção 1 - Homebrew (Recomendado):**

1. **Instale o Homebrew** (se ainda não tiver):
    
    - Abra o **Terminal**
    - Execute:
        
        ```bash
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ```
        
2. **Instale o Git**:
    
    ```bash
    brew install git
    ```
    

**Opção 2 - Xcode Command Line Tools:**

1. **Abra o Terminal**
2. **Execute**:
    
    ```bash
    xcode-select --install
    ```
    
3. **Siga as instruções** na tela que aparecer

**Opção 3 - Download direto:**

1. **Baixe o Git para Mac**:
    - Acesse: https://git-scm.com/download/mac
    - Baixe e execute o instalador

**Verificando a instalação:**

```bash
git --version
```

**Abrindo o terminal:**

- Use o **Terminal** (Applications > Utilities > Terminal)
- Ou pressione **Cmd + Space** e digite "Terminal"

### ⚙️ Configuração Inicial (Todos os Sistemas)

Após instalar o Git, execute os seguintes comandos no terminal/prompt para configurar suas informações:

```bash
# Configure seu nome (substitua por seu nome real)
git config --global user.name "Seu Nome Completo"

# Configure seu email (use o mesmo email do GitHub)
git config --global user.email "seu.email@exemplo.com"

# Configure o editor padrão (opcional)
git config --global core.editor "code --wait"  # Para VS Code
# ou
git config --global core.editor "notepad"      # Para Notepad (Windows)
# ou mantenha o padrão (Vim)

# Configure a branch padrão como 'main'
git config --global init.defaultBranch main

# Verificar as configurações
git config --list
```

### 🔧 Testando a Configuração

Execute este comando para verificar se tudo está funcionando:

```bash
git config --get user.name
git config --get user.email
```

Deve retornar o nome e email que você configurou.

### 💡 Dicas Importantes

- **Windows**: Recomendamos usar o **Git Bash** para ter uma experiência similar ao Linux/Mac
- **Todos os sistemas**: Use sempre o mesmo email que você usará no GitHub
- **Editores**: Se você usa VS Code, a configuração `git config --global core.editor "code --wait"` facilitará a edição de mensagens de commit
- **Problemas**: Se algum comando não funcionar, verifique se o Git está instalado corretamente executando `git --version`

---

## Tarefa 1 - Configuração Inicial do Git e Criação do Primeiro Repositório

**Objetivo:** Configurar o Git na sua máquina e criar seu primeiro repositório no GitHub.

### Passos:

1. **Verifique se o Git está configurado corretamente**:
    
    ```bash
    git config --get user.name
    git config --get user.email
    ```
    
    Se não estiver configurado, volte à seção "Configuração do Git por Sistema Operacional"
    
2. **Crie uma conta no GitHub** (caso ainda não tenha):
    
    - Acesse https://github.com
    - Clique em "Sign up" e complete o cadastro
3. **Crie um repositório público no GitHub**:
    
    - Clique no botão "New repository" (botão verde)
    - Nome do repositório: `meu-primeiro-projeto-git`
    - Descrição: "Repositório para aprender Git - Estudo Dirigido"
    - Marque a opção "Public" ⚠️ **OBRIGATÓRIO para avaliação**
    - Marque a opção "Add a README file"
    - Clique em "Create repository"
4. **Documente a criação do repositório**:
    
    - Após criar o repositório, você já terá seu primeiro commit automático (Initial commit)
    - Este commit será visível no histórico e conta para o entregável
5. **Clone o repositório para sua máquina**:
    
    - Copie a URL do repositório (botão verde "Code")
    - No terminal, navegue até a pasta onde deseja salvar o projeto
    - Execute: `git clone https://github.com/seu-usuario/meu-primeiro-projeto-git.git`
    - Entre na pasta: `cd meu-primeiro-projeto-git`

---

## Tarefa 2 - Modificando Arquivos e Fazendo Seu Primeiro Commit

**Objetivo:** Aprender a modificar arquivos, usar a área de staging e fazer commits.

### Passos:

1. **Edite o arquivo README.md**:
    
    - Abra o arquivo README.md em um editor de texto
    - Substitua o conteúdo pelo seguinte:
        
        ```markdown
        # Meu Primeiro Projeto Git## SobreEste repositório foi criado para aprender os conceitos básicos do Git.**Autor:** [Seu Nome]**Curso:** [Nome do seu Curso Técnico]**Disciplina:** [Nome da Disciplina]**Data:** [Data Atual]## O que estou aprendendo- Comandos básicos do Git- Como fazer commits- Como trabalhar com repositórios remotos
        ```
        
2. **Crie um arquivo de exemplo**:
    
    - Crie um arquivo chamado `comandos-git.txt`
    - Adicione o seguinte conteúdo:
        
        ```
        Lista de Comandos Git Aprendidos:git init - Inicializa um repositório Gitgit clone - Clona um repositório remotogit add - Adiciona arquivos à área de staginggit commit - Confirma as alterações no repositório localgit status - Mostra o status dos arquivos
        ```
        
3. **Verifique o status do repositório**:
    
    - Execute: `git status`
    - Observe quais arquivos foram modificados
4. **Adicione os arquivos à área de staging**:
    
    - Execute: `git add README.md`
    - Execute: `git add comandos-git.txt`
    - Ou use: `git add .` (adiciona todos os arquivos modificados)
5. **Faça o commit das alterações** (**COMMIT 1** do entregável):
    
    - Execute: `git commit -m "Tarefa 1: Atualiza README e adiciona lista de comandos Git"`
6. **Envie as alterações para o GitHub**:
    
    - Execute: `git push origin main`
7. **Verifique no GitHub**:
    
    - Acesse seu repositório no navegador
    - Confirme que os arquivos foram atualizados
    - Observe que agora você tem 2 commits no histórico (Initial commit + seu primeiro commit)

---

## Tarefa 3 - Trabalhando com Branches (Ramificações)

**Objetivo:** Aprender a criar e trabalhar com branches para desenvolvimento de funcionalidades.

### Passos:

1. **Crie uma nova branch**:
    
    - Execute: `git branch nova-funcionalidade`
    - Execute: `git checkout nova-funcionalidade`
    - Ou use o comando combinado: `git checkout -b nova-funcionalidade`
2. **Verifique em qual branch você está**:
    
    - Execute: `git branch` (a branch atual aparece com asterisco)
3. **Crie um novo arquivo na branch**:
    
    - Crie um arquivo chamado `sobre-mim.md`
    - Adicione informações pessoais (hobbies, objetivos profissionais, etc.):
        
        ```markdown
        # Sobre Mim## Informações Pessoais- **Nome:** [Seu Nome]- **Idade:** [Sua Idade]- **Cidade:** [Sua Cidade]## Hobbies- [Liste seus hobbies]## Objetivos Profissionais- [Descreva seus objetivos na área técnica]## Por que estou aprendendo Git?[Explique a importância do Git para sua formação]
        ```
        
4. **Faça commit da nova funcionalidade** (**COMMIT 2** do entregável):
    
    - Execute: `git add sobre-mim.md`
    - Execute: `git commit -m "Tarefa 3: Adiciona página sobre mim na branch nova-funcionalidade"`
5. **Envie a branch para o GitHub**:
    
    - Execute: `git push origin nova-funcionalidade`
6. **Volte para a branch principal e verifique o estado**:
    
    - Execute: `git checkout main`
    - Execute: `git status`
    - Observe que o arquivo `sobre-mim.md` não aparece (está apenas na outra branch)
7. **Documente o trabalho com branches** (**COMMIT 3** do entregável):
    
    - Edite o arquivo `comandos-git.txt` adicionando os novos comandos aprendidos:
        
        ```
        Lista de Comandos Git Aprendidos:git init - Inicializa um repositório Gitgit clone - Clona um repositório remotogit add - Adiciona arquivos à área de staginggit commit - Confirma as alterações no repositório localgit status - Mostra o status dos arquivosgit branch - Lista branches ou cria uma nova branchgit checkout - Muda para outra branchgit push origin <branch> - Envia branch para o repositório remoto
        ```
        
    - Execute: `git add comandos-git.txt`
    - Execute: `git commit -m "Tarefa 3: Atualiza lista de comandos com comandos de branch"`
    - Execute: `git push origin main`

---

## Tarefa 4 - Fazendo Merge e Resolvendo Conflitos

**Objetivo:** Aprender a unir branches e resolver conflitos quando necessário.

### Passos:

1. **Estando na branch main, faça merge da nova funcionalidade** (**COMMIT 4** do entregável):
    
    - Certifique-se de estar na branch main: `git checkout main`
    - Execute: `git merge nova-funcionalidade`
    - Este merge criará automaticamente um commit de merge no histórico
2. **Envie as alterações para o GitHub**:
    
    - Execute: `git push origin main`
3. **Crie um conflito proposital para aprender a resolver**:
    
    - Na branch `main`, edite a primeira linha do arquivo `comandos-git.txt`
    - Altere para: `Lista COMPLETA de Comandos Git Aprendidos:`
    - **Commit das alterações** (**COMMIT 5** do entregável):
        - Execute: `git add comandos-git.txt`
        - Execute: `git commit -m "Tarefa 4: Atualiza título da lista para COMPLETA"`
4. **Mude para a branch nova-funcionalidade e crie um conflito**:
    
    - Execute: `git checkout nova-funcionalidade`
    - Edite a primeira linha do arquivo `comandos-git.txt`
    - Altere para: `Lista BÁSICA de Comandos Git Aprendidos:`
    - **Commit das alterações** (**COMMIT 6** do entregável):
        - Execute: `git add comandos-git.txt`
        - Execute: `git commit -m "Tarefa 4: Muda título para lista BÁSICA"`
5. **Volte para main e tente fazer merge para gerar conflito**:
    
    - Execute: `git checkout main`
    - Execute: `git merge nova-funcionalidade`
    - Observe a mensagem de conflito - isso é esperado!
6. **Resolva o conflito**:
    
    - Abra o arquivo `comandos-git.txt` no editor
    - Você verá marcações como:
        
        ```
        <<<<<<< HEADLista COMPLETA de Comandos Git Aprendidos:=======Lista BÁSICA de Comandos Git Aprendidos:>>>>>>> nova-funcionalidade
        ```
        
    - Escolha uma versão ou crie uma nova: `Lista de Comandos Git Aprendidos:`
    - Remova todas as marcações de conflito (`<<<<<<<`, `=======`, `>>>>>>>`)
    - Salve o arquivo
7. **Finalize o merge** (**COMMIT 7** do entregável):
    
    - Execute: `git add comandos-git.txt`
    - Execute: `git commit -m "Tarefa 4: Resolve conflito no título da lista de comandos"`
    - Execute: `git push origin main`
8. **Documente a resolução de conflitos**:
    
    - Adicione no final do arquivo `comandos-git.txt`:
        
        ```
        === RESOLUÇÃO DE CONFLITOS ===git merge <branch> - Faz merge de uma branch (pode gerar conflitos)Quando há conflito: editar arquivo, remover marcações, git add, git commit
        ```
        
    - Execute: `git add comandos-git.txt`
    - Execute: `git commit -m "Tarefa 4: Documenta processo de resolução de conflitos"`
    - Execute: `git push origin main`

---

## Tarefa 5 - Histórico, Logs e Boas Práticas

**Objetivo:** Aprender a consultar o histórico do projeto e aplicar boas práticas.

### Passos:

1. **Consulte o histórico de commits**:
    
    - Execute: `git log` (pressione 'q' para sair)
    - Execute: `git log --oneline` (versão mais compacta)
    - Execute: `git log --graph --oneline` (visualização gráfica)
2. **Entenda o que é o .gitignore**:
    
    O arquivo `.gitignore` é um arquivo especial que informa ao Git quais arquivos ou pastas devem ser **ignorados** durante o versionamento. Quando um arquivo está listado no .gitignore, o Git:
    
    - **NÃO** o incluirá quando você usar `git add .`
    - **NÃO** o mostrará como "untracked" no `git status`
    - **NÃO** o enviará para o repositório remoto
    
    **Por que usar?**
    
    - Arquivos com senhas e dados sensíveis
    - Arquivos temporários do sistema
    - Configurações locais específicas de cada desenvolvedor
    - Arquivos gerados automaticamente
3. **Crie um arquivo .gitignore**:
    
    - Crie um arquivo chamado `.gitignore` (com ponto no início)
    - Adicione o seguinte conteúdo:
        
        ```
        # Arquivos temporários*.tmp*.log# Pastas de sistema.DS_StoreThumbs.db# Arquivos de IDE.vscode/.idea/# Arquivos pessoais (não devem ser versionados)senha.txtconfiguracoes-locais.txt
        ```
        
4. **Teste o .gitignore com arquivo temporário**:
    
    - Crie um arquivo `teste.tmp`
    - Execute: `git status`
    - **Resultado esperado:** O arquivo `teste.tmp` NÃO aparece na lista de arquivos não versionados
5. **Teste o .gitignore com arquivo sensível**:
    
    - Crie um arquivo `senha.txt`
    - Adicione qualquer conteúdo, exemplo:
        
        ```
        Usuário: meuusuarioSenha: minhasenhasecreta123
        ```
        
    - Execute: `git status`
    - **Resultado esperado:** O arquivo `senha.txt` NÃO aparece na lista de arquivos não versionados
    - **Importante:** Mesmo que você tente `git add senha.txt`, o Git vai ignorar este arquivo
6. **Compare com arquivo normal**:
    
    - Crie um arquivo `arquivo-normal.txt` com qualquer conteúdo
    - Execute: `git status`
    - **Resultado esperado:** Apenas `arquivo-normal.txt`, `.gitignore` e outros arquivos normais aparecem para serem adicionados
    - Os arquivos `teste.tmp` e `senha.txt` continuam invisíveis para o Git
7. **Crie um arquivo de documentação do projeto**:
    
    - Crie um arquivo `INSTRUCOES.md`
    - Adicione instruções sobre como usar seu repositório:
        
        ```markdown
        # Instruções do Projeto## Como usar este repositório1. Clone o repositório2. Leia o arquivo README.md3. Consulte comandos-git.txt para referência## Estrutura do Projeto- `README.md` - Informações principais do projeto- `comandos-git.txt` - Lista de comandos Git úteis- `sobre-mim.md` - Informações pessoais do autor- `INSTRUCOES.md` - Este arquivo de instruções- `.gitignore` - Arquivos que devem ser ignorados pelo Git- `arquivo-normal.txt` - Arquivo de exemplo para teste## Arquivos Ignorados pelo Git (.gitignore)Os seguintes arquivos estão presentes na pasta mas são ignorados pelo Git:- `teste.tmp` - Arquivo temporário de exemplo- `senha.txt` - Arquivo com informações sensíveis (exemplo de segurança)## Próximos Passos- Continuar estudando Git- Aprender sobre Git Flow- Praticar colaboração em equipe
        ```
        
8. **Faça o commit final** (**COMMIT 8** do entregável):
    
    - Execute: `git add .gitignore INSTRUCOES.md arquivo-normal.txt`
    - **Observe:** Os arquivos `senha.txt` e `teste.tmp` não serão incluídos mesmo se você usar `git add .`
    - Execute: `git commit -m "Tarefa 5: Adiciona .gitignore, documentação e testa arquivos ignorados"`
    - Execute: `git push origin main`
9. **Atualize o README.md com informações finais**:
    
    - Edite o arquivo README.md adicionando ao final:
        
        ```markdown
        ## Progresso do Estudo Dirigido✅ Tarefa 1 - Configuração e primeiro repositório  ✅ Tarefa 2 - Modificações e primeiro commit  ✅ Tarefa 3 - Trabalho com branches  ✅ Tarefa 4 - Merge e resolução de conflitos  ✅ Tarefa 5 - Histórico, logs e boas práticas  **Total de commits realizados:** 8+ commits**Data de conclusão:** [Data atual]
        ```
        
    - **Commit final** (**COMMIT 9** do entregável):
        - Execute: `git add README.md`
        - Execute: `git commit -m "Tarefa 5: Finaliza estudo dirigido com resumo das tarefas"`
        - Execute: `git push origin main`
10. **Limpe as branches desnecessárias**:
    
    - Execute: `git branch -d nova-funcionalidade` (remove branch local)
    - Execute: `git push origin --delete nova-funcionalidade` (remove branch remota)
11. **Verifique o resultado final e prepare o entregável**:
    
    - Execute: `git log --graph --oneline`
    - Conte os commits realizados (deve ter pelo menos 9)
    - Acesse seu repositório no GitHub e observe todos os arquivos criados
    - **COPIE A URL DO SEU REPOSITÓRIO** - esta é sua entrega!
    - Exemplo: `https://github.com/seu-usuario/meu-primeiro-projeto-git`

---

## Comandos Importantes para Lembrar

- `git status` - Verifica o status dos arquivos
- `git add <arquivo>` - Adiciona arquivo à área de staging
- `git add .` - Adiciona todos os arquivos modificados
- `git commit -m "mensagem"` - Faz commit com mensagem
- `git push` - Envia commits para o repositório remoto
- `git pull` - Baixa alterações do repositório remoto
- `git branch` - Lista branches
- `git checkout <branch>` - Muda para outra branch
- `git merge <branch>` - Faz merge de uma branch
- `git log` - Mostra histórico de commits

---

## Reflexão Final

Após completar todas as tarefas, responda:

1. Qual a importância do Git para desenvolvimento de software?
2. Como o uso de branches pode ajudar no trabalho em equipe?
3. Por que é importante escrever mensagens de commit claras?
4. Quando você usaria o arquivo .gitignore?
5. **Como o histórico de commits do seu repositório demonstra seu aprendizado?**

## ✅ Checklist Final do Entregável

Antes de entregar, verifique se seu repositório possui:

- [ ] Nome correto: `meu-primeiro-projeto-git`
- [ ] Repositório público no GitHub
- [ ] Mínimo de 8-9 commits com mensagens descritivas
- [ ] Arquivo README.md atualizado com suas informações
- [ ] Arquivo comandos-git.txt com lista de comandos
- [ ] Arquivo sobre-mim.md com informações pessoais
- [ ] Arquivo INSTRUCOES.md com documentação do projeto
- [ ] Arquivo .gitignore configurado
- [ ] Histórico mostrando criação e merge de branches
- [ ] Evidências de resolução de conflitos no histórico

**🎉 Parabéns!** Você completou seu primeiro estudo dirigido de Git e tem um repositório que documenta todo seu aprendizado. Continue praticando estes conceitos em seus projetos futuros.

**📤 Para entregar:** Copie a URL do seu repositório e envie conforme instruções do professor.