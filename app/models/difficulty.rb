class Difficulty < ActiveRecord::Base
    belongs_to :person, class_name: :User, foreign_key: :user_id
    belongs_to :message, class_name: :Post, foreign_key: :post_id
end
