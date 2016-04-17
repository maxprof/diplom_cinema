class AddJoinTableForPlacesAndFilmSessions < ActiveRecord::Migration
  def change
    create_table :film_sessions_places, id: false do |t|
      t.integer :film_session_id
      t.integer :place_id
    end

    add_index :film_sessions_places, :film_session_id
    add_index :film_sessions_places, :place_id
  end
end
