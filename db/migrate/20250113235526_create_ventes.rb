class CreateVentes < ActiveRecord::Migration[8.0]
  def change
    create_table :ventes do |t|
      t.integer :quantity
      t.decimal :price
      t.references :produit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
