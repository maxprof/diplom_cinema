class AddSessionDateToPlace < ActiveRecord::Migration
  def change
    add_column :places, :date, :date
  end
end
