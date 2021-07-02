# Site da Colmeia UDESC

Neste repositório se encontra o código fonte do website da Colmeia UDESC, um projeto de extensão dedicado na disseeminação do uso de Hardware e Software Livre. O site foi feito usando Ruby on Rails e Docker 

## Tabela de Conteúdos

<!--ts-->

- [Site da Colmeia UDESC](#site-da-colmeia-udesc)
  - [Tabela de Conteúdos](#tabela-de-conteúdos)
  - [Dependências](#dependências)
  - [Instalação](#instalação)
  - [Instalação usando Docker](#instalação-usando-docker)
  - [Instalação manual](#instalação-manual)
  - [Execução](#execução)

<!--te-->

## Dependências

O projeto possui as seguintes dependências:

* Instalação com Docker
  * [Docker](https://docs.docker.com/get-docker/)
  * [Docker Compose](https://docs.docker.com/compose/install/)
* Instalação manual
  * [Ruby 3.0.1](https://www.ruby-lang.org/en/downloads/)
  * [Ruby on Rails](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails)
  * [PostgreSQL 12](https://www.postgresql.org/download/)
  * [Node.Js](https://nodejs.org/en/)
  * [Yarn](https://yarnpkg.com/getting-started/install)

## Instalação

Para instalar o projeto na sua máquina, pode-se usar o Docker ou manualmente.
Instale as dependências, de acordo com o método de instalação que irá realizar, e depois clone o projeto na sua máquina.
Agora, realize um dos seguintes métodos de instalação.

## Instalação usando Docker

Vá para o diretório do projeto e execute:

```sh
sudo docker-compose build
sudo docker-compose run web yarn add @rails/webpacker
```

Caso ocorra de o site não funcionar devido à ausencia de um banco de dados, execute:

```sh
sudo docker-compose run web rails db:create
```

## Instalação manual

Vá para o diretório do projeto e execute:

```sh
gem install bundler
bundle install
yarn install
```

## Execução

Para executar o projeto usando docker, execute:

```sh
sudo docker-compose up
```

Para executar o projeto usando o Ruby on Rails, execute:

```sh
bin/rails server
```