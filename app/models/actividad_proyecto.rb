class ActividadProyecto < ActiveRecord::Base
	belongs_to :actividad
	belongs_to :proyecto
	belongs_to :estado
	has_many :historiales
	attr_accessor :unEstado, :unaFecha  

	# validate :antecedentes_completados

	# def antecedentes_completados
	# 	act_a_actualizar = Actividad.find(self.actividad_id)
	# 	if act_a_actualizar.actividadesAntecedentes != nil
	# 		if act_a_actualizar.actividadesAntecedentes != ""
	# 			act_a_actualizar.actividadesAntecedentes.each do |a_id|
	# 				act_aux = Actividad.find(a_id.to_i)
	# 				if act_aux.obligatorio?
	# 					act_proy_de_act_aux = ActividadProyecto.where(actividad_id: act_aux.id, proyecto_id: self.actividad_id)
	# 					#historial_aux = Historial.where(actividad_proyecto_id: ActividadProyecto.where(actividad_id: act_aux.id, proyecto_id: self.proyecto_id).id).last
	# 					if act_proy_de_act_aux.estado.ultimo == false
	# 						errors.add(:estado_id, "No se puede actualizar al estado deseado debido a que hay otras actividades que requieren actualización al mismo estado. Verifique las actividades antecedentes de su proyecto.")
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end


	def estado_ultimo_y_obligatorio
		retorno = false
		h = Historial.where(actividad_proyecto_id: self.id).last
		if h.estado.ultimo == true
			a = Actividad.find(self.actividad_id)
			if a.obligatorio == true
				retorno = true
			end
		end
		return retorno
	end

	def transicion_sig_etapa
		cant_obligatorias = Actividad.where(etapa_id: self.proyecto.etapa_id, obligatorio: true).count
		puts 'cant_obligatorias: ', cant_obligatorias
		obl_y_comp = 0
		etapa_actual = Etapa.find(self.proyecto.etapa_id)
		ActividadProyecto.where(proyecto_id: self.proyecto_id, actividad_id: Actividad.where(etapa_id: self.proyecto.etapa_id)).each do |act|
        	if act.estado_id != nil
        		if act.estado_ultimo_y_obligatorio == true
        			obl_y_comp =+ 1
        		end   
        	end  
		end
		puts 'obl_y_comp: ', obl_y_comp
		if cant_obligatorias == obl_y_comp
			Proyecto.update(self.proyecto_id, etapa_id: Etapa.where(etapaAnterior: etapa_actual))
		end
	end
end
