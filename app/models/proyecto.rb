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
	has_many :contratos
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
		c = Configuracion.last
		if (self.ultima_actividad_actualizada + c.numero_tiempo) < Date.today
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
				
	# def self.alguno_abandonado
	# 	c = Configuracion.last
	# 	if (ultima_actividad_actualizada + numero_tiempo) < Date.today
	# 		return true
	# 	end
	# end

	def acumulativo
    fecha = self.contratos.first.fecha_inicio
    retorno = Array.new
    labels = Array.new
    array_semana = Array.new
    while fecha <= Date.today
    	hash_semana = Hash.new
	    hash_semana[:x] = fecha.beginning_of_week.strftime('%d-%m-%y')
	    contenido = Hash.new
	    Estado.all.each do |e|
	    	if actividades_proyectos.exists?
	    		contenido[e.nombre.to_sym] = actividades_proyectos.where(updated_at: (fecha..fecha + 1.week), estado_id: e.id).count
	    	end
	    end
	    retorno << contenido
	    fecha = fecha + 1.week
	    array_semana << hash_semana
	  end
	  Estado.all.each do |e|
	    labels << e.nombre
	  end
	  return [array_semana , retorno, labels]
  end

  def velocidad
  	fecha = self.contratos.first.fecha_inicio
    retorno = Array.new
    labels = Array.new
    array_semana = Array.new
    while fecha <= Date.today
    	hash_semana = Hash.new
	    hash_semana[:x] = fecha.beginning_of_week.strftime('%d-%m-%y')
    	contenido = Hash.new
	    Estado.all.each do |e|
	    	contenido[e.nombre.to_sym] = historiales.where(created_at: (fecha..fecha + 1.week), estado_id: e.id).count
	    end
	    retorno << contenido
	    fecha = fecha + 1.week
	  	array_semana << hash_semana
		end
		Estado.all.each do |e|
		  labels << e.nombre
		end
		return [array_semana , retorno, labels]
  end

end
