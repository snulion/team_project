class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts       # User-Post 1:N
  
  has_many :likes
  has_many :stories, through: :likes, class_name: :POST     # User-Like-Post M:N
  
  has_many :difficulties
  has_many :messages, through: :difficulties, class_name: :POST     # User-Diffculty-Post M:N
end
