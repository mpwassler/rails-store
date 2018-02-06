class CartController < ApplicationController
	before_action :init_cart
	
	def add
		@Cart.add_item params[:id]
		session["cart"] = @Cart.serialize
		redirect_back fallback_location: root_path, notice: "Added to cart"
	end
end