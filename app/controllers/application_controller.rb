class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def init_cart
  	@Cart = Cart.build_from_hash session
  end

  def set_shop_catagories
        @Catagories = Catagory.all       
    end

end
