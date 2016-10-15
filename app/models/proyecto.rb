class Proyecto < ActiveRecord::Base
	has_many :miembros_equipo , inverse_of: :proyecto
end
