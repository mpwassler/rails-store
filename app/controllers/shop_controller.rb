class ShopController < ApplicationController    
    before_action :set_shop_catagories, only: [:index, :product, :catagory]

    layout "storefront"

    def index
          
        @Products = Product.all 
        render "shop/shop.html.erb"
    end

    def product

        render "shop/product.html.erb"
    end

    def catagory
        @Catagory = Catagory.find_by( slug: params[:catagory])
        puts @Catagory.inspect
        render "shop/catagory.html.erb"
    end
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop_catagories
        @Catagories = Catagory.all       
    end
end