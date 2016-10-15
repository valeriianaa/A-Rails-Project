class Persona < ActiveRecord::Base
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :tipo_documento
	validates :nombre, :apellido, :nroIdentificacion, presence: true
	# validates :nroIdentificacion, uniqueness: { scope: :tipo_documento_id,
 #    message: "El numero de documento ya existe para este tipo de documento" }

 #    validates :direccion, uniqueness: { scope: :ciudad_id,
 #    message: "la direccion ingresada ya existe para esta ciudad" }
end
