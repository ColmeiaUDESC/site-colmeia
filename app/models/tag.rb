class Tag < ApplicationRecord
    has_many :postsTag
    has_many :post, :through => :posts_tag
end
