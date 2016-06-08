class Like < ActiveRecord::Base
    belongs_to :story, class_name: :Post, foreign_key: :post_id
    belongs_to :member, class_name: :User, foreign_key: :user_id           # User-Like-Post
end
