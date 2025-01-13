json.extract! user, :id, :description, :username, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
