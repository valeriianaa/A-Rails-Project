class CuotaPorCliente < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :contrato
	belongs_to :concepto_de_pago
	belongs_to :pago, inverse_of: :cuotas_por_cliente
	belongs_to :descuento

	validates :proyecto_id, :concepto_de_pago_id , presence: true
	validates :concepto_de_pago_id, uniqueness: { scope: :proyecto_id, message: "El concepto de pago ya está asociado al proyecto" }

	audited

	def calcular_monto
		concepto = ConceptoDePago.find(self.concepto_de_pago_id)
		monto_inicial = concepto.monto
		monto_retorno = monto_inicial
		concepto.vencimientos.each do |vencimiento|
			if vencimiento.fecha < Date.today
				monto_retorno = monto_inicial * (1 + (vencimiento.interes.porcentaje/100))
			end
		end
		return monto_retorno
	end

	def has_descuento?
		not descuento_id == nil
	end

end
