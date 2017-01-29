json.extract! user, :id, :nombre, :created_at, :updated_at
json.url user_url(pais, format: :json)