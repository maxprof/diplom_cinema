class AddAttachmentFilmSessionsPosterToFilmSessions < ActiveRecord::Migration
  def self.up
    change_table :film_sessions do |t|
      t.attachment :film_sessions_poster
    end
  end

  def self.down
    remove_attachment :film_sessions, :film_sessions_poster
  end
end
