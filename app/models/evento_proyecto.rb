class EventoProyecto < ActiveRecord::Base
	belongs_to :evento
	belongs_to :proyecto

	validates :proyecto_id, :evento_id, presence: true
	validates :proyecto_id, uniqueness: { scope: :evento_id, message: "El proyecto ya se encuentra asociado a este proyecto" }

	audited

	def self.estadisticas
		retorno, labels = Array.new
		EspecialidadDeContacto.all.each do |especialidad|
			if especialidad.eventos != nil
				contenido = Hash.new 
				contenido[:label] = especialidad.nombre
				contenido[:value] = EventoProyecto.where(evento_id: especialidad.eventos).count
				retorno << contenido
			end
		end
		return retorno
	end
end
