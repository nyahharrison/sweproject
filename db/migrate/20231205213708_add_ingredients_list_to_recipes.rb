class AddIngredientsListToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :ingredients_list, :text
  end
end
