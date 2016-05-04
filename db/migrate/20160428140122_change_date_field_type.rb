class ChangeDateFieldType < ActiveRecord::Migration
  def change
    change_column(:film_sessions, :date, :string)
  end
end

