class CreateReparations < ActiveRecord::Migration[8.0]
  def change
    create_table :reparations do |t|
      t.string :name
      t.string :probleme
      t.decimal :price

      t.timestamps
    end
  end
end
