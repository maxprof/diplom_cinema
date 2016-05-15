class Change < ActiveRecord::Migration
  def self.up
    rename_column :film_session_session_times, :time_id, :session_time_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
