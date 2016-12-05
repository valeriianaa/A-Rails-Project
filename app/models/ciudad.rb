class Ciudad < ActiveRecord::Base
	#Esto es una prueba

	belongs_to :provincia
	belongs_to :pais

	has_many :personas, dependent: :restrict_with_error
	has_many :proyectos, dependent: :restrict_with_error

	validates :nombre, presence: true
	#validates :nombre, uniqueness: { case_sensitive: false }
	validates :nombre, uniqueness: { case_sensitive: false, scope: :provincia_id, message: "Ya existe una ciudad con el mismo nombre en esta Provincia" }
	validates :nombre, uniqueness: { case_sensitive: false, scope: [:provincia_id, :pais_id], message: "Ya existe una ciudad con el mismo nombre en esta Provincia y en este País" }
end
