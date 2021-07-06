# Este arquivo serve para linkar a documentação do programa, facilitando a colaboração e aprendizado de novos membros!

## Criando novas páginas!

Caso você tenha interesse em criar novas páginas dê um pulinho no arquivo `/config/routes.rb`. Este arquivo controla as rotas e é nele que adicionamos os _caminhos_ que o navegador vai poder acessar. Os métodos são:

- GET -> Buscar informação.
- POST -> Inserir uma informação.
- PUT -> Alterar uma informação.
- DELETE -> Remover um dado.
- PATCH -> Alterar informação especifica.

Exemplo:

```ruby
get:'test', to:'test#index'
```
