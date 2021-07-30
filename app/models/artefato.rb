class Artefato < ApplicationRecord

    validates_presence_of :texto, :message => "Texto não pode ser em branco!"

end
