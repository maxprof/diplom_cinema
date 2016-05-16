class AddSessionTimeFieldForPlaces < ActiveRecord::Migration
  def change
    add_column :places, :session_time, :string
  end
end
