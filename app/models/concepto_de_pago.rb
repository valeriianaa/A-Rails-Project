class ConceptoDePago < ActiveRecord::Base
	attr_accessor :diferencia

	has_many :vencimientos, dependent: :destroy
	has_many :intereses
	accepts_nested_attributes_for :vencimientos, :reject_if => lambda { |a| a[:interes_id].blank? }, :allow_destroy => true
	# accepts_nested_attributes_for :vencimientos, reject_if: :all_blank, :allow_destroy => true
	has_many :cuotas_por_cliente, dependent: :restrict_with_error

	validates :codigo, :nombre, :monto, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	validates :codigo, uniqueness: true

	audited

	def concepto_con_vencimiento
		retorno = monto
		if vencimientos.exists?
			vencimientos.each do |v|
				if v.fecha < Date.today
					retorno = retorno * (1 + (v.interes.porcentaje/100))
				end
			end
		end
		return retorno
	end

end
