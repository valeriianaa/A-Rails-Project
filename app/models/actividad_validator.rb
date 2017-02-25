class ActividadValidator < ActiveModel::Validator
  
  def validate(record)
    retorno = true
    if record.actividades_antecedentes != nil
      if record.actividades_antecedentes != []
        if record.actividades_antecedentes[0] == ""
          record.actividades_antecedentes.shift
        end
        record.actividades_antecedentes.each do |a|
          if Actividad.find(a.to_i).etapa_id != record.etapa_id
            retorno = false
          end
        end
      end
    end
    if retorno == false
      record.errors.add(:base, "Las actividades antecedentes deben pertenecer a la misma etapa")
    end
  end
		
end