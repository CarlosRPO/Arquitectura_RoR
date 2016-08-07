json.extract! destination, :id, :city, :country, :price, :taxes, :total, :status, :created_at, :updated_at
json.url destination_url(destination, format: :json)