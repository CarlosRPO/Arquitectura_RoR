json.extract! token, :id, :token, :number_of_request, :status, :created_at, :updated_at
json.url token_url(token, format: :json)