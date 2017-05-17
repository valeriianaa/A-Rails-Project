class Proyecto < ActiveRecord::Base
	belongs_to :ciudad
	belongs_to :pais
	belongs_to :provincia
	belongs_to :area
	belongs_to :etapa
	belongs_to :departamento
	belongs_to :rol_de_empleado

	belongs_to :persona
	has_many :pagos

	has_one :cuenta
	has_many :contratos, dependent: :restrict_with_error
	has_many :historiales

	has_many :cuotas_por_cliente, dependent: :destroy

	has_many :personas_proyectos, dependent: :destroy
	has_many :personas , :through => :personas_proyectos

	has_many :actividades_proyectos, dependent: :destroy
	has_many :actividades , :through => :actividades_proyectos

	has_many :eventos_proyectos, dependent: :destroy
	has_many :eventos , :through => :eventos_proyectos

	validates :codigo, :nombre, :descripcion, :calle, :nroDomicilio, :pais_id, :provincia_id, :ciudad_id, :etapa_id, :area_id, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true
	validates :dpto, presence: true, if: :piso?
	validates :codigo, uniqueness: true
	
	validates_with ProyectoEtapaValidator, on: :update

	#after_create :anadir_actividades

	audited
	
	def anadir_actividades
	    Actividad.where(:etapa_id => self.etapa_id).each do |act|
	      ap = ActividadProyecto.new
	      ap.proyecto_id= self.id 
	      ap.actividad_id = act.id
	      ap.save
	    end
	end


	def contactos
		return personas.where(type: 'Contacto')
	end

	def empleados
		return personas.where(type: 'Empleado')
	end

	def miembros_equipo
		return personas.where(type: 'MiembroEquipo')
	end

	def encontrar_empleado
		empleado = nil
		PersonaProyecto.where(proyecto_id: self).each do |pp|
			if pp.persona.type == "Empleado"
				empleado = pp.persona
			end
		end
		return empleado
	end

	def ultima_actividad_actualizada
		ultimo_actualizado = actividades_proyectos.first.updated_at
		actividades_proyectos.each do |ap|
			if ap.updated_at > ultimo_actualizado
				ultimo_actualizado = ap.updated_at
			end
		end
		return ultimo_actualizado
	end

	def abandonado
		c = Systemsetting.last
		if (self.ultima_actividad_actualizada + c.numero_tiempo) < Time.now
			return true
		end
	end

	def self.getAbandonados
		proyectos = Array.new
		self.all.each do |p|
      		if p.abandonado == true
        		proyectos << p
      		end
      	end
      	proyectos
    end
				
	def obligatorias_completadas
		cant_obligatorias = Actividad.where(etapa_id: self.etapa_id, obligatorio: true).count
		obl_y_comp = 0
		ActividadProyecto.where(proyecto_id: self.id, actividad_id: Actividad.where(etapa_id: self.etapa_id)).each do |act|
        	if act.estado_id != nil
        		if act.estado_ultimo_y_obligatorio == true
        			obl_y_comp = obl_y_comp + 1
        		end   
        	end  
		end
		if cant_obligatorias == obl_y_comp
			return true
		else
			return false
		end
	end

    def estados_ordenados
        ordenado = []
        semi_ordenado = Estado.all.order("previous")
        semi_ordenado.each_with_index do |item, index|
            if index != semi_ordenado.size - 1
                ordenado[index + 1] = item
            else
                ordenado[0] = item
            end
        end
        return ordenado
    end

      def acumulativo
      	fecha = self.contratos.last.fecha_inicio
      	fecha2 = Date.today
      	array_acumulativo = Array.new
        estados_ordenados.reverse.each_with_index do |e, index|
            array_acumulativo[index] = 0
        end
        if self.contratos.exists?
          	if self.contratos.last.fecha_fin < Date.today
          		fecha2 = self.contratos.last.fecha_fin
          	end
        end

        retorno = Array.new
    	fecha = fecha - 1.week
    	contenido = Hash.new
    	contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
    	
        vector_de_estados = []
        estados_ordenados.reverse.each_with_index do |e, index|
            vector_de_estados[index] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
            if e.ultimo == true
    			array_acumulativo[index] += historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
    			contenido[e.nombre.to_sym] = array_acumulativo[index]
    		else
    			contenido[e.nombre.to_sym] = (historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count + array_acumulativo[index]) - vector_de_estados[0]
                if contenido[e.nombre.to_sym] > vector_de_estados[0]
                    array_acumulativo[index] += vector_de_estados[index]
                else
                    array_acumulativo[index] = 0
                end
    		end
        end
        labels = Array.new
        while fecha <= fecha2
        	contenido = Hash.new
    	    contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
    	    
            vector_de_estados = []
            estados_ordenados.reverse.each_with_index do |e, index|
                vector_de_estados[index] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
                if e.ultimo == true
                    array_acumulativo[index] += historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
                    contenido[e.nombre.to_sym] = array_acumulativo[index]
                else
                    contenido[e.nombre.to_sym] = (historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count + array_acumulativo[index]) - vector_de_estados[0]
                    if contenido[e.nombre.to_sym] > vector_de_estados[0]
                        array_acumulativo[index] += vector_de_estados[index]
                    else
                        array_acumulativo[index] = 0
                    end
                end
            end

    	    retorno << contenido
    	    fecha = fecha + 1.week
    	end
    	contenido = Hash.new
    	contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')

        vector_de_estados = []
        estados_ordenados.reverse.each_with_index do |e, index|
            vector_de_estados[index] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
            if e.ultimo == true
                array_acumulativo[index] += historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
                contenido[e.nombre.to_sym] = array_acumulativo[index]
            else
                contenido[e.nombre.to_sym] = (historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count + array_acumulativo[index]) - vector_de_estados[0]
                if contenido[e.nombre.to_sym] > vector_de_estados[0]
                    array_acumulativo[index] += vector_de_estados[index]
                else
                    array_acumulativo[index] = 0
                end
            end
        end

        retorno << contenido
    	Estado.all.each do |e|
    		labels << e.nombre
    	end
    	return [retorno, labels.reverse]
      end

  def velocidad
  	fecha = self.contratos.last.fecha_inicio
  	fecha2 = Date.today
  	if self.contratos.exists?
        if self.contratos.last.fecha_fin < Date.today
            fecha2 = self.contratos.last.fecha_fin
        end
    end
    retorno = Array.new
	fecha = fecha - 1.week
	contenido = Hash.new
	contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
	Estado.all.each do |e|
    	contenido[e.nombre.to_sym] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
    end
    labels = Array.new
    while fecha <= fecha2
    	contenido = Hash.new
	    contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
	    Estado.all.each do |e|
	    	contenido[e.nombre.to_sym] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
	    end
	    retorno << contenido
	    fecha = fecha + 1.week
	end
	contenido = Hash.new
	contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
	Estado.all.each do |e|
    	contenido[e.nombre.to_sym] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
    end
    retorno << contenido
	Estado.all.each do |e|
		labels << e.nombre
	end
	return [retorno, labels]
  end


end
