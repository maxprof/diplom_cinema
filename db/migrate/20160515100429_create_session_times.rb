class CreateSessionTimes < ActiveRecord::Migration
  def change
    create_table :session_times do |t|
      t.string :session_time

      t.timestamps null: false
    end
  end
end
