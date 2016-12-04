json.extract! pago, :id, :fecha, :monto, :created_at, :updated_at
json.url pago_url(pago, format: :json)