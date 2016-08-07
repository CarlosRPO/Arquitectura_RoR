json.extract! user, :id, :name, :last_name, :user_name, :email, :password_digest, :birth_date, :status, :phone, :identification, :created_at, :updated_at
json.url user_url(user, format: :json)