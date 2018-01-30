json.extract! product_variation, :id, :sku, :title, :price, :product_id, :created_at, :updated_at
json.url product_variation_url(product_variation, format: :json)
