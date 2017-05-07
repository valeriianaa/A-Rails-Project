class Contacto < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	#belongs_to :especialidad_de_contacto
	
	
	validates :especialidad_de_contacto_ids, presence: true
	validates :codigo, uniqueness: true

	#audited

	HUMANIZED_ATTRIBUTES = {
    :especialidad_de_contacto_ids => "Especialidades de contacto: "
  }

  def self.human_attribute_name(*args)
    puts "self.human_attribute_name"
    puts "[args[0]]", args[0]
    HUMANIZED_ATTRIBUTES[args[0]] || super
  end
end
