# spec/controllers/bookmarks_controller_spec.rb
require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:user) { create(:user) } # You may need to adjust this based on your user setup

  before { sign_in user }

  describe 'POST #create' do
    let(:recipe) { create(:recipe) } # You may need to adjust this based on your recipe setup

    it 'creates a bookmark for the recipe' do
      post :create, params: { id: recipe.id }
      expect(user.bookmarks.count).to eq(1)
    end

    it 'redirects to root path' do
      post :create, params: { id: recipe.id }
      expect(response).to redirect_to(root_path)
    end

    it 'sets a flash notice' do
      post :create, params: { id: recipe.id }
      expect(flash[:notice]).to eq('Recipe bookmarked successfully.')
    end
  end

  describe 'DELETE #destroy' do
    let!(:bookmark) { create(:bookmark, user: user) } # You may need to adjust this based on your bookmark setup

    it 'destroys the bookmark for the recipe' do
      delete :destroy, params: { id: bookmark.recipe_id }
      expect(user.bookmarks.count).to eq(0)
    end

    it 'redirects to root path' do
      delete :destroy, params: { id: bookmark.recipe_id }
      expect(response).to redirect_to(root_path)
    end

    it 'sets a flash notice' do
      delete :destroy, params: { id: bookmark.recipe_id }
      expect(flash[:notice]).to eq('Recipe removed from bookmarks.')
    end
  end
end
