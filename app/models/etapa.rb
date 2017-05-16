class Etapa < ActiveRecord::Base
	has_many :actividades, dependent: :restrict_with_error
	has_many :proyectos, dependent: :restrict_with_error

	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	validates :etapaAnterior, uniqueness: {message: "de elegirse una etapa antecedente, esta debe ser diferente para cada Etapa"}, :allow_nil => true

	audited
	
	def que_color
		num = self.id
		if (num <= 4)
			return num-1
		else
			return (num%4)-1
		end
	end

	HUMANIZED_ATTRIBUTES = {
    :nombre => "Nombre: ",
    :etapaAnterior => "Etapa anterior: "
  }

  	def self.human_attribute_name(*args)
	    puts "self.human_attribute_name"
	    puts "[args[0]]", args[0]
	    HUMANIZED_ATTRIBUTES[args[0]] || super
	end
end
