class AddSessionDateFieldForPlaces < ActiveRecord::Migration
  def change
    add_column :places, :session_date, :string
  end
end
