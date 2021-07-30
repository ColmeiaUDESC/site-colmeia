class Link < ApplicationRecord

    validates_presence_of :texto, :message => "Texto não pode ser em branco!"
    validates_presence_of :botao , :message => "Botão não pode ser em branco!"
    validates_presence_of :link , :message => "Link não pode ser em branco!"

end
