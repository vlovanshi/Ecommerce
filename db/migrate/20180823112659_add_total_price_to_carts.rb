class AddTotalPriceToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :total_price, :decimal
  end
end
