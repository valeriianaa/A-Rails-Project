json.extract! actividad, :id, :nombre, :descripcion, :obligatorio, :created_at, :updated_at
json.url actividad_url(actividad, format: :json)