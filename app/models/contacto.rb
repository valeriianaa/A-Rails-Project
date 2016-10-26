class Contacto < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia

	validates :especialidad_de_contacto, presence: true
end
