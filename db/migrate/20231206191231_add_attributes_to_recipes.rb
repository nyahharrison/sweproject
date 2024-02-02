class AddAttributesToRecipes < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:recipes, :dietary_restrictions)
    add_column :recipes, :dietary_restrictions, :string
    add_column :recipes, :meal_type, :string
    add_column :recipes, :time_constraint, :string
    end
  end
end
