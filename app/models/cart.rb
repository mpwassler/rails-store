class Cart
	attr_reader :items
	
	def self.build_from_hash hash
		items = if hash['cart'] then 
			hash['cart']['items'].map do |item|
			CartItem.new item['product_id'], item['quantity']
			end
		else
			[]
		end
		new items
	end

	def initialize items = []
		@items = items
	end

	def add_item product_variation_id
		item = @items.find { |item| item.product_id == product_variation_id}
		if item 
			item.increment
		else
			@items << CartItem.new( product_variation_id )			
		end		
	end

	def empty?
		@items.empty?
	end

	def serialize
		items = @items.map do |item| 
			{ 
				"product_id" => item.product_id, 
				"quantity" => item.quantity
			}
		end
		{
			"items" => items
		}
	end
end