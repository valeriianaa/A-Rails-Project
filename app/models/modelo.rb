class Modelo < ActiveRecord::Base
	has_many :permisos, dependent: :destroy
	has_many :acciones, through: :permisos
	
	validates :nombre, presence: true
	validates :nombre, uniqueness: true
	#validates :accion_ids, presence: true, :if => :accion?

	def accion?
	  	if Accion.exists?
	  		return true
	  	else
	  		return false
	  	end
	end
end
