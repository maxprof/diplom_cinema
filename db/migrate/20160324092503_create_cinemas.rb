class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :cinema_name
      t.string :cinema_addr

      t.timestamps null: false
    end
  end
end
