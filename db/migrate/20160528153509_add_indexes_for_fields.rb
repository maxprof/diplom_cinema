class AddIndexesForFields < ActiveRecord::Migration
  def change
    add_index :cinemas, :user_id
    add_index :comments, [:commentable_id]
    add_index :comments, [:commentable_type]
    add_index :comments, [:user_id]
    add_index :film_session_categories, [:film_session_id]
    add_index :film_session_categories, [:category_id]
    add_index :film_session_session_times, [:film_session_id]
    add_index :film_session_session_times, [:session_time_id]
    add_index :film_sessions, [:cinema_id]
    add_index :news, :user_id
    add_index :places, [:cinema_id]
    add_index :places, [:film_session_id]
    add_index :places, [:user_id]
  end
end
