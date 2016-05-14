class AddSessionEndDateAndChangeFieldsName < ActiveRecord::Migration
  def change
    add_column :film_sessions, :session_end_date, :string
    rename_column :film_sessions, :date, :session_start_date

  end
end
