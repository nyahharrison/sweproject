class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  has_one :profile 
  has_many :recipes
  #has_many :reviews

  has_many :bookmarks
  has_many :bookmarked_recipes, through: :bookmarks, source: :recipe

  # Add the username attribute
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end