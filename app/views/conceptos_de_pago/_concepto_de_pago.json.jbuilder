json.extract! concepto_de_pago, :id, :nombre, :descripcion, :monto, :fechaVencimiento, :plazoRecordatorio, :created_at, :updated_at
json.url concepto_de_pago_url(concepto_de_pago, format: :json)