class ChangeDateNameInPlaceModel < ActiveRecord::Migration
  def self.up
    rename_column :places, :date, :session_start_date
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
