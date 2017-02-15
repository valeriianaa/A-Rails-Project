class CuotaPorCliente < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :contrato
	belongs_to :concepto_de_pago
	belongs_to :interes
	belongs_to :descuento

	validates :proyecto_id, :concepto_de_pago_id , presence: true
	validates :concepto_de_pago_id, uniqueness: { scope: :proyecto_id, message: "El concepto de pago ya está asociado al proyecto" }

	estados = ['no pagado', 'pago incompleto', 'pagado']
	audited
	def setear_monto_total
		monto_inicial = ConceptoDePago.find(self.concepto_de_pago_id).monto
		monto_retorno = monto_inicial
		if self.interes_id != nil
			un_interes = Interes.find(self.interes_id).porcentaje
			monto_retorno = monto_retorno * (1 + (un_interes/100))
		end
		if self.descuento_id != nil
			un_descuento = Descuento.find(self.descuento_id).porcentaje
			monto_retorno = monto_retorno * (1 - (un_descuento/100))
		end
		return monto_retorno
	end

	def setear_monto_acreditado(unaCuota)
		retorno = 0
		if Pago.where(cuota_por_cliente_id: unaCuota.id).exists?
			Pago.where(cuota_por_cliente_id: unaCuota.id).each do |pago|
				retorno = retorno + pago.montoAPagar
			end
		end
		return retorno
	end

	def setear_mensaje
	end
end
