class CartItem
	attr_reader :product_id, :quantity

	def initialize product_variation_id, quantity = 1
		@product_id = product_variation_id
		@quantity = quantity
	end

	def increment 
		@quantity = @quantity + 1
	end

	def product 
		ProductVariation.find(product_id)
	end

	def product_parent
		self.product.product
	end

	def price
		product = self.product
		product.price
	end
end