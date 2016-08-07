class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :action
      t.string :view

      t.timestamps null: false
    end
  end
end
