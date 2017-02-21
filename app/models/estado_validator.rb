class EstadoValidator < ActiveModel::Validator
  
  def validate(record)
  	if record.historiales.exists?
	  	h = Historial.where(actividad_proyecto_id: record.id).last
	    if record.estado_id == h.estado_id
			record.errors.add(:base, "No se puede actualizar la actividad al mismo estado")
	    end
	end
  end

end