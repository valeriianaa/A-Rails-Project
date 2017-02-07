class Proyecto < ActiveRecord::Base
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :etapa
	belongs_to :departamento
	belongs_to :rol_de_empleado

	belongs_to :persona
	has_many :pagos

	has_many :personas_proyectos, dependent: :destroy
	has_many :personas , :through => :personas_proyectos

	has_many :actividades_proyectos, dependent: :destroy
	has_many :actividades , :through => :actividades_proyectos

	has_many :eventos_proyectos, dependent: :destroy
	has_many :eventos , :through => :eventos_proyectos

	validates :nombre, :descripcion, :calle, :nroDomicilio, :pais_id, :provincia_id, :ciudad_id, :etapa_id, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, if: :email?
	validates :dpto, presence: true, if: :piso?

	audited
	
	def anadir_actividades
      Actividad.where(:etapa_id => self.etapa_id).each do |act|
        ap = ActividadProyecto.new
        ap.proyecto_id= self.id 
        ap.actividad_id = act.id
        ap.save
      end
	end
end
