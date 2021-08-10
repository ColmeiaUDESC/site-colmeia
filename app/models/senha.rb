class Senha < ApplicationRecord
    # string "plataforma"
    # string "link"
    # string "usuario"
    # string "senha" 

    validates_presence_of :plataforma, :message => "Plataforma não pode ser em branco!"
    validates_presence_of :usuario, :message => "Usuário não pode ser em branco!"
    validates_presence_of :senha, :message => "Senha não pode ser em branco!"

end
