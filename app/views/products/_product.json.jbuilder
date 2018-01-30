json.extract! product, :id, :title, :slug, :description, :catagory_id, :created_at, :updated_at
json.url product_url(product, format: :json)
