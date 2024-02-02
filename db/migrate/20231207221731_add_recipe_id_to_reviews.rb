class AddRecipeIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :recipe, null: false, foreign_key: true
  end
end
