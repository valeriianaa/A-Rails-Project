class AccionPdf < Prawn::Document

	def initialize(accion, usuario)
		super(top_margin: 30)
		@accion = accion
		@usuario = usuario
		fecha_impresion
		encabezado_horizontal
		titulo_reporte
		detalle_accion
		table_modelos
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
		text "Detalle de la Acción", size: 12, :align =>:left
		move_down 10
	end

	def detalle_accion
		table([[{:content => "Accion Id N°: #{@accion.id}", :colspan => 2}],["Nombre", "#{@accion.nombre}"],["Palabra Clave", "#{@accion.key_name}"]]) do |t|
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end
	end

	def table_modelos
		move_down 5
		table([[{:content => "Modelos Asociados", :colspan => 2}]]) do |t|
			t.column(0).font_style = :bold
			t.column(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.width = bounds.width
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end	
		table(modelos_items,{:cell_style =>{:size => 12}} ) do |t|
			t.width = bounds.width
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end	
	end

	def modelos_items
		@accion.modelos.map do |modelo|
			["Modelo",modelo.nombre]
		end	
	end
end