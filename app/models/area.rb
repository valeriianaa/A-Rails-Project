class Area < ActiveRecord::Base
	validates :nombre, presence: { message: "Nombre no puede estar en blanco"}
	validates :nombre, uniqueness: { case_sensitive: false, message: "Nombre ya ha sido utilizado" }

	has_many :proyectos, dependent: :restrict_with_error
	has_many :personas, dependent: :restrict_with_error
	has_many :configuraciones, dependent: :restrict_with_error

end
