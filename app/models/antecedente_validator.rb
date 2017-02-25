class AntecedenteValidator < ActiveModel::Validator
  
  def validate(record)
  	if record.estado.ultimo?
  		actividad = Actividad.find(record.actividad_id)
  		if actividad.tiene_antecedentes == true
  			actividad.actividades_antecedentes.each do |a|
  				antecedente = Actividad.find(a)
  				if antecedente.obligatorio == true
  					ap_antecedente = ActividadProyecto.where(actividad_id: antecedente.id, proyecto_id: record.proyecto.id).first
  					if (ap_antecedente.estado == nil) or (ap_antecedente.estado.ultimo == false) 
  						record.errors.add(:base, "No se puede dar por finalizada la actividad porque existen antecedentes: #{ap_antecedente.actividad.nombre}")
  					end
  				end
  			end
  		end
	end
  end
		
end