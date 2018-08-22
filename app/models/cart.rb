class Cart < ApplicationRecord
  belongs_to :order
  has_one :cart_item, dependent: :destroy
  has_one :product, through: :cart_item, dependent: :destroy
end
