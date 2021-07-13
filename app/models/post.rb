class Post < ApplicationRecord
    has_many :comentario
    has_many :postsTag
    has_many :tag, :through => :posts_tag
end
