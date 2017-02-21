class Actividad < ActiveRecord::Base
	belongs_to :etapa

	has_many :actividades_proyectos, dependent: :destroy
	has_many :proyectos, :through => :actividades_proyectos

	serialize :actividadesAntecedentes

	before_save :eliminar_blanco

	validates :nombre, :etapa_id, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }
	#VALIDAR que la actividad antecedente y la actividad que se esta creando pertenezcan  a la misma etapa

	def eliminar_blanco
		if self.actividadesAntecedentes != nil
			if self.actividadesAntecedentes[0] == ""
				self.actividadesAntecedentes.shift
			end
		end
	end

	def tiene_antecedentes
		if self.actividadesAntecedentes != nil
			if self.actividadesAntecedentes != []
				return true
			else
				return false
			end
		else
			return false
		end
	end
end
