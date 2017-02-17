class Pago < ActiveRecord::Base

	belongs_to :tipo_de_pago
	belongs_to :proyecto
	belongs_to :persona
	belongs_to :cuenta

	has_many :pagos_metodos, dependent: :destroy
	has_many :tipos_de_pago, :through => :pagos_metodos

	accepts_nested_attributes_for :pagos_metodos, :allow_destroy => true
	
	has_many :cuotas_por_cliente, inverse_of: :pago
	accepts_nested_attributes_for :cuotas_por_cliente, reject_if: :validate_descuentos

	validates :cuota_por_cliente_ids, :presence => true

  protected

  	def validate_descuentos(cuota_attr)
  		cuota_por_cliente_ids.include? cuota_attr['id'].to_i
  	end
end
