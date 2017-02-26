class TipoDePago < ActiveRecord::Base
	
	has_many :pagos_metodos, dependent: :destroy
	has_many :pagos, :through => :pagos_metodos
	has_one :systemsetting

	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	audited
end
