class CreateFilmSessionCategories < ActiveRecord::Migration
  def change
    create_table :film_session_categories do |t|
      t.integer :film_session_id
      t.integer :category_id
    end
  end
end
