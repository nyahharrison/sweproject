class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.string :dietary_restrictions
      t.string :meal_type
      t.string #:time_constraint
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
