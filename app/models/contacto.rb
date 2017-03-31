class Contacto < Persona
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :especialidad_de_contacto
	#has_many :especialidad_de_contacto
	
	validates :codigo, :especialidad_de_contacto_id , presence: true
	validates :codigo, uniqueness: true

	#audited

	HUMANIZED_ATTRIBUTES = {
    :codigo => "Código: ",
    :nombre => "nombre: ",
    :especialidad_de_contacto_id => "especialidad_de_contacto: "
  }

  def self.human_attribute_name(*args)
    puts "self.human_attribute_name"
    puts "[args[0]]", args[0]
    HUMANIZED_ATTRIBUTES[args[0]] || super
  end
end
