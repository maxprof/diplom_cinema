class CreateFilmSessions < ActiveRecord::Migration
  def change
    create_table :film_sessions do |t|
      t.integer :cinema_id
      t.string :session_name
      t.integer :number_of_session_place

      t.timestamps null: false
    end
  end
end
