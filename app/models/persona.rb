class Persona < ActiveRecord::Base
	validates :nombre, :apellido, :nroIdentificacion, presence: true
	# validates :nroIdentificacion, uniqueness: { scope: :tipo_documento_id,
 #    message: "El numero de documento ya existe para este tipo de documento" }

 #    validates :direccion, uniqueness: { scope: :ciudad_id,
 #    message: "la direccion ingresada ya existe para esta ciudad" }
end
