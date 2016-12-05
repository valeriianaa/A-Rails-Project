class Contacto < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :especialidad_de_contacto
	
	validates :especialidad_de_contacto_id , presence: true
end
