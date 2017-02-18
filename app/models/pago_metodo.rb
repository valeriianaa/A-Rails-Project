class PagoMetodo < ActiveRecord::Base
	belongs_to :pago
	belongs_to :tipo_de_pago

	validates :monto, :presence => true, :allow_blank => false
	validates :tipo_de_pago_id, :presence => true
	validates :monto, :numericality => true

	# validates_presence_of :pago
end
