class EventosPdf < Prawn::Document

	def initialize(eventos, usuario)
		super(:top_margin => 30, :page_layout => :landscape)
		@eventos = eventos
		@usuario = usuario
		fecha_impresion
		encabezado_horizontal
		titulo_reporte
		renderizar_tabla
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
 			image image_path, :scale => 0.3, :align => :left, :valign => :top
 			a = "#{c.nombre} - #{c.eslogan}"
 			if width_of(a) > bounds.width
 				a = "#{c.nombre}"
 			end
			text_box a, :at => [(bounds.width - (width_of(a) + (bounds.width - width_of(a))/2)).round, bounds.top - 30], :width => width_of(a)
		end
	end

	def titulo_reporte
		move_down 35
		text "Todos los Eventos", size: 12, :align =>:left
	end

	def renderizar_tabla
		move_down 5
		table(eventos_items,{:cell_style =>{:size => 8}} ) do |t|	
			t.row(0).font_style = :bold
			t.column_widths = [30,170,240,80,70,65,65]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def eventos_items
		[["ID","Código","Nombre","Descripción", "Dia", "Hora", "Expositores"]] +
		@eventos.map do |evento|
			retorno = ""
			if (evento.personas == nil)
				retorno = retorno + "" 
			else
				evento.personas.map do |a|
					retorno = retorno + "#{a.nombre_y_apellido} \n"
				end
			end
			[evento.id.to_s, evento.codigo, evento.nombre, evento.descripcion, evento.dia, evento.hora, retorno]
		end	
	end

end