class Cuenta < ActiveRecord::Base
	belongs_to :proyecto

	validates :proyecto_id, uniqueness: { message: ": El proyecto seleccionado ya posee cuenta" }

	audited
end
