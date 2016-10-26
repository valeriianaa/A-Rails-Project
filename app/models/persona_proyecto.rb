class PersonaProyecto < ActiveRecord::Base
	belongs_to :persona 
	belongs_to :proyecto
end
