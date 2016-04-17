class AddUserIdFieldToAllModels < ActiveRecord::Migration
  def change
    add_column :cinemas, :user_id, :integer
    add_column :film_sessions, :user_id, :integer
    add_column :places, :user_id, :integer
  end
end
