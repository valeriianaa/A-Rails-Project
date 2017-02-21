json.extract! actividad_proyecto, :id, :fechaVencimiento, :created_at, :updated_at
json.url actividad_proyecto_url(actividad_proyecto, format: :json)