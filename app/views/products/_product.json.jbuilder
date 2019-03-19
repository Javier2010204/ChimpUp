json.extract! product, :id, :name, :description, :sale_price, :cost_price, :state, :offer_price, :created_at, :updated_at
json.url product_url(product, format: :json)
