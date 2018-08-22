class AddFirstNameToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :first_name, :string
  end
end
