class CreateFilmSessionTimes < ActiveRecord::Migration
  def change
    create_table :film_session_session_times do |t|
      t.integer :film_session_id
      t.integer :time_id
    end
  end
end
