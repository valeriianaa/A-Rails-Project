class Contrato < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :persona

	#after_create :anadir_conceptosdepago
    audited
	def anadir_conceptosdepago(fecha1, fecha2)
      ConceptoDePago.where(:fechaVencimiento => fecha1..fecha2).each do |cp|
        cuota_por_cliente = CuotaPorCliente.new
        cuota_por_cliente.montoTotal= cp.monto
        cuota_por_cliente.montoAcreditado = 0
        cuota_por_cliente.estado = "No Pagado"
        cuota_por_cliente.concepto_de_pago_id = cp.id
        cuota_por_cliente.proyecto_id = self.proyecto_id
        cuota_por_cliente.contrato_id = self.id
        cuota_por_cliente.save
      end
	end
end
