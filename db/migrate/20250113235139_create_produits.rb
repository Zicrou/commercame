class CreateProduits < ActiveRecord::Migration[8.0]
  def change
    create_table :produits do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
