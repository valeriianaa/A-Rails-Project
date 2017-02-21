class ProyectoEtapaValidator < ActiveModel::Validator
  
  def validate(record)
  	if record.etapa_id_changed?
	  	if record.actividades_proyectos != nil
	  		record.actividades_proyectos.each do |ap|
	  			if (ap.estado == nil) or (ap.estado.ultimo == nil) or (ap.estado.ultimo == false)
	  				record.errors.add(:base, "Existen actividades que deben ser completadas antes de avanzar a otra etapa: #{ap.actividad.nombre}")
	  			end
	  		end
	  	end
	end
  end
  		
end