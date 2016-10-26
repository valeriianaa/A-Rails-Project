class TipoDePago < ActiveRecord::Base
	has_many :pagos, dependent: :restrict_with_exception

	validates :nombre, :monto, presence: true
	validates :nombre, uniqueness: true
end
