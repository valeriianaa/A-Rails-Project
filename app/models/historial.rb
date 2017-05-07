class Historial < ActiveRecord::Base
	belongs_to :actividad_proyecto
	belongs_to :estado
	belongs_to :user
	
	#validates :estado_id, uniqueness: true
	# before_create :setear_usuario

	# def setear_usuario
	# 	self.user_id = current_user.id
	# end
end
