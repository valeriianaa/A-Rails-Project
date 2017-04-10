class EmpleadosPdf < Prawn::Document

	def initialize(empleados, usuario)
		super(:top_margin => 30, :page_layout => :landscape)
		@empleados = empleados
		@usuario = usuario
		fecha_impresion
		encabezado_horizontal
		titulo_reporte
		renderizar_tabla
		text "Reporte generado por usuario: #{Persona.find(@usuario.persona_id).nombre_y_apellido}", size: 8, :align => :left, :valign => :bottom
		number_pages "Página <page> de <total>", size: 8, at: [bounds.right - 50, 0]
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
		text "Todas las Actividades", size: 12, :align =>:left
	end

	def renderizar_tabla		
		move_down 5
		table(empleados_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.row(0).align = :center
			t.row(0).background_color = "f4f4f4"
		end
	end

	def empleados_items
		[["ID","Nombre","Apellido", "Tipo y N° Doc", "Departamento", "Rol","Dirección","Teléfono","Correo Electronico"]] +
		@empleados.map do |empleado|
			[empleado.id, empleado.nombre, empleado.apellido, "#{empleado.tipo_documento.nombre} #{empleado.nroIdentificacion}", empleado.departamento.nombre, empleado.rol_de_empleado.nombre, "#{empleado.calle}, #{empleado.nroDomicilio} piso:#{empleado.piso} dpto:#{empleado.dpto}",empleado.telefono, empleado.email]
		end	
	end
end