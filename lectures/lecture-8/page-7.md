---
layout: default
transition: slide-up
---
# <a href="https://www.cloudflare.com/pt-br/learning/access-management/principle-of-least-privilege/" target= "_blank">O Princípio do Menor Privilégio</a>

<div>
  Uma das principais portas de acesso para atacantes é a permissão de acesso desnecessáiro para diversos usuários. Pense em um sistema bancário, um cliente do banco não deve ter permissão de acessar um banco de dados e muito menos de alterar os dados. Desta forma, mesmo dentro da equipe de desenvolvimento, é importante criar perfis de usuários com permissões diferentes. 
</div>

Um desenvolvedor não deve ter as mesmas permissões de acesso e alteração de um banco de dados que um Gerente de TI. Por sua vez, o Gerente de TI deve ter menos permissões que um Diretor de TI. Por fim, o CEO da empresa deveria ter menos permissões que um desenvolvedor, tendo em vista que as atividades do dia a dia dessa pessoa não envolvem operações diretas em um banco de dados.

Adotar a estratégia de menor privilégio por padrão e aumentar conforme a necessidade já ajuda a diminuir os riscos de alterações eindesejadas do banco de dados, além de reduzir as chances de vazamento de informações.