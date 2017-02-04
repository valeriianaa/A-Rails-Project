class Historial < ActiveRecord::Base
	belongs_to :actividad_proyecto
	belongs_to :estado
	
	
end
