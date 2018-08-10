class Product < ApplicationRecord
  belongs_to :seller
  has_many_attached :avatars
end
