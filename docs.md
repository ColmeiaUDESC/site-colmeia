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

