class Vencimiento < ActiveRecord::Base
	belongs_to :concepto_de_pago
	belongs_to :interes

	validates :fecha, :interes_id, presence: true

end
