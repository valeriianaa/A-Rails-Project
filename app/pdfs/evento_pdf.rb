class EventoPdf < Prawn::Document

	def initialize(evento, usuario)
		super(top_margin: 30, :page_layout => :landscape)
		@evento = evento
		@usuario = usuario
		fecha_impresion
		encabezado_horizontal
		titulo_reporte
		detalle_evento
		table_proyectos
		text "Reporte generado por usuario: #{Persona.find(@usuario.persona_id).nombre_y_apellido}", size: 8, :align => :left, :valign => :bottom
		number_pages "Página <page> de <total>", size: 8, at: [bounds.right - 50, 5]
	end

	def fecha_impresion
		text "#{I18n.l(Time.now, format: :long)}", size: 8, :align => :right, :valign => :top
	end

	def encabezado_horizontal
		if Configuracion.count > 0
			c = Configuracion.last
			image_path = Configuracion.last.logotipo.current_path 
 			image image_path, :fit => [90,90], :align => :left, :valign => :top
 			a = "#{c.nombre} - #{c.eslogan}"
 			if width_of(a) > bounds.width
 				a = "#{c.nombre}"
 			end
			text_box a, :at => [(bounds.width - (width_of(a) + (bounds.width - width_of(a))/2)).round, bounds.top - 30], :width => width_of(a)
		end
	end

	def titulo_reporte
		move_down 35
		text "Proyectos del Evento", size: 12, :align =>:left
	end

	def detalle_evento
		table([[{:content => "Evento Código: #{@evento.codigo}", :colspan => 2}],["Nombre", "#{@evento.nombre}"], ["Día y Hora", "#{I18n.l(@evento.dia, format: :long)}, #{@evento.hora.strftime('%H:%M')}"], ["Expositores", expositores_evento], ["Áreas del Evento", especialidades_evento]]) do |t|
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end
	end

	def expositores_evento
		retorno = ""		
		@evento.personas.map do |a|
			retorno = retorno + "#{a.nombre_y_apellido} \n"
		end
		return retorno
	end

	def especialidades_evento
		retorno = ""
		@evento.eventos_especialidades.map do |a|
			retorno = retorno + "#{a.especialidad_de_contacto.nombre} \n"
		end
		return retorno
	end

	def table_proyectos
		move_down 5
		table(proyectos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [50,111,111,115,111,111,111]
			t.row(0).background_color = "f4f4f4"
		end
	end

	def proyectos_items
		[["Codigo","Nombre", "Etapa","Dirección","Teléfono","Correo Electronico", "Página web"]] +
		@evento.proyectos.map do |proyecto|
			[proyecto.codigo, proyecto.nombre, proyecto.etapa.nombre, "#{proyecto.calle}, #{proyecto.nroDomicilio} piso:#{proyecto.piso} dpto:#{proyecto.dpto}", proyecto.telefono, proyecto.email, proyecto.pagWeb]
		end	
	end
end