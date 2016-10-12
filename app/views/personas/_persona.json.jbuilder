json.extract! persona, :id, :nombre, :apellido, :nroIdentificacion, :fechaNacimiento, :direccion, :telefono, :email, :created_at, :updated_at
json.url persona_url(persona, format: :json)