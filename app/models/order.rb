class Order < ApplicationRecord
  belongs_to :user
  has_many :carts
  scope :placed, -> { find_by(status: false) }
end
