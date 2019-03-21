json.extract! client, :id, :name, :address, :phone, :company_id, :created_at, :updated_at
json.url client_url(client, format: :json)
