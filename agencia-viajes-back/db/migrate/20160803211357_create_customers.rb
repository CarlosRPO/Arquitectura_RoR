class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :last_name
      t.string :identification
      t.string :email
      t.date :birth_date
      t.string :phone

      t.timestamps null: false
    end
  end
end
