class SearchCategories < ActiveRecord::Migration
  def change
    create_table :search_categories do |t|
      t.integer :search_id
      t.integer :category_id
    end
  end
end

