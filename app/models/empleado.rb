class Empleado < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :departamento
	belongs_to :rol_de_empleado

	validates :departamento_id, :rol_de_empleado_id, presence: true
end
