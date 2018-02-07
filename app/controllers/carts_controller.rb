class CartsController < ApplicationController
	before_action :set_shop_catagories
	before_action :init_cart
	layout "storefront"

	def add
		@Cart.add_item params[:id]
		session["cart"] = @Cart.serialize
		redirect_back fallback_location: root_path, notice: "Added to cart"
	end

	def show
	end
end