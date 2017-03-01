class Departamento < ActiveRecord::Base
	has_many :roles_de_empleados, dependent: :restrict_with_error
	validates :nombre, presence: true
	validates :nombre, uniqueness: { case_sensitive: false }

	audited
end
