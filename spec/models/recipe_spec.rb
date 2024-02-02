# spec/models/recipe_spec.rb

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
    it { should have_many(:reviews) }
    it { should have_many(:bookmarks) }
    it { should have_many(:users_who_bookmarked).through(:bookmarks).source(:user) }
    it { should have_one_attached(:image) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    # Add other validations as needed
  end

  # describe 'methods' do
  #   it 'returns an array of dietary restrictions' do
  #     recipe = Recipe.create(title: 'Test Recipe', description: 'Test Description', dietary_restrictions: ['Vegan', 'Gluten-Free'])
  #     expect(recipe.dietary_restrictions_array).to eq(['Vegan', 'Gluten-Free'])
  #   end
  # end
end
