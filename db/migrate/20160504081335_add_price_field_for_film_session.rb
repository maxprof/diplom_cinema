class AddPriceFieldForFilmSession < ActiveRecord::Migration
  def change
    add_column :film_sessions, :price, :decimal, :precision => 8, :scale => 2
  end
end
