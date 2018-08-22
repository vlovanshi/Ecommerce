class Product < ApplicationRecord
  belongs_to :seller
  has_many_attached :avatars
  has_one :cart_item, dependent: :destroy
  has_one :cart, through: :cart_item, dependent: :destroy
  has_many :reviews
end



