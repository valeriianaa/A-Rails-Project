json.extract! proyecto, :id, :nombre, :descripcion, :calle, :nroDomicilio, :piso, :dpto, :telefono, :email, :pagWeb, :created_at, :updated_at
json.url proyecto_url(proyecto, format: :json)