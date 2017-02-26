class EspecialidadDeContacto < ActiveRecord::Base
	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	audited
end
