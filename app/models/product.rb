class Product < ApplicationRecord
  belongs_to :seller
  has_many :cart_items, dependent: :delete_all
  has_many_attached :avatars
end
