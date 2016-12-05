class RolDeEmpleado < ActiveRecord::Base
	belongs_to :departamento
	has_many :empleados, dependent: :restrict_with_error

	validates :nombre, :departamento_id, presence: true
	validates :nombre, uniqueness: { case_sensitive: false, scope: :departamento_id, message: "El nombre del rol ya existe para este departamento" }
end
