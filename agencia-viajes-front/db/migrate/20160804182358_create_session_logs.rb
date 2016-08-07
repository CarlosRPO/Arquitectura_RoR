class CreateSessionLogs < ActiveRecord::Migration
  def change
    create_table :session_logs do |t|
      t.string :user_name
      t.date :logged_date
      t.boolean :success
      t.string :error_message

      t.timestamps null: false
    end
  end
end
