class Product < ApplicationRecord
  belongs_to :seller
  has_one_attached :avatar
end
