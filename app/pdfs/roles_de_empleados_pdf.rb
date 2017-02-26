class RolesDeEmpleadosPdf < Prawn::Document

	def initialize(roles_de_empleados)
		super(:top_margin => 70, :page_layout => :portrait)
		@roles_de_empleados = roles_de_empleados
		renderizar_tabla
		# detalle_bottom
	end

	def renderizar_tabla
		move_down 5
		table(roles_de_empleados_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [60,240,240]
			t.row(0).background_color = "f4f4f4"
		end
	end
	
	def roles_de_empleados_items
		[["ID","Nombre", "Departamento"]] +
		@roles_de_empleados.map do |rol|
			[rol.id.to_s, rol.nombre, rol.departamento.nombre]		
		end	
	end

end