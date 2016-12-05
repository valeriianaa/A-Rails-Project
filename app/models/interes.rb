class Interes < ActiveRecord::Base
	has_many :cuotas_por_cliente, dependent: :restrict_with_error

	validates :nombre, :porcentaje, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
end
