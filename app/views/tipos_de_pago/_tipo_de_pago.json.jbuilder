json.extract! tipo_de_pago, :id, :nombre, :monto, :plazoInicio, :plazoFin, :created_at, :updated_at
json.url tipo_de_pago_url(tipo_de_pago, format: :json)