class CreateStocks < ActiveRecord::Migration[8.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
