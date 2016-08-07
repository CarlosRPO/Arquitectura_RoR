class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :country
      t.integer :price, default: 0
      t.integer :taxes, default: 0
      t.integer :total, default: 0
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
