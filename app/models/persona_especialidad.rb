class PersonaEspecialidad < ActiveRecord::Base
	belongs_to :persona
	belongs_to :especialidad_de_contacto
end
