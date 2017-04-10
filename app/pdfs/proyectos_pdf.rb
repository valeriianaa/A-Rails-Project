class ProyectosPdf < Prawn::Document

	def initialize(proyectos, usuario)
		super(:top_margin => 30, :page_layout => :landscape)
		@proyectos = proyectos
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
		text "Todos los Proyectos", size: 12, :align =>:left
	end

	def renderizar_tabla
		move_down 5
		table(proyectos_items,{:cell_style =>{:size => 8}} ) do |t|	
			t.row(0).font_style = :bold
			t.column(2).align = :justify
			t.row(0).align = :center
			t.column_widths = [50,100,240,165,80,85]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def proyectos_items
		[["Código","Nombre","Descripción", "Miembros", "Etapa", "Empleado a cargo"]] +
		@proyectos.map do |proyecto|
			retorno = ""
			if (proyecto.miembros_equipo == nil)
				retorno = retorno + "" 
			else
				proyecto.miembros_equipo.map do |a|
					retorno = retorno + "#{a.nombre_y_apellido} \n"
				end
			end
			empleado = ""
			if (proyecto.empleados == nil)
				empleado = empleado + "" 
			else
				proyecto.empleados.map do |a|
					empleado = empleado + "#{a.nombre_y_apellido} \n"
				end
			end
			[proyecto.codigo, proyecto.nombre, proyecto.descripcion, retorno, proyecto.etapa.nombre, empleado]
		end	
	end

end