class ChangeDateFieldTypeBack < ActiveRecord::Migration
  def change
    change_column(:film_sessions, :date, :date)
  end
end
