class AddSessionDateToSession < ActiveRecord::Migration
  def change
    add_column :film_sessions, :date, :string
  end
end
