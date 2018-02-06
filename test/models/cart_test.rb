require "test_helper"

class CartTest < ActiveSupport::TestCase
	def test_adds_one_item 
		cart = Cart.new
		cart.add_item 1
		assert_equal cart.empty?, false
	end

	def test_adds_items_by_quantity
		cart = Cart.new 
		3.times { cart.add_item 1 }
		assert_equal cart.items.length, 1
		assert_equal cart.items.first.quantity, 3
	end

	def test_gets_product_variations
		cat = Catagory.create!(:title => 'test cat', :slug => 'test_cat')
		product = Product.create!(:title => 'test', :slug => 'test-product', :catagory_id => cat.id)
		variation = ProductVariation.create!(:sku => 'TEST', :title => 'test', :price => 100, :product_id => product.id)
		cart = Cart.new 
		cart.add_item variation.id
		assert_instance_of(ProductVariation, cart.items.first.product)
	end

	def test_sereializes
		cart = Cart.new 
		cart.add_item 1
		assert_equal cart.serialize, session_hash["cart"]
	end

	def test_can_unsearialize
		cart = Cart.build_from_hash session_hash
		assert_equal 1, cart.items.first.product_id
	end

	private 

	def session_hash
		{
			"cart" => {
				"items" => [
					{"product_id" => 1, "quantity" => 1}
				]
			}
		}
	end 

end