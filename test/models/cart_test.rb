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

	def test_can_get_product_price
		cat = Catagory.create!(:title => 'test cat', :slug => 'test_cat')
		product = Product.create!(:title => 'test', :slug => 'test-product', :catagory_id => cat.id)
		variation = ProductVariation.create!(:sku => 'TEST', :title => 'test', :price => 100, :product_id => product.id)
		cart = Cart.new 
		cart.add_item variation.id
		assert_equal 100, cart.items.first.price.cents
		assert_equal 1.00, cart.items.first.price.dollars
		assert_equal '$1.00', cart.items.first.price.format
	end

	def test_can_total_price_for_products 
		cat = Catagory.create!(:title => 'test cat', :slug => 'test_cat')
		product = Product.create!(:title => 'test', :slug => 'test-product', :catagory_id => cat.id)
		variation1 = ProductVariation.create!(:sku => 'TEST1', :title => 'test1', :price => 100, :product_id => product.id)
		variation2 = ProductVariation.create!(:sku => 'TEST2', :title => 'test2', :price => 200, :product_id => product.id)
		variation3 = ProductVariation.create!(:sku => 'TEST3', :title => 'test3', :price => 300, :product_id => product.id)
		cart = Cart.new 
		cart.add_item variation1.id
		cart.add_item variation1.id
		cart.add_item variation2.id
		cart.add_item variation3.id
		assert_equal 700, cart.total.cents
		assert_equal 7.00, cart.total.dollars
		assert_equal '$7.00', cart.total.format
	end

	def test_gets_parent_product
		cat = Catagory.create!(:title => 'test cat', :slug => 'test_cat')
		product = Product.create!(:title => 'test', :slug => 'test-product', :catagory_id => cat.id)
		variation1 = ProductVariation.create!(:sku => 'TEST1', :title => 'test1', :price => 100, :product_id => product.id)
		cart = Cart.new 
		cart.add_item variation1.id
		assert_equal 'test', cart.items.first.product_parent.title
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