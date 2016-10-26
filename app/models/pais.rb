class Pais < ActiveRecord::Base
	has_many :personas, dependent: :restrict_with_exception
	has_many :proyectos, dependent: :restrict_with_exception
	has_many :provincias, dependent: :destroy
	
	validates :nombre, presence: true
	validates :nombre, uniqueness: true
end
