Rails.application.routes.draw do
  resources :product_variations
  resources :products
  resources :catagories
  resource :carts, only: [ :show ] do
    post :add, path: "add/:id", to: 'carts#add'
  end
  
  root 'shop#index'
  
  get 'default/index'
  get 'shop', to: 'shop#index'
  get 'shop/:catagory/:product', to: 'shop#product'
  get 'shop/:catagory', to: 'shop#catagory'

  get 'cart', to: 'cart#index'
  
  get 'order', to: 'order#index'
  
  get '/product_variations/product/:id', to: 'product_variations#variations_by_id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
