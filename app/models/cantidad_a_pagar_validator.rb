class CantidadAPagarValidator < ActiveModel::Validator
  
  def validate(record)
  	dinero_entregado = 0
    monto_a_pagar = 0
    record.cuotas_por_cliente.each do |cuota|
      if cuota.has_descuento?
        monto_a_pagar += cuota.montoTotal * (1 - (cuota.descuento.porcentaje/100))
      else
        monto_a_pagar += cuota.montoTotal 
      end
    end
    record.pagos_metodos.each do |pm|
      dinero_entregado = dinero_entregado + pm.monto
    end
    puts 'dinero_entregado', dinero_entregado
    puts 'monto_a_pagar', monto_a_pagar
    if dinero_entregado < monto_a_pagar
      record.errors.add(:base, "El monto indicado en los tipos de pago debe ser superior al total a pagar")
    end
  end
	
end