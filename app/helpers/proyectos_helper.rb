module ProyectosHelper
	def acumulacion_data
		(1.week.ago.to_date..Date.tomorrow).map do |date|
			{
				updated_at: date,
				cantidad: ActividadProyecto.where(proyecto_id: 1, estado_id: 1)
			}
		end
	end
end
