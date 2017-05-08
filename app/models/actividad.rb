class Actividad < ActiveRecord::Base
	belongs_to :etapa

	has_many :actividades_proyectos, dependent: :restrict_with_error
	has_many :proyectos, :through => :actividades_proyectos, dependent: :restrict_with_error

	serialize :actividades_antecedentes

	before_save :eliminar_blanco

	after_destroy :eliminar_antecedente

	validates :nombre, :etapa_id, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	validates_with ActividadValidator

	audited
	#VALIDAR que la actividad antecedente y la actividad que se esta creando pertenezcan  a la misma etapa

	HUMANIZED_ATTRIBUTES = {
    :nombre => "Nombre: ",
    :etapa_id => "Etapa: "
  }

  def self.human_attribute_name(*args)
    puts "self.human_attribute_name"
    puts "[args[0]]", args[0]
    HUMANIZED_ATTRIBUTES[args[0]] || super
  end

	def eliminar_blanco
		if self.actividades_antecedentes != nil
			if self.actividades_antecedentes[0] == ""
				self.actividades_antecedentes.shift
			end
		end
	end

	def tiene_antecedentes
		if self.actividades_antecedentes != nil
			if self.actividades_antecedentes != []
				return true
			else
				return false
			end
		else
			return false
		end
	end


	def self.eliminar_antecedente
		Actividad.all.each do |actividad|
			if actividad.tiene_antecedentes == true
				actividad.actividades_antecedentes.each do |antecedente|
					if Actividad.exists?(antecedente) == false
						aux = actividad.actividades_antecedentes.delete(antecedente)
						actividad.update(actividades_antecedentes: aux)
					end
				end
			end
		end
	end

end
