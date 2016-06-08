class Post < ActiveRecord::Base
    belongs_to :user        # User-Post 1:N
    
    has_many :comments      # Post-Comment 1:N
    
    has_many :likes
    has_many :members, through: :likes, class_name: :User
    
    has_many :difficulties
    has_many :persons, through: :difficulties, class_name: :User
end
