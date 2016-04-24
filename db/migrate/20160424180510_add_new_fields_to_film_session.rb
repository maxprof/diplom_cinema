class AddNewFieldsToFilmSession < ActiveRecord::Migration
  def change
    add_column :film_sessions, :description, :text
    add_column :film_sessions, :rating, :float
    add_column :film_sessions, :trailer_link, :string
  end
end
