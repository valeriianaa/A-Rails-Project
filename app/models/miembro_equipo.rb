class MiembroEquipo < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :proyecto

	# def array_proyectos
	audited
end
