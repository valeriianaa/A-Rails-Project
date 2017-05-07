class EventoEspecialidad < ActiveRecord::Base
	belongs_to :evento
	belongs_to :especialidad_de_contacto
end
