class Persona < ActiveRecord::Base
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :tipo_documento
	
	has_many :personas_proyectos, dependent: :destroy
	has_many :proyectos , :through => :personas_proyectos
	has_many :users, dependent: :restrict_with_error
	has_many :contratos, dependent: :restrict_with_error

	has_many :personas_eventos, dependent: :destroy
	has_many :eventos , :through => :personas_eventos

	has_many :personas_especialidades, dependent: :restrict_with_error
	has_many :especialidades_de_contacto, :through => :personas_especialidades, dependent: :restrict_with_error
	
	validates :codigo, :nombre, :apellido, :nroIdentificacion, :tipo, presence: true
	validates :tipo_documento_id, presence: true
	validates :pais_id, :provincia_id, :ciudad_id, :area_id, presence: true
	validates :calle, :nroDomicilio, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true
	#validates :telefono, :numericality => { :greater_than => 0}
	validates :dpto, presence: true, if: :piso?
	  
	validates :nroIdentificacion, uniqueness: { scope: :tipo_documento_id, message: "El numero de documento ya existe para este tipo de documento" }
	validates :codigo, uniqueness: true
	#no es direccion lo que va. A que nivel habria que validar? calle, numero, piso dpto? todos?
    #validates :direccion, uniqueness: { scope: :ciudad_id, message: "la direccion ingresada ya existe para esta ciudad" }
    #before_create :anadir_audit_coment

    #audited :comment_required => true 
    audited

    def nombre_y_apellido
      return "#{nombre} #{apellido}"
    end

    def tipo_y_nro_documento
      tipo_doc = TipoDocumento.find(self.tipo_documento_id)
      return "#{tipo_doc.nombre} #{nroIdentificacion}"
    end

    HUMANIZED_ATTRIBUTES = {
    :codigo => "Código: ",
    :nombre => "Nombre: ",
    :apellido => "Apellido: ",
    :nroIdentificacion => "Número de identificación: ",
    :tipo_documento_id => "Tipo de documento: ",
    :area_id => "Área: ",
    :email => "Correo electrónico: ",
    :calle => "Calle: ",
    :nroDomicilio => "Número de domicilio:"
  }

  def self.human_attribute_name(*args)
    puts "self.human_attribute_name"
    puts "[args[0]]", args[0]
    HUMANIZED_ATTRIBUTES[args[0]] || super
  end
end
