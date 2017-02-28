class ActividadProyecto < ActiveRecord::Base
	include ActiveModel::Validations
	
	belongs_to :actividad
	belongs_to :proyecto
	belongs_to :estado
	has_many :historiales, dependent: :destroy

	after_update :crear_historial, :pasar_a_siguiente_etapa
	validates_with EstadoValidator, on: :update
	validates_with AntecedenteValidator, on: :update

	audited

	def crear_historial
		h = Historial.new
		h.fechaHora = Time.now
		h.estado_id = self.estado_id
		h.actividad_proyecto_id = self.id
		h.save
	end

	def estado_ultimo_y_obligatorio
		if (self.actividad.obligatorio == true) and (self.estado.ultimo == true)
			return true
		else
			return false
		end
	end

	def actividad_atrasada
		retorno = false
		if self.fechaVencimiento != nil
			if (self.fechaVencimiento < Date.today)
				if (self.estado == nil) or (self.estado.ultimo == false)
					retorno = true
				end
			end
		end
		return retorno
	end

	def pasar_a_siguiente_etapa
		if self.estado_ultimo_y_obligatorio == true
			if self.proyecto.obligatorias_completadas == true
				etapa_anterior = self.proyecto.etapa
				if Etapa.where(etapaAnterior: etapa_anterior).exists?
					etapa_siguiente = Etapa.where(etapaAnterior: etapa_anterior).first
					self.proyecto.update(etapa_id: etapa_siguiente.id)
					self.proyecto.anadir_actividades
				end
			end
		end
	end


end
