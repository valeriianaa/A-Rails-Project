class Provincia < ActiveRecord::Base
	belongs_to :pais
	has_many :personas, dependent: :restrict_with_exception
	has_many :proyectos, dependent: :restrict_with_exception
	has_many :ciudades, dependent: :destroy

	validates :nombre, presence: true
	validates :nombre, uniqueness: { scope: :pais_id, message: "Ya existe una provincia con el mismo nombre en este País" }
end
