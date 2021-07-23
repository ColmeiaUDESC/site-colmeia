class Tag < ApplicationRecord
    has_many :postsTag
    has_many :post, :through => :posts_tag
    validates :nome, presence: true, length: { minimum: 1, maximum: 12,
        too_long: "Tag deve ter no máximo %{count} caracters",
        too_short: "Tag deve ter no mínimo %{count} caracter",
        }
    validates_uniqueness_of :nome, :message => "Tag já existe!"
end
