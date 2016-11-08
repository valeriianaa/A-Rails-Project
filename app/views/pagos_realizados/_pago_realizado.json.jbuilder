json.extract! pago_realizado, :id, :fecha, :monto, :created_at, :updated_at
json.url pago_realizado_url(pago_realizado, format: :json)