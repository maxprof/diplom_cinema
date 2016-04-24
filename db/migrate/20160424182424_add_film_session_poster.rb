class AddFilmSessionPoster < ActiveRecord::Migration
  def change
    def up
      add_attachment :film_sessions, :film_sessions_poster
    end

    def down
      remove_attachment :film_sessions, :film_sessions_poster
    end
  end
end
