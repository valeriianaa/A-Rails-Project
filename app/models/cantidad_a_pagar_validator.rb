class CantidadAPagarValidator < ActiveModel::Validator
  
  def validate(record)
  	dinero_entregado = 0
    record.pagos_metodos.each do |pm|
      dinero_entregado = dinero_entregado + pm.monto
    end
    if dinero_entregado < record.monto
      record.errors.add(:base, "El monto indicado en los tipos de pago debe ser superior al total a pagar")
    end
  end
	
end