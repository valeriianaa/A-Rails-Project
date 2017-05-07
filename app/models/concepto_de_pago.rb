class ConceptoDePago < ActiveRecord::Base

	has_many :vencimientos, dependent: :destroy
	has_many :intereses
	#accepts_nested_attributes_for :vencimientos, :reject_if => lambda { |a| a[:interes_id].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :vencimientos, :allow_destroy => true
	has_many :cuotas_por_cliente, dependent: :restrict_with_error

	validates :codigo, :nombre, :inicio, :monto, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	validates :codigo, uniqueness: true
	validates_associated :vencimientos
	#validate :rangos_fechas

	audited

	def concepto_con_vencimiento
		retorno = monto
		if vencimientos.exists?
			vencimientos.each do |v|
				if v.fecha <= Date.today
					retorno = retorno * (1 + (v.interes.porcentaje/100))
				end
			end
		end
		return retorno
	end

	# def rangos_fechas
	# 	vencimientos.each_with_index do |vencimiento, i|
	# 		if i > 0
	# 			if vencimiento[i].fecha < vencimiento[i-1].fecha
	# 				errors.add(:base, 'Las fechas de vencimiento deben añadirse en orden ascendente')
	# 			end
	# 		end
	# 	end
	# end

end
