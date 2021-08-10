class Projeto < ApplicationRecord
    validates :titulo, length: { minimum: 1, maximum: 32,
        too_long: "Titulo deve ter no máximo %{count} caracters",
        too_short: "Titulo deve ter no mínimo %{count} caracter",
    }
    validates :desc, length: { minimum: 10, maximum: 255,
        too_long: "Descrição deve ter no máximo %{count} caracters",
        too_short: "Descrição deve ter no mínimo %{count} caracters",
    }
    validates :img_url, length: { minimum: 10, maximum: 255,
        too_long: "Imagem url deve ter no máximo %{count} caracters",
        too_short: "Imagem url deve ter no mínimo %{count} caracters",
    } 
    validates :git_url, length: { minimum: 10, maximum: 255,
        too_long: "Github url deve ter no máximo %{count} caracters",
        too_short: "Github url deve ter no mínimo %{count} caracters",
    } 
    
end
