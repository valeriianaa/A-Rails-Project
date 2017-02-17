class PagoMetodo < ActiveRecord::Base
	belongs_to :pago
	belongs_to :tipo_de_pago

	validates :monto, :presence => true
	validates :monto, :numericality => true

	def can_validate
	  true
	end
end
