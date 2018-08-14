class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :cart_items
end

