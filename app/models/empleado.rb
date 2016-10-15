class Empleado < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
end
