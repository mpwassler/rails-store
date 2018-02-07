
class ProductVariation < ApplicationRecord
  belongs_to :product

  def price 
  	Money.new(self[:price], "USD")
  end
end
