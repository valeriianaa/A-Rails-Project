class Contrato < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :persona
  
  has_many :cuotas_por_cliente, dependent: :restrict_with_error

  validates :proyecto_id, :fecha_inicio, :fecha_fin, presence: true
  validate :orden_fechas

  audited
	def anadir_conceptosdepago(fecha1, fecha2)
      vencimientos_conceptos = Vencimiento.where(fecha: fecha1..fecha2).uniq.pluck(:concepto_de_pago_id)
      vencimientos_conceptos.each do |concepto_id|
        cp = ConceptoDePago.find(concepto_id)
        cuota_por_cliente = CuotaPorCliente.new
        cuota_por_cliente.montoTotal= cp.monto
        cuota_por_cliente.estado = false
        cuota_por_cliente.concepto_de_pago_id = concepto_id
        cuota_por_cliente.proyecto_id = self.proyecto_id
        cuota_por_cliente.contrato_id = self.id
        cuota_por_cliente.save
      end
	end

  def contrato_descipcion
    return "#{I18n.localize(self.fecha_inicio, :format => :mes_anio)} - #{I18n.localize(self.fecha_fin, :format => :mes_anio)}"
  end

  def orden_fechas
    if fecha_inicio > fecha_fin
      errors.add(:base, "La fecha de inicio del contrato no puede ser posterior a la fecha de fin")
    end
  end

end
          