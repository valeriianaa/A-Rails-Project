class ContratosPdf < Prawn::Document

	def initialize(contratos, usuario)
		super(:top_margin => 30, :page_layout => :landscape)
		@contratos = contratos
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
		text "Todos los Contratos", size: 12, :align =>:left
	end

	def renderizar_tabla
		move_down 5
		table(contratos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.row(0).align = :center
			t.column_widths = [30,173,173,172,172]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def contratos_items
		[["ID","Proyecto - Código","Responsable del Contrato", "Fecha de Inicio", "Fecha de Finalización"]] +
		@contratos.map do |contrato|
			[contrato.id.to_s, contrato.proyecto.codigo, contrato.persona.nombre_y_apellido, contrato.fecha_inicio, contrato.fecha_fin]		
		end	
	end

end