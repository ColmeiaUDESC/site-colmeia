### O modelo user possui:

#name:string
#sobrenome:string
#email:string
#password_digest:string
#situacao:string
#data_de_inicio:date

#password:string virtual
#password_confirmation:string virtual

class User < ApplicationRecord
    has_secure_password 
    # Esse metodo transforma password e password_confirmation em uma senha encriptada chamada password digest
    # Deste modo não existe forma de acesso a senha diretamente e garantimos assim a segurança das informações do usuário

    validates :name, presence: true
    validates :sobrenome, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'em formato inválido' }

end
