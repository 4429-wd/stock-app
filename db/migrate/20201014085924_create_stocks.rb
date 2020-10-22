class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :stock ,null: false
      t.string :item, null: false
      t.timestamps
    end
  end
end
