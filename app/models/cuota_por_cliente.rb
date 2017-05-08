class CuotaPorCliente < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :contrato
	belongs_to :concepto_de_pago
	belongs_to :pago, inverse_of: :cuotas_por_cliente
	belongs_to :descuento

	validates :proyecto_id, :concepto_de_pago_id , presence: true
	validates :concepto_de_pago_id, uniqueness: { scope: :proyecto_id, message: "El concepto de pago ya está asociado al proyecto" }

	audited

	after_initialize :calcular_monto
    after_save :calcular_monto
    
	def calcular_monto
		if estado == false
			if montoTotal != concepto_de_pago.concepto_con_vencimiento
				self.update(montoTotal: self.concepto_de_pago.concepto_con_vencimiento)
			end
		end
	end

	def cuotas_atrasadas
		retorno = false
		if self.estado == false
			if self.concepto_de_pago.vencimientos.exists?
				self.concepto_de_pago.vencimientos.each do |v|
					if v.fecha <= Date.today
						retorno = true
					end
				end
			end
		end
		return retorno
	end

	def self.getAtrasadas
    	cuotas = Array.new
		self.all.each do |c|
      		if c.cuotas_atrasadas == true
        		cuotas << c
      		end
      	end
      	cuotas
    end

	def tiene_vencimientos
		if self.concepto_de_pago.vencimientos.exists?
			return true
		else
			return false
		end
	end

	def has_descuento?
		not descuento_id == nil
	end

end
