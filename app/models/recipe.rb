class Recipe < ApplicationRecord
    belongs_to :user
    #has_many :reviews

    has_many :bookmarks
    has_many :users_who_bookmarked, through: :bookmarks, source: :user

    has_one_attached :image

    #mount_uploader :image, ImageUploader
    #mount_uploader :video, VideoUploader

    #has_and_belongs_to_many :dietary_tags, class_name: 'DietaryTag'
    #has_and_belongs_to_many :time_tags, class_name: 'TimeTag'
    #has_and_belongs_to_many :ingredient_tags, class_name: 'IngredientTag'


    #attr_accessor :dietary_restrictions, :meal_type, :time_constraint, :ingredients
    
end
