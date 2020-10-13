class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.text :product
      t.integer :count
      t.timestamps
    end
  end
end
