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

## Conflitos ao rodar o postgres no docker?

Muitos de nós começamos a ter problemas ao rodar o docker após ter iniciado o postgres na máquina local, para resolver este problema é só utilizar o comando:

```
sudo service postgresql stop
```

Este comando para o serviço do postgres e impede que o erro aconteça. Caso queira desativar de maneira permanente este erro você pode desativar o postgres completamente através do comando:

```
sudo update-rc.d postgresql disable
```

## Popular o banco de dados através de seeds!

Para adicionar os valores no banco de dados antes da primeira execução pode se usar o comando

```
rails db:seed
```

Respeitando obviamente o ambiente seja ele local ou docker.

### Adicionar novos valores no seed:

Para adicionar novos componentes aos bancos de dados deve se alterar o arquivo `db/seeds.rb`, ele aceita comandos como no console rails (este pode ser executado através do comando `rails c`)
