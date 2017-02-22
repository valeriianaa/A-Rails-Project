class EmpleadosPdf < Prawn::Document

	def initialize(empleados)
		super(:top_margin => 70, :page_layout => :landscape)
		@empleados = empleados
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(empleados_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
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