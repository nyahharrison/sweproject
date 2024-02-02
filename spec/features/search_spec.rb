# spec/features/search_spec.rb
require 'rails_helper'

RSpec.feature 'Search bar feature', type: :feature do
  scenario 'User searches for recipes' do
    visit root_path
    select 'Vegetarian', from: 'food_type'
    click_button 'Search'
    expect(page).to have_current_path(show_result_path(food_type: 'vegetarian'))
  end
  scenario 'User visits the home page and sees the search bar' do
    visit root_path
    expect(page).to have_selector('form[action="/search"]')
    expect(page).to have_select('food_type', with_options: ['Vegetarian', 'Vegan'])
    expect(page).to have_button('Search')
  end 

end