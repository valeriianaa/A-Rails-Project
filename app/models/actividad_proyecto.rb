class ActividadProyecto < ActiveRecord::Base
	include ActiveModel::Validations
	
	belongs_to :actividad
	belongs_to :proyecto
	belongs_to :estado
	has_many :historiales, dependent: :destroy

	after_update :crear_historial
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

	def obligatorias_completadas
		cant_obligatorias = Actividad.where(etapa_id: self.proyecto.etapa_id, obligatorio: true).count
		puts 'cant_obligatorias: ', cant_obligatorias
		obl_y_comp = 0
		proyecto_aux = self.proyecto
		ActividadProyecto.where(proyecto_id: self.proyecto_id, actividad_id: Actividad.where(etapa_id: self.proyecto.etapa_id)).each do |act|
			puts 'actividad nombre: ', act.actividad.nombre
        	if act.estado_id != nil
        		if act.estado_ultimo_y_obligatorio == true
        			obl_y_comp = obl_y_comp + 1
        		end   
        	end  
		end
		puts 'obl_y_comp: ', obl_y_comp
		if cant_obligatorias == obl_y_comp
			return true
		else
			return false
			puts 'ahora puede ser'
		end
	end


end
