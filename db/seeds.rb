# Ruby stock documentation:
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Our docs:
# Para popular o banco de dados no ambiente local se inserem neste arquivo comandos para alterar o banco de dados
# Segue abaixo como exemplo o usuário admin, este que tem acesso aos privilégios de bolsistas e pode ser usado para teste de funcionalidades

#Lembrando que o modelo de usuário possui os seguintes campos
#nome:string (Obrigatório)
#sobrenome:string (Obrigatório)
#email:string (Obrigatório)
#password_digest:string (Deve ser passado como password ou password+password_confirmation)
#situacao:string
#data_de_inicio:date

User.create(nome:"admin", sobrenome:"admin", email:"admin@admin.com", password:"DevEnv", situacao:"Admin", github_username: 'joaodematte', twitter_username: 'joaodematte', instagram_username: 'joaodematte', discord_username: '689272830038245420')
Artefato.create(texto:"Tivemos historias sim!")
Artefato.create(texto:"Somos pessoas dedicadas!")
Link.create(texto:"Texto", botao:"Enviar", link:"www.udesc.br/cct")