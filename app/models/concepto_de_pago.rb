class ConceptoDePago < ActiveRecord::Base
	attr_accessor :diferencia

	has_many :cuotas_por_cliente, dependent: :restrict_with_error

	validates :nombre, :monto, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }

	audited
end
