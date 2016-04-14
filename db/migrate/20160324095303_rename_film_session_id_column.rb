class RenameFilmSessionIdColumn < ActiveRecord::Migration
  def self.up
    rename_column :places, :FilmSession_id, :film_session_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
