class PagoMetodo < ActiveRecord::Base
	belongs_to :pago
	belongs_to :tipo_de_pago
end
