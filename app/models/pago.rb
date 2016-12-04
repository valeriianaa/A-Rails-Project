class Pago < ActiveRecord::Base
	belongs_to :cuota_por_cliente
	belongs_to :tipo_de_pago
	belongs_to :proyecto
	belongs_to :persona
end
