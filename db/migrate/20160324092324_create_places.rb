class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.integer :cinema_id
      t.integer :FilmSession_id
      t.integer :place_number
      t.boolean :status

      t.timestamps null: false
    end
  end
end
