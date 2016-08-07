class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.integer :number_of_request, default: 0
      t.boolean :status, default: true

      t.timestamps null: false
    end
  end
end
