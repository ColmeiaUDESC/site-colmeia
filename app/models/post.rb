class Post < ApplicationRecord
    has_many :comentario
    has_many :postsTag
    has_many :tag, :through => :posts_tag
    validates :title, length: { minimum: 5, maximum: 100,
        too_long: "Título deve ter no máximo %{count} caracters",
        too_short: "Título deve ter no mínimo %{count} caracters",
    }
    validates :desc, length: { minimum: 5, maximum: 256,
        too_long: "Descrição deve ter no máximo %{count} caracters",
        too_short: "Descrição deve ter no mínimo %{count} caracters",
    }
    validates :html, length: { minimum: 5,
        too_short: "Corpo do post deve ter no mínimo %{count} caracters",
    }
    validates_presence_of :users_name, :message => "Usuário inválido!"
end
