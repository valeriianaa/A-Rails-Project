json.extract! descuento, :id, :nombre, :descripcion, :porcentaje, :created_at, :updated_at
json.url descuento_url(descuento, format: :json)