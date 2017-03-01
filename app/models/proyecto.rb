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
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, if: :email?
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


  def acumulativo
    fecha = self.contratos.first.fecha_inicio
    retorno = Array.new
	fecha = fecha - 1.week
	contenido = Hash.new
  	contenido_aux = Hash.new
	contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
	Estado.all.each_with_index do |e, i|
		if actividades_proyectos.exists?
			contenido_aux[i] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
	    	contenido[e.nombre.to_sym] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
    	end
    end
    labels = Array.new
    while fecha <= Date.today
	    contenido = Hash.new
	    contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
	    Estado.all.each_with_index do |e,i|
	    	if actividades_proyectos.exists?
	    		contenido[e.nombre.to_sym] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
	    		if contenido_aux[i] < contenido[e.nombre.to_sym]
	    			contenido_aux[i] = contenido[e.nombre.to_sym]
	    		else
	    			contenido[e.nombre.to_sym] = contenido[e.nombre.to_sym] + contenido_aux[i]
	    			contenido_aux[i] = contenido[e.nombre.to_sym]
	    		end
	    	end
	    end
	    retorno << contenido
	    fecha = fecha + 1.week
	end
	contenido = Hash.new
	contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
	Estado.all.each_with_index do |e,i|
    	if actividades_proyectos.exists?
    		contenido[e.nombre.to_sym] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
    		if contenido_aux[i] < contenido[e.nombre.to_sym]
    			contenido_aux[i] = contenido[e.nombre.to_sym]
    		else
    			contenido[e.nombre.to_sym] = contenido[e.nombre.to_sym] + contenido_aux[i]
    			contenido_aux[i] = contenido[e.nombre.to_sym]
    		end
    	end
    end
    retorno << contenido
	Estado.all.each do |e|
	    labels << e.nombre
	end
	return [retorno, labels]
  end

  def velocidad
  	fecha = self.contratos.first.fecha_inicio
    retorno = Array.new
	fecha = fecha - 1.week
	contenido = Hash.new
	contenido[:semana] = fecha.beginning_of_week.strftime('%d-%m-%y')
	Estado.all.each do |e|
    	contenido[e.nombre.to_sym] = historiales.where(fechaHora: (fecha..fecha + 1.week), estado_id: e.id).count
    end
    labels = Array.new
    while fecha <= Date.today
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
