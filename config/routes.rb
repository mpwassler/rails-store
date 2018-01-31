Rails.application.routes.draw do
  resources :product_variations
  resources :products
  resources :catagories
  get 'default/index'
  get '/product_variations/product/:id', to: 'product_variations#variations_by_id'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
