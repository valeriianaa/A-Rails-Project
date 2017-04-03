class ActividadesProyectoPdf < Prawn::Document

	def initialize(proyecto, usuario)
		super(top_margin: 30, :page_layout => :landscape)
		@proyecto = proyecto
		@usuario = usuario
		fecha_impresion
		encabezado_horizontal
		titulo_reporte
		detalle_proyecto
		table_actividades_proyectos
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
		text "Informe del Proyecto", size: 12, :align =>:left
		move_down 10
	end

	def detalle_proyecto
		retorno = ""
		@proyecto.miembros_equipo.each do |m|
			retorno = retorno + "#{m.nombre_y_apellido} \n"
		end
		table([[{:content => "Proyecto Código: #{@proyecto.codigo}", :colspan => 2}],["Nombre", "#{@proyecto.nombre}"], ["Descripción", "#{@proyecto.descripcion}"], ["Miembros de Equipo", retorno]]) do |t|
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.column_widths = [(bounds.width*0.3), (bounds.width* 0.7)]
		end
	end

	def table_actividades_proyectos
		move_down 5
		table([["Actividades del Proyecto"]]) do |t|
			t.width = bounds.width
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
		end
		table(actividades_proyectos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [100,124,124,124,124,124]
			t.row(0).background_color = "f4f4f4"
		end
	end

	def actividades_proyectos_items
		[["Etapa","Actividad", "Estado de la Actividad","Fecha Vencimiento","Atrasado","Fecha de la última actualización"]] +
		@proyecto.actividades_proyectos.order(:actividad_id).map do |ap|
			retorno_atrasado, retorno_estado, retorno_fvenc, retorno_fultact = ""
			if ap.actividad_atrasada == true
            	retorno_atrasado = "Atrasado"
            elsif (ap.estado != nil) and (ap.estado.ultimo == true)
            	retorno_atrasado = "Completado"
            else
            	retorno_atrasado = "Pendiente"
        	end
        	if ap.estado != nil
            	retorno_estado = ap.estado.nombre
        	end
        	if ap.fechaVencimiento != nil
            	retorno_fvenc = ap.fechaVencimiento.strftime('%d-%m-%y')
        	end
        	if ap.historiales.exists?
            	retorno_fultact = "#{Historial.where(actividad_proyecto_id: ap.id).last.fechaHora.strftime('%d-%m-%y   %H:%M')}"
        	end
			[@proyecto.etapa.nombre, ap.actividad.nombre, retorno_estado, retorno_fvenc, retorno_atrasado, retorno_fultact]
		end	
	end
end