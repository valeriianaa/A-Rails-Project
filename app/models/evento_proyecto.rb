class EventoProyecto < ActiveRecord::Base
	belongs_to :evento
	belongs_to :proyecto

	validates :proyecto_id, :evento_id, presence: true
	validates :proyecto_id, uniqueness: { scope: :evento_id, message: "El proyecto ya se encuentra asociado a este proyecto" }

	audited
end
