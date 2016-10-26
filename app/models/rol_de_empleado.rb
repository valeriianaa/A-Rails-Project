class RolDeEmpleado < ActiveRecord::Base
	belongs_to :departamento

	validates :nombre, :departamento_id, presence: true
	validates :nombre, uniqueness: { scope: :departamento_id, message: "El nombre del rol ya existe para este departamento" }
end
