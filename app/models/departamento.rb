class Departamento < ActiveRecord::Base
	has_many :roles_de_empleado, dependent: :restrict_with_exception

end
