class Descuento < ActiveRecord::Base
	has_many :cuotas_por_cliente, dependent: :restrict_with_error
	
	validates :nombre, :porcentaje, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	validates_numericality_of :porcentaje, :greater_than_or_equal_to => 0
	audited
end
