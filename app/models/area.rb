class Area < ActiveRecord::Base
	validates :nombre, presence: { message: "Nombre no puede estar en blanco"}
	validates :nombre, uniqueness: { case_sensitive: false, message: "Nombre ya ha sido utilizado" }

	def can_validate
	  true
	end
end
