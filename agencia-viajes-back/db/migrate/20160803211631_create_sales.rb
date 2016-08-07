class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :customer, index: true, foreign_key: true
      t.belongs_to :destination, index: true, foreign_key: true
      t.integer :quantity, default: 1
      t.integer :total, default: 0
      t.date :sale_date

      t.timestamps null: false
    end
  end
end
