class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :city
      t.integer :postal_code
      t.references :addressable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
