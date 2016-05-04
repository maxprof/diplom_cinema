class ChangeDateFieldForHeroku < ActiveRecord::Migration
  def change
    change_column :film_sessions, :date, 'date USING CAST(date AS date)'
  end
end

