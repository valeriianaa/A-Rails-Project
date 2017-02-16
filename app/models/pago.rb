class Pago < ActiveRecord::Base
	has_many :cuotas_por_cliente
	belongs_to :tipo_de_pago
	belongs_to :proyecto
	belongs_to :persona
	belongs_to :cuenta

	has_many :pagos_metodos, dependent: :destroy
	has_many :tipos_de_pago, :through => :pagos_metodos

	accepts_nested_attributes_for :pagos_metodos, :allow_destroy => true
	accepts_nested_attributes_for :cuotas_por_cliente

	validates :proyecto_id, :tipo_de_pago_id, :montoAPagar, presence: true
end
