class Persona < ActiveRecord::Base
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :tipo_documento
	has_many :personas_proyectos, dependent: :destroy
	has_many :personas , :through => :personas_proyectos
	
	validates :nombre, :apellido, :nroIdentificacion, :email, :telefono, presence: true
	validates :nombre, uniqueness: true, length: { minimum: 3 }
	validates :nroIdentificacion, length: { minimum: 7, maximum: 9 }
	validates :tipo_documento_id, presence: true
	validates :pais_id, :provincia_id, :ciudad_id, presence: true
	validates :calle, :nroDomicilio, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :telefono, :numericality => { :greater_than => 0}
	validates :dpto, presence: true, if: :piso?
	  
	validates :nroIdentificacion, uniqueness: { scope: :tipo_documento_id, message: "El numero de documento ya existe para este tipo de documento" }

	#no es direccion lo que va. A que nivel habria que validar? calle, numero, piso dpto? todos?
    #validates :direccion, uniqueness: { scope: :ciudad_id, message: "la direccion ingresada ya existe para esta ciudad" }

    def nombre_y_apellido
      return "#{nombre} #{apellido}"
    end

    def tipo_y_nro_documento
      tipo_doc = TipoDocumento.find(self.tipo_documento_id)
      return "#{tipo_doc.nombre} #{nroIdentificacion}"
    end
end
