class AddImageAndVideoToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :image, :string
    add_column :recipes, :video, :string
  end
end
