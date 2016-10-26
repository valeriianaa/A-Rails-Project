class Pago < ActiveRecord::Base
	belongs_to :proyecto
	belongs_to :tipo_de_pago

	validates :dia, :proyecto_id, :tipo_de_pago_id, presence: true
end
