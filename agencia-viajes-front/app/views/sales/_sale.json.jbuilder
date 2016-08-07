json.extract! sale, :id, :customer_id, :destination_id, :quantity, :total, :sale_date, :created_at, :updated_at
json.url sale_url(sale, format: :json)