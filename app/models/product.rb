class Product < ApplicationRecord
  belongs_to :catagory
  has_many :product_variations
end
