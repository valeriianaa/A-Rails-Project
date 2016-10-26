class Actividad < ActiveRecord::Base
	belongs_to :etapa

	has_many :actividades_proyectos, dependent: :destroy
	has_many :actividades , :through => :actividades_proyectos

	serialize :actividadesAntecedentes

	before_save :eliminar_blanco

	validates :nombre, :etapa_id, presence: true
	validates :nombre, uniqueness: true

	def eliminar_blanco
		if self.actividadesAntecedentes != nil
			if self.actividadesAntecedentes[0] == ""
				self.actividadesAntecedentes.shift
			end
		end
	end
end