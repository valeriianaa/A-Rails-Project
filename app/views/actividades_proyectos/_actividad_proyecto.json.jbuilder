json.extract! actividad_proyecto, :id, :fechaInicio, :fechaFin, :created_at, :updated_at
json.url actividad_proyecto_url(actividad_proyecto, format: :json)