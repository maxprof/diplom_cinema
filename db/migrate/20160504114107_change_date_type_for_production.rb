class ChangeDateTypeForProduction < ActiveRecord::Migration
  def change
    change_column :film_sessions, :date, :string, :null => false
  end
end
