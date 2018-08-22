class AddVerifiedToSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :verified, :boolean, :default => false
  end
end
