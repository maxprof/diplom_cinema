class AddIndexesForFields2 < ActiveRecord::Migration
  def change
    add_index :film_sessions, :user_id
    add_index :search_categories, :search_id
    add_index :search_categories, :category_id
  end
end
