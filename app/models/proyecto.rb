class Proyecto < ActiveRecord::Base
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :etapa
	#belongs_to :persona
	has_many :pagos

	has_many :personas_proyectos, dependent: :destroy
	has_many :personas , :through => :personas_proyectos

	has_many :actividades_proyectos, dependent: :destroy
	has_many :actividades , :through => :actividades_proyectos

	validates :nombre, :descripcion, :calle, :nroDomicilio, :pais_id, :provincia_id, :ciudad_id, :etapa_id, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :telefono, :numericality => { :greater_than => 0}
	validates :dpto, presence: true, if: :piso?
end
