class EmpleadoPdf < Prawn::Document

	def initialize(empleado)
		super(top_margin: 70, :page_layout => :landscape)
		@empleado = empleado
		#detalle_top
		detalle_empleado
		table_proyectos
	end

	def detalle_empleado
		table([[{:content => "Empleado Código: #{@empleado.codigo}", :colspan => 2}],["Nombre", "#{@empleado.nombre_y_apellido}"]]) do |t|
			t.width = bounds.width
			t.column(0).font_style = :bold
			t.row(0).font_style = :bold
			t.row(0).background_color = "f4f4f4"
			t.row(0).align = :center
			t.column_widths = [(bounds.width*0.5), (bounds.width* 0.5)]
		end
	end

	def table_proyectos
		move_down 5
		table(proyectos_items,{:cell_style =>{:size => 8}} ) do |t|
			t.row(0).font_style = :bold
			t.column_widths = [50,111,111,111,111,111,111]
			t.row(0).background_color = "f4f4f4"
		end
	end

	def proyectos_items
		[["Codigo","Nombre", "Etapa","Dirección","Teléfono","Correo Electronico", "Página web"]] +
		@empleado.proyectos.map do |proyecto|
			[proyecto.codigo, proyecto.nombre, proyecto.etapa.nombre, "#{proyecto.calle}, #{proyecto.nroDomicilio} piso:#{proyecto.piso} dpto:#{proyecto.dpto}", proyecto.telefono, proyecto.email, proyecto.pagWeb]
		end	
	end
end