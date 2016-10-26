class ActividadProyecto < ActiveRecord::Base
	belongs_to :actividad
	belongs_to :proyecto
end
