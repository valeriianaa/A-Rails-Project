class EstadoValidator < ActiveModel::Validator
  
  def validate(record)
  	if record.historiales.exists?
	  	Historial.where(actividad_proyecto_id: record.id).each do |h|
		    if record.estado_id == h.estado_id
				record.errors.add(:base, "La actividad ya fue actualizada a dicho estado.")
		    end
		end
	end
  end

end