class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :product_number
      t.decimal :price
      t.integer :quantity
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
