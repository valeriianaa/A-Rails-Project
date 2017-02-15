class Contrato < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :persona

    audited
	def anadir_conceptosdepago(fecha1, fecha2)
      vencimientos_conceptos = Vencimiento.where(fecha: fecha1..fecha2).uniq.pluck(:concepto_de_pago_id)
      vencimientos_conceptos.each do |concepto_id|
        cp = ConceptoDePago.find(concepto_id)
        cuota_por_cliente = CuotaPorCliente.new
        cuota_por_cliente.montoTotal= cp.monto
        cuota_por_cliente.montoAcreditado = 0
        cuota_por_cliente.estado = false
        cuota_por_cliente.concepto_de_pago_id = concepto_id
        cuota_por_cliente.proyecto_id = self.proyecto_id
        cuota_por_cliente.contrato_id = self.id
        cuota_por_cliente.save
      end
	end

end
