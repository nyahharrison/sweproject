Rails.application.routes.draw do
  resources :reviews, only: [:create, :new, :index, :destroy]
  #devise_for :users

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'home#index'

  resources :recipes, only: [:new, :edit, :destroy]
  get 'recipes/new' => 'recipes#new'

  get 'users/:id' => 'users#show', as: :user

  #resources :reviews, only: [:create, :edit, :show, :index]

  get '/recipes/cancel', to: 'recipes#cancel', as: 'cancel_recipe'

  #get 'search' => 'home#search', as: :search
  get 'search_home' => 'home#show_result', as: :search_home

  get 'show_result/:food_type' => 'home#show_result', as: :show_result

  get 'recipes' => 'recipes#index', as: :recipes_index

  resources :dietary_tags

  resources :bookmarks, only: [:create, :destroy]

  resources :users, only: [:show]

  resources :recipes do
    member do
      post 'add_to_bookmarks', to: 'bookmarks#create', as: :add_to_bookmarks
      delete 'remove_from_bookmarks', to: 'bookmarks#destroy', as: :remove_from_bookmarks
      get :cancel
    end
    collection do
      get :filter
      get 'search'
    end
  end

  #delete 'recipes/:id', to: 'recipes#destroy', as: 'destroy_recipe'
end
