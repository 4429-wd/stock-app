class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :stock_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
