class AddSessionDateToPlace < ActiveRecord::Migration
  def change
    add_column :places, :date, :string
  end
end
