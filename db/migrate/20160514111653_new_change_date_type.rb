class NewChangeDateType < ActiveRecord::Migration
  def change
    change_column :film_sessions, :session_start_date, :string
  end
end
