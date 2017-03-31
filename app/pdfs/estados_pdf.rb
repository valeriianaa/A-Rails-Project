class EstadosPdf < Prawn::Document

	def initialize(estados, usuario)
		super(:top_margin => 30, :page_layout => :portrait)
		@estados = estados
		@usuario = usuario
		fecha_impresion
		encabezado_horizontal
		titulo_reporte
		renderizar_tabla
		text "Reporte generado por usuario: #{Persona.find(@usuario.persona_id).nombre_y_apellido}", size: 8, :align => :left, :valign => :bottom
		number_pages "Página <page> de <total>", size: 8, at: [bounds.right - 70, 5]
	end

	def fecha_impresion
		text "#{I18n.l(Time.now, format: :long)}", size: 8, :align => :right, :valign => :top
	end

	def encabezado_horizontal
		if Configuracion.count > 0
			c = Configuracion.last
			if c.condicion_iva = "ri"
				retorno = "Responsable Inscripto"
			end
			image_path = Configuracion.last.logotipo.current_path 
 			image image_path, :scale => 0.3, :align => :left, :valign => :top
			text_box "#{c.nombre} - #{c.eslogan}", :at => [bounds.width - 370, bounds.top - 30], :width => bounds.width
		end
	end

	def titulo_reporte
		move_down 35
		text "Todos los Estados", size: 12, :align =>:left
	end

	def renderizar_tabla
		move_down 5
		table(estados_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,160,160,160]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def estados_items
		[["ID","Nombre","Estado Previo", "Ultimo"]] +
		@estados.map do |estado|
			retorno = ""
			if (estado.previous == nil) 
				retorno = "" 
			else
				retorno = "#{Estado.find(estado.previous).nombre}"
			end
			if (estado.ultimo == true)
				[estado.id.to_s, estado.nombre, retorno, "Sí"]
			else
				[estado.id.to_s, estado.nombre, retorno,"No"]
			end		
		end
	end

end