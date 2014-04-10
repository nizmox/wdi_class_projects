class CreateBooksRecipes < ActiveRecord::Migration
  def change
    create_table :books_recipes, :id => false do |t|
      t.integer :book_id
      t.integer :recipe_id
    end
  end
end
