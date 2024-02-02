module ApplicationHelper

# app/helpers/application_helper.rb
def recipe_search_options
    [
      ['Select Food Type', ''],
      ['Breakfast', 'breakfast'],
      ['Lunch', 'lunch'],
      ['Dinner', 'dinner'],
      ['Snack', 'snack'],
      ['Dessert', 'dessert'], 
      ['Vegetarian', 'vegetarian'],
      ['Vegan', 'vegan'],
      ['Gluten free', 'gluten-free'],
      ['Dairy Free', 'dairy free'],
      ['Pescatarian', 'pescatarian']
    ]
  end
  
end
