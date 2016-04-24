class AddAttachmentNewsPosterToNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.attachment :news_poster
    end
  end

  def self.down
    remove_attachment :news, :news_poster
  end
end
