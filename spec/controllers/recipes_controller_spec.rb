# spec/controllers/recipes_controller_spec.rb

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { create_user }
  let(:recipe_params) { { title: 'Test Recipe', description: 'Test Description' } }

  before { sign_in user }

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new recipe' do
        expect do
          post :create, params: { recipe: recipe_params }
          change(Recipe, :count).by(1)
        end
      end

      it 'redirects to the root path' do
        post :create, params: { recipe: recipe_params }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new recipe' do
        expect do
          post :create, params: { recipe: recipe_params.merge(title: nil) }
          not_to change(Recipe, :count)
        end
      end
    end
  end

    

  describe 'GET #show' do
    let(:recipe) { create_recipe(user) }

    it 'renders the home template' do
      get :show, params: { id: recipe.id }
      expect(response).to render_template('home/index')
    end
  end

  # ... (other actions)

  describe 'GET #search' do
    it 'renders the search template' do
      get :search
      expect(response).to render_template('home/index')
    end
  end
end
