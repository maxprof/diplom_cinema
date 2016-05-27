class RemoveColumnForSearch < ActiveRecord::Migration
  def change
    remove_column :searches, :category
  end
end
