class AddLastNameToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :last_name, :string
  end
end
