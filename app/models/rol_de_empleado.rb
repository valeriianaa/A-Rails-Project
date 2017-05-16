class RolDeEmpleado < ActiveRecord::Base
	belongs_to :departamento
	has_many :empleados, dependent: :restrict_with_error

	validates :nombre, :departamento_id, presence: true
	validates :nombre, uniqueness: { case_sensitive: false, scope: :departamento_id, message: "El nombre del rol ya existe para este departamento" }
	audited

	HUMANIZED_ATTRIBUTES = {
    :nombre => "Nombre: ",
    :departamento_id => "Departamento: "
  }

  	def self.human_attribute_name(*args)
	    puts "self.human_attribute_name"
	    puts "[args[0]]", args[0]
	    HUMANIZED_ATTRIBUTES[args[0]] || super
	end
end
