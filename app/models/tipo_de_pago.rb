class TipoDePago < ActiveRecord::Base
	has_many :pagos, dependent: :restrict_with_error

	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
end
