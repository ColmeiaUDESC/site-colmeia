class Comentario < ApplicationRecord
    belongs_to :user
    belongs_to :post

    before_validation :strip_whitespace, :only => [:comentario]

    def strip_whitespace
        self.comentario = self.comentario.strip unless self.comentario.nil?
    end
      

    validates :comentario, length: { minimum: 1, maximum: 240,
        too_long: "Comentário deve ter no máximo %{count} caracters",
        too_short: "Comentário deve ter no mínimo %{count} caracter",
    }
    

end
